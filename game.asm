.model small
.stack 100h
.data
	simon db "SIMON ", "$"
	says db "SAYS!", 13, 10, "$"
	msg1 db "(A MEMORY ENH", "$"
	msg2 db "ANCING GAME)", 13, 10, "$"
	msg3 db "PRESS ENTER TO START", 13, 10, "$"
	;pattern db [0,1,2,3]
.code
    main proc
		mov ax, @data
		mov ds, ax
		mov ax, 0
		;clear screen
		mov ah, 06
		mov al, 00
		mov bh, 00
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		;lower right - green
		mov ah, 06
		mov al, 00
		mov bh, 40
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		;upper right - purple
		mov ah, 06
		mov al, 00
		mov bh, 100
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 79
		int 10h
		;lower left - blue
		mov ah, 06
		mov al, 00
		mov bh, 30
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 39
		int 10h
		;upper left - red
		mov ah, 06
		mov al, 00
		mov bh, 64
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 39
		int 10h
		;set cursor for simon
		mov ah, 02h
		mov bh, 00
		mov dh, 12
		mov dl, 34
		int 10h
		;change text color
		mov ah, 09h
		mov bl, 4eh
		mov cx, 6
		int 10h
		
		int 33h
		mov dx, offset simon
		mov ah, 09h
		int 21h
		
		mov ah, 09h
		mov bl, 6eh
		mov cx, 5
		int 10h
		
		mov dx, offset says
		mov ah, 09h
		int 21h
		;set cursor for msg
		mov ah, 02h
		mov bh, 00
		mov dh, 13
		mov dl, 27
		int 10h
		
		int 33h
		mov dx, offset msg1
		mov ah, 09h
		int 21h
		
		mov ah, 09h
		mov bl, 2eh
		mov cx, 12
		int 10h
		
		int 33h
		mov dx, offset msg2
		mov ah, 09h
		int 21h
		
		;set cursor for MSG3
		mov ah, 02h
		mov bh, 00
		mov dh, 14
		mov dl, 30
		int 10h
		;change text color
		mov ah, 09h
		mov bl, 09Fh
		mov cx, 20
		int 10h
		
		int 33h
		mov dx, offset msg3
		mov ah, 09h
		int 21h
		
		pressEnter:
			mov ah, 01h
			int 21h
			cmp al, 13
			je callGame
			jne pressEnter
			
			callGame:
				call game
		
    main endp
	
	game proc NEAR
		;lower right - green
		mov ah, 06
		mov al, 00
		mov bh, 40
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		;upper right - purple
		mov ah, 06
		mov al, 00
		mov bh, 100
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 79
		int 10h
		;lower left - blue
		mov ah, 06
		mov al, 00
		mov bh, 30
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 39
		int 10h
		;upper left - red
		mov ah, 06
		mov al, 00
		mov bh, 64
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 39
		int 10h
	
		mov ah, 4ch
		int 21h
		
		ret
	game endp
	
end main
