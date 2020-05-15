;==============================================================================================================================
;מעבר למצב גרפי
proc GraphMode
	call PushAll
	MOV AL, 13H
	MOV AH, 0
	INT 10H
	call PopAll
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

;מחכה שנייה
proc second
	push bp
	call PushAll
	mov cx, 10
	mov dx, 0
	mov ah, 86h
	int 15h
	call PopAll
	pop bp
	ret
endp second

;==============================================================================================================================

;גיבוי רגיסטרים
proc PushAll  							 ;pushes all used the registers to the stack in order for them to maintain their value

	push ax ;pushing ax into the stack
	push bx ;pushing bx into the stack
	push cx ;pushing cx into the stack
	push dx ;pushing dx into the stack
	ret
endp PushAll
;===============================================================================================================================

;החזרת ערכי הרגיסטרים מגיבוי
proc PopAll ;pops all the registers to the stack in order for them to maintain their value

	pop dx ;poping dx from the stack
	pop cx ;poping cx from the stack
	pop bx ;poping bx from the stack
	pop ax ;poping ax from the stack
	ret
endp PopAll

;===============================================================================================================================

macro Receivekey
	mov al, 0
	mov ah,01h
	int 16h 
endm Receivekey

;===============================================================================================================================

;Draws a Pixel
x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [byte ptr bp + 4]

proc drawPixel
	push bp
	mov bp, sp
	call PushAll

	mov ah, 0Ch
	mov al, color
	mov cx, x ; 0 <= x <= 319
	mov dx, y ; 0 <= y <= 199
	int 10h

	call PopAll
	pop bp
	ret 6
endp drawPixel

;==============================================================================================================================

;Draws horizontal line
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineY
	push bp
	mov bp, sp
	call PushAll

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
	call PopAll
	pop bp
	ret 8
endp LineY

;==============================================================================================================================

; Draws vertical line
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineX
	push bp
	mov bp, sp
	call PushAll

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
	call PopAll
	pop bp
	ret 8
endp LineX

;==============================================================================================================================

; The board's outline 
proc outline
	call PushAll
	
	push 297
	push 4
	push 10
	push 20
	call LineY

	push 297
	push 195
	push 10
	push 20
	call LineY

	push 20
	push 195
	push 10
	push 4
	call LineX

	push 297
	push 195
	push 10
	push 4
	call LineX

	call PopAll
	ret
endp outline

;==============================================================================================================================

;Draws a Rectangle
x equ [word ptr bp + 12]
y equ [ word ptr bp + 10]
leng equ [ word ptr bp + 8]
wid equ [word ptr bp + 6]
color equ [byte ptr bp + 4]

proc drawRect
	push bp
	mov bp, sp
	
	mov dx, leng
	add dx, y
	row:	
			mov cx, wid
			add cx, x
		column:
			mov ah, 0Ch
			mov al, color
			mov cx, cx
			mov dx, dx
			int 10h
			dec cx
			cmp cx, x
		jne column
		
			dec dx
			cmp dx, y
	jne row
	
	pop bp
	ret 10
endp drawRect

;==============================================================================================================================

; Creates a spaceship figure

proc spaceship
	call PushAll
	
	push [x1]
	push 180
	push 8
	push 26
	push [color1]
	call drawRect
	
	add [x1], 2
	
	push [x1]
	push 178
	push 2
	push 22
	push [color1]
	call drawRect
	
	add [x1], 8
	
	push [x1]
	push 175
	push 3
	push 6
	push [color1]
	call drawRect
	
	add [x1], 2
	
	push [x1]
	push 173
	push 2
	push 2
	push [color1]
	call drawRect
	
	sub [x1], 12
		
	call PopAll
	ret 
endp spaceship

;==============================================================================================================================

;Movement of the spaceship

proc MoveSS

	call spaceship
	
	keys:
		Receivekey
		
		cmp al, 'a'
		je extract
		cmp al, 'd'
		je extract
		
	extract:
		mov ah,00h
		int 16h
		
		mov [m],al

		cmp [m], 'a'
		je left
		cmp [m], 'd'
		je right
		

	left:
		push [x1]
		push 185
		call CurrentColor
		cmp al, 10
		je keys
		mov [color1], 0
		call spaceship
		mov [color1], 10
		sub [x1], 10
		call spaceship
		jmp keys
		
	right:
		add [x1], 27
		push [x1]
		push 182
		call CurrentColor
		sub [x1], 27
		cmp al, 10
		je keys
		mov [color1], 0
		call spaceship
		mov [color1], 10
		add [x1], 10
		call spaceship
		jmp keys
		
ret
endp MoveSS
	
;==============================================================================================================================

;Receives current color of pixel
x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

proc CurrentColor
	push bp
	mov bp, sp
	push dx
	push cx
	
	mov ah, 0Dh
	mov cx, x ;0 ≤ X ≤ 319
	mov dx, y ;0 ≤ Y ≤ 199
	int 10h
	
	pop cx
	pop dx
	pop bp
	ret 4
endp CurrentColor

;==============================================================================================================================

;Draws aliens
proc aliens
	call PushAll
	
	push 40
	push 50
	push 8
	push 26
	push 13
	call drawRect
	
	;add [x1], 2
	
	;push [x1]
	;push 178
	;push 2
	;push 22
	;push [color1]
	;call drawRect
	
	;add [x1], 8
	
	;push [x1]
	;push 175
	;push 3
	;push 6
	;push [color1]
	;call drawRect
	
	;add [x1], 2
	
	;push [x1]
	;push 173
	;push 2
	;push 2
	;push [color1]
	;call drawRect
	
	;sub [x1], 12
		
	call PopAll
	ret 
endp aliens





;פרוצדורה שמשנה למצב גרפי
proc graphicMod
	push ax
	mov al, 13h
	mov ah, 0
	int 10h
	pop ax
	ret
endp graphicMod

