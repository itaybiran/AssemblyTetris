; מעבר למצב גרפי
proc GraphMode
	MOV AL, 13H
	MOV AH, 0
	INT 10H
	ret
endp GraphMode

;==============================================================================================================================

;חזרה למצב טקסט
proc TextMode
	MOV AL, 3H
	MOV AH, 0
	INT 10H
	ret
endp TextMode

;==============================================================================================================================

;גיבוי רגיסטרים
macro PushAll 
	push ax
	push bx
	push cx
	push dx
	push di
	push si
endm PushAll

;===============================================================================================================================

;החזרת ערכי הרגיסטרים מגיבוי
macro PopAll 
	pop si
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
endm PopAll

;===============================================================================================================================

;פרוצדורה שמציירת פיקסל
x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [byte ptr bp + 4]

proc drawPixel
	push bp
	mov bp, sp
	PushAll

	mov ah, 0Ch
	mov al, color
	mov cx, x ; 0 <= x <= 319
	mov dx, y ; 0 <= y <= 199
	int 10h

	PopAll
	pop bp
	ret 6
endp drawPixel

;==============================================================================================================================

;מצייר קו אופקי
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineY
	push bp
	mov bp, sp
	PushAll
	
	liney1:
		push x
		push y
		push color
		call drawPixel
		
		mov ax, compto
		cmp x, ax
		je endliney
		dec x
	jmp liney1
	endliney:
	PopAll
	pop bp
	ret 8
endp LineY

;==============================================================================================================================

; מצייר קו אנכי
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineX
	push bp
	mov bp, sp
	PushAll
	
	linex1:
		push x
		push y
		push color
		call drawPixel
		
		mov ax, compto
		cmp y, ax
		je endlinex
		dec y
	jmp linex1
	endlinex:
	PopAll
	pop bp
	ret 8
endp LineX

;==============================================================================================================================

; קווי מתאר
proc outline
	PushAll
	
	push 299 
	push 0 
	push 10
	push 20
	call LineY 

	push 299
	push 199
	push 10
	push 20
	call LineY
	
	push 20
	push 199
	push 10
	push 0
	call LineX
	
	push 299
	push 199
	push 10
	push 0
	call LineX


	PopAll
	ret
endp outline
	
	
	
	