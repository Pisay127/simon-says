.model small
.stack 100h
.data
	welcomeMsg db "SIMON SAYS!", 13, 10, "$"
.code
    main proc
		mov ax, @data
		mov ds, ax
		mov ax, 0
		
		mov ah, 06
		mov al, 00
		mov bh, 00
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		
		mov ah, 06
		mov al, 00
		mov bh, 40
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		
		mov ah, 06
		mov al, 00
		mov bh, 50
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 79
		int 10h
		
		mov ah, 06
		mov al, 00
		mov bh, 30
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 39
		int 10h
		
		mov ah, 06
		mov al, 00
		mov bh, 64
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 39
		int 10h
		
		int 33h
		mov dx, offset welcomeMsg
		mov ah, 09h
		int 21h
		
		mov ah, 4ch
		int 21h
		
    main endp
end main
