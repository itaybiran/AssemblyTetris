IDEAL
MODEL small
STACK 100h
DATASEG



CODESEG
start:
mov bx, 7A5Ch

	

exit:
	mov ax, 4c00h
	int 21h
END start


