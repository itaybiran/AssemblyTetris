IDEAL
MODEL small
STACK 100h

DATASEG
varOne dw 5h
varTwo dw 8h

CODESEG

proc bigger
	push bp
	push ax
	mov bp, sp
	mov ax, var2
	cmp ax, var1
	je equals
	mov ax, var2
	cmp ax, var1
	jb v1Bigger
	sub sp, 2
	mov ax, var2
	mov records, ax
	
	equals:
	sub sp, 2
	mov records, 0
	jmp endit
	
	v1Bigger:
	sub sp, 2
	mov ax, var1
	mov records, ax
	jmp endit
	
	endit:
	mov ax, records
	add sp, 2
	mov FinalRecord, ax
	pop ax
	pop bp
	ret 4
endp bigger
	
start:
	var1 equ [word ptr bp + 6]
	var2 equ [word ptr bp + 8]
	FinalRecord equ [word ptr bp + 10]
	records equ [word ptr bp - 2]
	
	mov ax, @data
	mov ds, ax
	sub sp, 2
	push [varOne]
	push [varTwo]
	call bigger
exit:
	mov ax, 4c00h
	int 21h
END start



