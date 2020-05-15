
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
	
;=============================================================================================================================================	
		
;צבע רקע
color equ [word ptr bp + 4]

proc backgroundColor
	push bp
	mov bp, sp

	add dx, 199
	r:	
		add cx, 319
		co:
			push cx
			push dx
			push color
			call drawPixel
			
			dec cx
			cmp cx, 0
		jne co
		dec dx
		cmp dx, 0
	jne r

	pop bp
	ret 2
endp backgroundColor
	
;=============================================================================================================================================	

;מצייר את הלוח
proc BoardDrawer
	push 7h ; קובע את צבע הרקע לאפור
	call backgroundColor ; מגדיר את צבע הרקע
	push 0
	push 0
	push 0
	call drawPixel
	
	push 58 ;x
	push 0h ; קובע צבע לשחור
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל
	
	push 59 ;x
	push 0h ; קובע צבע לשחור
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל

	push 60 ;x
	push 0ffh;29 ; קובע צבע ללבן
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל
	
	push 160 ;x
	push 0ffh;29 ;קובע צבע ללבן
	call drawLineX ; מצייר את הקו האנכי הראשון מצד ימין
	
	
	push 161 ;x
	push 0h ; קובע צבע לשחור
	call drawLineX ; ; מצייר את הקו האנכי הראשון מצד ימין
	
	push 162
	push 0h ; קובע צבע לשחור
	call drawLineX ; מצייר את הקו האנכי הראשון מצד ימין

	push 15 ;y
	push 0h ; קובע צבע לשחור
	call drawLineY ; מצייר את הקו האופקי הראשון מלמעלה
	
	push 16 ;y
	push 0h ; קובע צבע לשחור
	call drawLineY ; מצייר את הקו האופקי הראשון מלמעלה
	
	push 4h ; קובע צבע לשחור
	call drawFrame ; מצייר את המסגרת של המסך
	
	push 0 ; x
	push 0 ; y
	push 57 ; length
	push 14 ; width
	push 0e0h;3 ;color
	call drawOblong ; מצייר את הריבוע בצידו השמאלי העליון של המסך


	push 0FAh
	call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך

	push 162 ; x
	push 0 ; y
	push 156 ; length
	push 14 ; width
	push 0e0h;3 ;color
	call drawOblong ; מצייר את הריבוע בצידו הימני העליון של המסך
	
	push 0 ; x
	push 16 ; y
	push 57 ; length
	push 181 ; width
	push 0f7h;26 ;color
	call drawOblong ; מצייר את הריבוע בצידו השמאלי התחתון של המסך
	
	push 162 ; x
	push 16 ; y
	push 156 ; length
	push 181 ; width
	push  0f7h;26 ;color
	call drawOblong ; מצייר את הריבוע בצידו הימני התחתון של המסך
	
	push 60
	push 100
	push 17
	push 0ffh;29 ;קובע צבע ללבן
	call drawSmallLineY ; מצייר את הקו הלבן האופקי הראשון בלוח
	
	mov ax, 27 ; draw the Y lines on the board
	DOIt:
		push 61
		push 99
		push ax
		push 0ffh;29 ;קובע צבע ללבן
		call drawSmallLineY
		add ax, 10
		cmp ax, 197
	jne DOIt

		mov ax, 70 ; draw the X lines on the board
	DOIt2:
		push 18
		push 179
		push ax
		push 0ffh;29 ;קובע צבע ללבן
		call drawSmallLineX
		add ax, 10
		cmp ax, 160
	jne DOIt2
	ret
endp BoardDrawer

;=============================================================================================================================================	
		
color equ [word ptr bp + 4]

; פרוצדורה שמציירת מסגרת למסך בהתאם לצבע שנבחר
proc drawFrame

	push 0 ;x
	push 0 ;color ; מגדיר צבע
	call drawLineX ; מצייר קו אנכי בחלקו הימני של מסגרת המסך
	
	push 319 ;x
	push 0 ;color ; מגדיר צבע
	call drawLineX ; מצייר קו אנכי בחלקו השמאלי של מסגרת המסך
	
	push 0 ;y
	push 0 ;color ; מגדיר צבע
	call drawLineY ; מצייר קו אופקי בחלקו העליון של מסגרת המסך
	
	push 199 ;y
	push 0 ;color ; מגדיר צבע
	call drawLineY ; מצייר קו אופקי בחלקו התחתון של מסגרת המסך
	
	push 198 ;y
	push 0 ;color ; מגדיר צבע
	call drawLineY ; מצייר קו אופקי בחלקו התחתון של מסגרת המסך
	
	ret 2
