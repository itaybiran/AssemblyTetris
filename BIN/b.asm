IDEAL
MODEL small
STACK 100h
DATASEG

var1 dw 8
var2 dw 8
var3 dw ?
re dw ?
CODESEG
proc WhoIsBigger
		pop [re]
		pop [var3]
		pop cx
		cmp [var3], cx
		je equals
		cmp [var3], cx
	ja Num1IsBigger
		mov dl, 'B'
		mov ah, 2h
		int 21h
		jmp endo

	equals:
		mov dl, 'C'
		mov ah, 2h
		int 21h
		jmp endo
		
	Num1IsBigger:
		mov dl, 'A'
		mov ah, 2h
		int 21h
		endo:
		push [re]
		ret
	endp WhoIsBigger

start:
	mov ax, @data
	mov ds, ax
	push [var2]
	push [var1]
	call WhoIsBigger
	
	
	
exit:
	mov ax, 4c00h
	int 21h
END start



