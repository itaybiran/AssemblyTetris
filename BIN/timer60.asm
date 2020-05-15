IDEAL
MODEL small
STACK 100h
DATASEG
seconds db ?
time db 60h
CODESEG
start:
	mov ax, @data
	mov ds, ax
	mov ah, 2ch
	int 21h
	mov [seconds], dh
	inc [seconds]
loopt:
	mov ah, 2ch
	int 21h
	
	cmp dh, [seconds]
	je add1
	jmp loopt
	
add1:
	inc [seconds]
	mov dl, '0'
	mov ah, 2h
	int 21h
	mov dl, 10
	mov ah, 2h
	int 21h
	mov dl, 13
	mov ah, 2h
	int 21h
	
loopTimer:
	mov ah, 2ch
	int 21h
	cmp dh, [seconds]
	je print1
	jmp loopTimer
	
print1:
	inc [seconds]
	mov dl, [time]
	mov ah, 2h
	int 21h
	dec [time]
	jmp loopTimer
exit:
	mov ax, 4c00h
	int 21h
END start