endp drawFrame

;=============================================================================================================================================	
;פרוצדורה שמציירת קו אופקי
y equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc drawLineY
	push bp
	mov bp, sp
	
	mov cx, 319

	startDrawPixelLoopy:
		push cx
		push y
		push color
		call drawPixel
		
		cmp cx, 0
		je endLoopy
	loop startDrawPixelLoopy
	
	endLoopy:
		
		pop bp
		ret 4
endp drawLineY
	
;=============================================================================================================================================	
		
;פרוצדורה שמציירת קו אנכי
x equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc drawLineX
	push bp
	mov bp, sp
	
	mov cx, 199

	startDrawPixelLoopx:
		push x
		push cx
		push color
		call drawPixel
		
		cmp cx, 0
		je endLoopx
	loop startDrawPixelLoopx
	
	endLoopx:
		pop bp
		ret 4
endp drawLineX
	
;=============================================================================================================================================	
		
;פרוצדורה שמציירת קו מנקודה לנקודה
y1 equ [word ptr bp + 10] ; נקודת התחלה של הקו
long equ [word ptr bp + 8] ; אורך הקו
x equ [word ptr bp + 6] ; שיעור האיקס של הקו
color equ [word ptr bp + 4] ; צבע הקו

proc drawSmallLineX
	push bp
	mov bp, sp
	
	mov cx, long
	add cx, y1
	
	startDrawPixelLoopx1:
		push x
		push cx
		push color
		call drawPixel
		
		cmp cx, y1
		je endLoopx1
	loop startDrawPixelLoopx1
	
	endLoopx1:
		pop bp
		ret 8
endp drawSmallLineX
	
;=============================================================================================================================================	
		
;פרוצדורה שמציירת קו מנקודה לנקודה
x1 equ [word ptr bp + 10] ; נקודת התחלה של הקו
long equ [word ptr bp + 8] ; אורך הקו
y equ [word ptr bp + 6] ; שיעור הוואי של הקו
color equ [word ptr bp + 4] ; צבע הקו

proc drawSmallLineY
	push bp
	mov bp, sp
	
	mov cx, long
	add cx, x1
	
	startDrawPixelLoopy1:
		push cx
		push y
		push color
		call drawPixel
		
		cmp cx, x1
		je endLoopy1
	loop startDrawPixelLoopy1
	
	endLoopy1:
		pop bp
		ret 8
endp drawSmallLineY

;=============================================================================================================================================	
		
;פעולה שמציירת ריבוע
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
leng equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc drawRect
	push bp
	mov bp, sp
	
	mov dx, leng
	add dx, y
	rows:	
		mov cx, leng
		add cx, x
		columns:
			push cx
			push dx
			push color
			call drawPixel
			
			dec cx
			cmp cx, x
		jne columns
		dec dx
		cmp dx, y
	jne rows
	
	pop bp
	ret 8
endp drawRect
	
;=============================================================================================================================================	
		
;פעולה שמציירת מלבן
x equ [word ptr bp + 12]
y equ [word ptr bp + 10]
OLength equ [word ptr bp + 8]
OWidth equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc drawOblong
	push bp
	mov bp, sp
	
	mov dx, OWidth
	add dx, y
	row:	
		mov cx, OLength
		add cx, x
		column:
			push cx
			push dx
			push color
			call drawPixel
			dec cx
			cmp cx, x
		jne column
		dec dx
		cmp dx, y
	jne row
	
	pop bp
	ret 10
endp drawOblong
	
;=============================================================================================================================================	
	
x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [word ptr bp + 4]

