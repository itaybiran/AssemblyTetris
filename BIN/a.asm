IDEAL
MODEL small
STACK 100h
DATASEG

r db ?
c db ?
CODESEG
start:
	mov ax, @data
	mov ds, ax
	mov ah, 1h
	int 21h
	sub al, '0'
	mov [r], al
	mov ah, 1h
	int 21h
	sub al, '0'
	mov [c], al
	
	mov [c], 
	
	
	cmp [r], 0
	je exit
	cmp [c], 0
	je exit
	row:
		dec [r]
		mov cl, [c]
		columns:
			mov dl, 'x'
			mov ah, 2h
			int 21h
			loop columns
		mov dl, 0ah
		mov ah, 2h
		int 21h
		cmp [r], 0
		jne row

exit:
	mov ax, 4c00h
	int 21h
END start



