[BITS 16]	 ; 16 bit code generation
[ORG 0x7C00]	 ; ORGin location is 7C00

;Main program
main:		 ; Main program label

mov ah,0x0E	 ; This number is the number of the function in the BIOS to run.
		 ;  This function is put character on screen function
mov bh,0x00	 ; Page number (I'm not 100% sure of this myself but it is best
		 ;  to leave it as zero for most of the work we will be doing)
mov bl,0x07	 ; Text attribute (Controls the background and foreground colour
		 ;  and possibly some other options)
		 ;  07 = White text, black background.
		 ; (Feel free to play with this value as it shouldn't harm 
		 ;  anything)
mov al,'A' 	;  put a charcter 'A' value into al to be displayed
int 0x10	 	; Call the BIOS video interrupt.

jmp $		 ; Put it into a coninuous loop to stop it running off into
		 ;  the memory running any junk it may find there.
		
  		; End matter
times 510-($-$$) db 0	; Fill the rest of the sector with zeros
dw 0xAA55		; Boot signature