;פרוצדורה שמציירת קוביה קטנה של 1 על 1
proc draw_Small_Cube
	push bp
	mov bp, sp
	PushAll
	
	dec x ; חישובים לקראת ציור הקו או הריבוע הבא
	
	push x
	push y
	push 10
	push color
	call drawRect

	inc y ; חישובים לקראת ציור הקו או הריבוע הבא
	inc x ; חישובים לקראת ציור הקו או הריבוע הבא
	
	push y ; y
	push 9 ; length
	push x ; x
	push [color_Of_Lines] ; color
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	add x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא

	push y ; y
	push 9 ; length
	push x ; x
	push [color_Of_Lines] ; color
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	sub x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא
	add y, 9 ; חישובים לקראת ציור הקו או הריבוע הבא

	push x ; x
	push 10 ; length
	push y ; y
	push [color_Of_Lines] ; color
	call drawSmallLineY ; מצייר קו אופקי לקוביה


	PopAll
	pop bp
	
	ret 6
endp draw_Small_Cube
	
;=============================================================================================================================================	
		
x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

;פרוצדורה שמציירת קוביה קטנה של 1 על 1
proc draw_Small_Cube_BackGround
	push bp
	mov bp, sp
	PushAll
	
	dec x ; חישובים לקראת ציור הקו או הריבוע הבא
	
	push x
	push y
	push 10
	push 7
	call drawRect

	inc x ; חישובים לקראת ציור הקו או הריבוע הבא
	
	push x ; x
	push 10 ; length
	push y ; y
	push 0ffh;29 ;קובע צבע
	call drawSmallLineY ; מצייר קו אופקי לקוביה

	inc y ; חישובים לקראת ציור הקו או הריבוע הב

	push y ; y
	push 9 ; length
	push x ; x
	push 0ffh;29 ;קובע צבע
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	add x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא

	push y ; y
	push 9 ; length
	push x ; x
	push 0ffh;29 ;קובע צבע
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	sub x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא
	add y, 9 ; חישובים לקראת ציור הקו או הריבוע הבא

	push x ; x
	push 10 ; length
	push y ; y
	push 0ffh;29 ;קובע צבע
	call drawSmallLineY ; מצייר קו אופקי לקוביה

	PopAll
	pop bp
	
	ret 4
endp draw_Small_Cube_BackGround
	
;=============================================================================================================================================	
		
; מצייר כל קוביה לפי הערכים של איקס והוואי של הבלוקים
proc drawALLCubes

	mov ax, [xCube1]
	add ax, [xCube]
	mov bx, [yCube1]
	add bx, [yCube]

	push ax
	push bx
	push [colorBlock]
	call draw_Small_Cube
	
	
	mov ax, [xCube2]
	add ax, [xCube]
	mov bx, [yCube2]
	add bx, [yCube]

	push ax
	push bx
	push [colorBlock]
	call draw_Small_Cube
	
	mov ax, [xCube3]
	add ax, [xCube]
	mov bx, [yCube3]
	add bx, [yCube]
		
	
	push ax
	push bx
	push [colorBlock]
	call draw_Small_Cube

	mov ax, [xCube4]
	add ax, [xCube]
	mov bx, [yCube4]
	add bx, [yCube]
		
	
	push ax
	push bx
	push [colorBlock]
	call draw_Small_Cube

ret
endp drawAllCubes
	
;=============================================================================================================================================	
		
; מצייר רקע לכל קוביה לפי הערכים של האיקס והוואי של הבלוקים
proc drawALLCubes_BackGround

	mov ax, [xCube1]
	add ax, [xCube]
	mov bx, [yCube1]
	add bx, [yCube]

	push ax
	push bx
	call draw_Small_Cube_BackGround
	
	
	mov ax, [xCube2]
	add ax, [xCube]
	mov bx, [yCube2]
	add bx, [yCube]

	push ax
	push bx
	call draw_Small_Cube_BackGround
	
	mov ax, [xCube3]
	add ax, [xCube]
	mov bx, [yCube3]
	add bx, [yCube]
	
	
	push ax
	push bx
	call draw_Small_Cube_BackGround

	mov ax, [xCube4]
	add ax, [xCube]
	mov bx, [yCube4]
	add bx, [yCube]
	
	
	push ax
	push bx
	call draw_Small_Cube_BackGround

ret
endp drawAllCubes_BackGround
