IDEAL
MODEL small
STACK 100h
DATASEG
var1 dw 5h
var2 dw 7h


CODESEG
proc change
	push bp
	mov bp, sp

	push ax
	;var2 offset 10
	;var1 offset 8
	;var2 6
	;var1 4
	;ip 2
	;bp 0
	mov ax, var22
	mov offVar1, ax
	mov ax, var11
	mov offVar2, ax
	
	
	pop ax
	pop bp
		ret
	endp change

start:
	var11 equ [word ptr bp + 4]
	var22 equ [word ptr bp + 6]
	offVar1 equ [word ptr bp + 8]
	offVar2 equ [word ptr bp + 10]



	mov ax, @data
	mov ds, ax
	
	push offset var2
	push offset var1
	push [var2]
	push [var1]
	call change
	
exit:
	mov ax, 4c00h
	int 21h
END start



