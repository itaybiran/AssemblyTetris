IDEAL
MODEL small
STACK 100h
DATASEG


CODESEG
start:
	mov ax, @data
	mov ds, ax
	
	xor ax, ax
	jmp Labe
	add ax, 5
	
	Labe:
		add ax, 4
	
exit:
	mov ax, 4c00h
	int 21h
END start


