.model small
.stack 100h
.data
	simon db "SIMON ", "$"
	says db "SAYS!", 13, 10, "$"
	msg1 db "(A MEMORY ENH", "$"
	msg2 db "ANCING GAME)", 13, 10, "$"
	msg3 db "PRESS ENTER TO START", 13, 10, "$"
	pattern1 db 31h,34h,33h
	pattern2 db 34h,34h,33h,32h
	pattern3 db 34h,31h,32h,33h,34h,32h
	pattern4 db 31h,32h,33h,34h,32h,31h,31h
	pattern5 db 34h,34h,32h,32h,31h,33h,34h,31h,31h,32h
	pattern6 db 31h,32h,34h,32h,33h,31h,32h,33h,31h,34h,32h
	pattern7 db 34h,32h,31h,33h,33h,32h,31h,34h,33h,34h,31h,32h,33h
	time_delay db 2
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
		mov bh, 2fh
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		;upper right - purple
		mov ah, 06
		mov al, 00
		mov bh, 5fh
		mov ch, 00
		mov cl, 00
		mov dh, 12
		mov dl, 79
		int 10h
		;lower left - blue
		mov ah, 06
		mov al, 00
		mov bh, 1fh
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 39
		int 10h
		;upper left - red
		mov ah, 06
		mov al, 00
		mov bh, 4fh
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
		;clear screen
		mov ah, 06
		mov al, 00
		mov bh, 00
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		
		mov ah, 4ch
		int 21h
		
		ret
	game endp
	
	delay proc NEAR
		mov ah,00
		int 1Ah
		mov bx, dx
			
		mov dx, bx
		
		delay_loop:
			int 1ah
			sub dx,bx
			cmp dl, time_delay
			jl delay_loop	
		ret
		delay endp
	
end main
