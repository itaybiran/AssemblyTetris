DATASEG

; משתנים לניהול קבצים
	filename db 'zo.txt',0
	filehandle dw ?
	Message db 'Hello world!' ;12
	ErrorMsg db 'Error', 10, 13,'$'
	Buffer db 10 dup(0)
	k db ?
	
;משתנים לניהול התכנית

	Score dw 0 ; ניקוד של השחקן
	xCube dw 180 ; ערך האיקס הגלובלי של הקוביה
	yCube dw 17 ; ערך הוואי הגלובלי של הקוביה
	cubeSize dw 30 ; גודל הקוביה
	cubeColor dw 6 ; צבע הקוביה
	miliSeconds db 0 ; מספר המילי שניות שעברו עד כה
	newMiliseconds db ? ; מספר המילי שניות שעברו עד כה לאחר הלולאה
	timer dw 100 ; מספר אלפיות השנייה שנשארו עד שתעבור שנייה מלאה
	SaveIt db ? ; dx מגבה את
	color_Of_Lines dw 28 ; צבע הקו המחלק את הקוביות
	touchingCheck dw 0
	random dw ?
	TopMessage db 'Score: $'
	Speed dw 100
;=============================================================================================================================================================



CODESEG



;=============================================================================================================================================================



macro OpeningScreanDrawer
	drawNet
	TetrisDrawer
endm OpeningScreanDrawer



;=============================================================================================================================================================



; עושה את האפקט בהתחלה של הופעת המילה טטריס על הרשת
macro drawTheOpeningScrean
	push 0 ; 0 = צבע שחור
	call backgroundColor ;קובע את צבע הרקע לשחור

	call second

	;draw net
		mov ax, 9 ; draw the Y lines on the board
	w:
		push ax
		push 29
		call drawLineY
		add ax, 10
		cmp ax, 199
	jne w

	push 198
	push 29
	call drawLineY
	push 0
	push 29
	call drawLineY
	push 199
	push 29
	call drawLineY
		

	mov ax, 0 ; draw the X lines on the board
	w2:
		push ax
		push 29
		call drawLineX
		add ax, 10
		cmp ax, 320
	jne w2
	
	push 319
	push 29
	call drawLineX

	call second 
	call second

	TetrisDrawer 
	
	OpeningScreanDrawer
	
	call second
	call second 

	push 0 ; 0 = צבע שחור
	call backgroundColor ;קובע את צבע הרקע לשחור

endm drawTheOpeningScrean



;=============================================================================================================================================================



;מצייר את הלוח
macro BoardDrawer
	push 7h ; קובע את צבע הרקע לאפור
	call backgroundColor ; מגדיר את צבע הרקע
	
	push 58 ;x
	push 0h ; קובע צבע לשחור
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל
	
	push 59 ;x
	push 0h ; קובע צבע לשחור
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל

	push 60 ;x
	push 29 ; קובע צבע ללבן
	call drawLineX ; מצייר את הקו האנכי הראשון מצד שמאל
	
	push 160 ;x
	push 29 ;קובע צבע ללבן
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
	push 3 ;color
	call drawOblong ; מצייר את הריבוע בצידו השמאלי העליון של המסך

	push 59 ; x
	push 0 ; y
	push 101 ; length
	push 14 ; width
	push 6 ;color
	call drawOblong ; מצייר את הריבוע האמצעי העליון של המסך

	push 162 ; x
	push 0 ; y
	push 156 ; length
	push 14 ; width
	push 3 ;color
	call drawOblong ; מצייר את הריבוע בצידו הימני העליון של המסך
	
	push 0 ; x
	push 16 ; y
	push 57 ; length
	push 181 ; width
	push 26 ;color
	call drawOblong ; מצייר את הריבוע בצידו השמאלי התחתון של המסך
	
	push 60
	push 100
	push 17
	push 29
	call drawSmallLineY ; מצייר את הקו הלבן האופקי הראשון בלוח
	
	mov ax, 27 ; draw the Y lines on the board
	DOIt:
		push 61
		push 99
		push ax
		push 29
		call drawSmallLineY
		add ax, 10
		cmp ax, 197
	jne DOIt

		mov ax, 70 ; draw the X lines on the board
	DOIt2:
		push 18
		push 179
		push ax
		push 29
		call drawSmallLineX
		add ax, 10
		cmp ax, 160
	jne DOIt2
endm BoardDrawer



;=============================================================================================================================================================



macro Start_The_Game

	Game: ; לולאת המשחק
		;push 2 										; מספר הקוביות הקיימות במשחק
		;call TheNextCubeToPlay 						; מגריל את מספר הקוביה הבאה שתרד 
	
		;cmp [random], 0								; אם קוביה 1 נבחרה תוריד אותה
		;je c1
		
		;cmp [random], 1								; אם קוביה 2 נבחרה תוריד אותה
		;je c2
	
		
		c1:				; במקרה ועכשיו תור קוביה 1 לרדת, זה קטע הקוד שיתבצע וידאג כי הקוביה תרד ותפעל כראוי עד שתינחת על משהו	
		
			call cube1_Turn
			;jmp TheCubeStoped 						; קפוץ ללאחר שהקוביה עצרה
			
		c2:
			call cube2_Turn 
			jmp TheCubeStoped						; קפוץ ללאחר שהקוביה עצרה
			
			
			
		TheCubeStoped: 									; כשהקוביה עצרה
			
			destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם
			
			call endGameCheck 							; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je EndGame 									; אם היא נגעה לולאת המשחק תסתיים
	
	jmp Game 											; סיום לולאת המשחק
	
	EndGame:
	
	
endm Start_The_Game



;=============================================================================================================================================================


proc cube1_Turn

			push 9									; הקוביה יכולה לצאת מכל מקום במסך
			call getCubeStartingPoint	

		cube1:
			; קובע את ההגדרות של הקוביה שתיווצר
			mov ax, [random]	
			mov [xCube], ax	; X of the cube: 60/70/80/90/100/110/120/130/140
			
			mov [yCube], 17 ; Y of the cube: final
			mov [cubeSize],20 ; size of the cube: final
			mov [cubeColor], 9 ; color of the cube
			
			push [xCube]
			push [yCube]
			push [cubeSize]
			push [cubeColor]
			call drawCube1 ; draw the cube
			
			moveCube_1: ; move down the cube

				call printScore			
				mov [touchingCheck], 0			
				mov [SaveIt], dl ; dx מגבה את 
				
				call movment_1 ; מזיז את הקוביה לצדדים לפי קלט
				
				cmp [touchingCheck], 1
				je stopMovingCube_1
				
				;:קטע קוד שאחראי לבדוק מתי עברה שנייה				
				
				mov dl,  [SaveIt] ;  מוציא את די איקס מגיבוי
				call readTime
			
				;xor dh, dh
				mov [newMiliseconds], dl
				
				cmp dl, [miliSeconds]
				jb add1000_1
				jmp fine_1
				
				add1000_1:
					;xor dh, dh
					add dl, 100
				fine_1:
					sub dl, [miliSeconds]
				xor dh, dh
					sub [timer], dx
					mov dl, [newMiliseconds]
					mov [miliSeconds], dl
					cmp [timer], 0
			jge moveCube_1
				
				SecondPast_1:
				
					call cubeTouchedCheck1 ; בודק אם קוביה 1 נגעה במשהו
		
					cmp dx, 1 ; אם היא כן נגעה
					je stopMovingCube_1 ; אז תפסיק להניע את הקוביה
					
					cmp [touchingCheck], 1 ; בודק אם הקוביה כבר נחתה על משהו
					je YesItTouched_1 ;אם הקוביה נגעה
					
					call moveDown1 ; מוריד את קוביה 1 למטה
					
					YesItTouched_1:
					mov ax, [Speed]
					mov [timer], ax; מאפס את הטיימר
					
			jmp moveCube_1 ; אם היא לא נגעה המשך להניע אותה
					
			stopMovingCube_1: ; הפסק להניע את הקוביה
				mov ax, [Speed]
				mov [timer], ax ; מאפס את הטיימר
				push [xCube]
				push [yCube]
				push [cubeSize]
				push [cubeColor]
				call drawCube1 ; מצייר את המקום האחרון בו הייתה הקוביה
		
			ret
endp cube1_Turn



;=============================================================================================================================================================



; קוביה 2 יורדת למטה
proc cube2_Turn
											
		push 7									; הקוביה יכולה לצאת מכל מקום במסך
		call getCubeStartingPoint	
		
		cube2:
			; קובע את ההגדרות של הקוביה שתיווצר
			mov ax, [random]	
			mov [xCube], ax	; X of the cube: 60/70/80/90/100/110/120
			
			mov [yCube], 17 ; Y of the cube: final
			mov [cubeColor], 4 ; color of the cube
			
			push [xCube]
			push [yCube]
			push [cubeColor]
			call drawCube2 ; draw the cube
			
			moveCube_2: ; move down the cube

				call printScore			
				mov [touchingCheck], 0			
				mov [SaveIt], dl ; dx מגבה את 
				
				call movment_2 ; מזיז את הקוביה לצדדים לפי קלט
				
				cmp [touchingCheck], 1
				je stopMovingCube_2
				
				;:קטע קוד שאחראי לבדוק מתי עברה שנייה				
				
				mov dl,  [SaveIt] ;  מוציא את די איקס מגיבוי
				call readTime
			
				;xor dh, dh
				mov [newMiliseconds], dl
				
				cmp dl, [miliSeconds]
				jb add1000_2
				jmp fine_2
				
				add1000_2:
					;xor dh, dh
					add dl, 100
				fine_2:
					sub dl, [miliSeconds]
				xor dh, dh
					sub [timer], dx
					mov dl, [newMiliseconds]
					mov [miliSeconds], dl
					cmp [timer], 0
			jge moveCube_2
				
				SecondPast_2:
				
					call cubeTouchedCheck_2 ; בודק אם קוביה 1 נגעה במשהו
		
					cmp dx, 1 ; אם היא כן נגעה
					je stopMovingCube_2 ; אז תפסיק להניע את הקוביה
					
					cmp [touchingCheck], 1 ; בודק אם הקוביה כבר נחתה על משהו
					je YesItTouched_2 ;אם הקוביה נגעה
					
					call moveDown_2 ; מוריד את קוביה 1 למטה
					
					YesItTouched_2:
					mov ax, [Speed]
					mov [timer], ax; מאפס את הטיימר
					
			jmp moveCube_2 ; אם היא לא נגעה המשך להניע אותה
					
			stopMovingCube_2: ; הפסק להניע את הקוביה
				mov ax, [Speed]
				mov [timer], ax ; מאפס את הטיימר
				push [xCube]
				push [yCube]
				push [cubeColor]
				call drawCube2 ; מצייר את המקום האחרון בו הייתה הקוביה
			ret
endp cube2_Turn



;=============================================================================================================================================================



;גיבוי רגיסטרים
macro PushAll 
	push ax
	push bx
	push cx
	push dx
	push di
	push si
endm PushAll



;=============================================================================================================================================================



;החזרת ערכי הרגיסטרים מגיבוי
macro PopAll 
	pop si
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
endm PopAll



;=============================================================================================================================================================



;פרוצדורה שמתחילה את התכנית
proc begin
	mov ax, @data
	mov ds, ax
	ret
endp begin



;=============================================================================================================================================================



;פרוצדורה שיוצאת מהתכנית
proc escape
	push ax
	mov ax, 4c00h
	int 21h
	pop ax
	ret
endp escape



;=============================================================================================================================================================



;קליטת תו מהמשתמש
proc inputTav
	mov ah, 1h
	int 21h
	ret
endp inputTav ; al = ASCII of the tav


;=============================================================================================================================================================



;dl -מדפיס את התו שב
proc printTav
	mov ah, 2h
	int 21h
	ret
endp printTav



;=============================================================================================================================================================



;dx -מדפיס מחרוזת שנגמרת ב$ והאופסט שלה ב 
proc printString
	mov ah, 9h
	int 21h
	ret
endp printString



;=============================================================================================================================================================



;קריאת השעה
proc readTime
	;mov al, 0
	mov ah, 2ch
	int 21h
		
	ret
endp readTime ; ch = hours     cl = minutes     dh = seconds     dl = miliseconds 



;=============================================================================================================================================================



;מחכה שנייה
proc second
	push bp
	PushAll
	mov cx, 10
	mov dx, 0
	mov ah, 86h
	int 15h
	PopAll
	pop bp
	ret
endp second
	
	
	
;=============================================================================================================================================================



;פרוצדורה שמשנה למצב גרפי
proc graphicMod
	push ax
	mov al, 13h
	mov ah, 0
	int 10h
	pop ax
	ret
endp graphicMod



;=============================================================================================================================================================



;פותח רמקול
proc openSpeaker
	in al, 61h
	or al, 00000011b
	out 61h, al
	ret
endp openSpeaker



;=============================================================================================================================================================



;סוגר רמקול
proc closeSpeaker
	in al, 61h
	and al, 11111100b
	out 61h, al
	ret
endp closeSpeaker



;=============================================================================================================================================================


;מנגן את התו דו
proc playDo
	mov al, 0dbh
	out 42h, al
	mov al, 11h
	out 42h, al
	ret
endp playDo



;=============================================================================================================================================================


;מנגן את התו לה
proc playLa
	mov al, 98h
	out 42h, al
	mov al, 0Ah
	out 42h, al
	ret
endp playLa



;=============================================================================================================================================================


;מנגן את התו רה
proc playRe
	mov al, 0DAh
	out 42h, al
	mov al, 0Fh
	out 42h, al
	ret
endp playRe



;=============================================================================================================================================================



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



;=============================================================================================================================================================



;פרוצדורה שמקבלת צבע נוכחי של פיקסל
x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

proc getPixel
	push bp
	mov bp, sp
	push dx
	push cx

	mov ah, 0Dh
	mov cx, x ; 0 <= x <= 319
	mov dx, y ; 0 <= y <= 199
	int 10h

	pop cx
	pop dx
	pop bp
	ret 4
endp getPixel ; al = color



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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
	ret 8
endp drawOblong



;=============================================================================================================================================================



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



;=============================================================================================================================================================



; מצייר רשת מאחורי כל המסך
macro drawNet

	mov ax, 9 ; draw the Y lines on the board
	t:
		push ax
		push 29
		call drawLineY
		add ax, 10
		cmp ax, 199
	jne t

	push 198
	push 29
	call drawLineY
	push 0
	push 29
	call drawLineY
	push 199
	push 29
	call drawLineY
		

	mov ax, 0 ; draw the X lines on the board
	t2:
		push ax
		push 29
		call drawLineX
		add ax, 10
		cmp ax, 320
	jne t2
	
	push 319
	push 29
	call drawLineX

endm drawNet



;=============================================================================================================================================================



;מזיז למטה את קוביה 1
proc moveDown1

	push [xCube]
	push [yCube]
	push [cubeSize]
	push 7h
	call drawRect

	mov ax, [yCube]
	inc ax
	push ax
	push [cubeSize]
	mov ax, [xCube]
	add ax, 10
	push ax
	push 29
	call drawSmallLineX

	mov ax, [yCube]
	inc ax
	push ax
	push [cubeSize]
	mov ax, [xCube]
	add ax, 20
	push ax
	push 29
	call drawSmallLineX

    mov ax, [yCube]
	inc ax
	push ax
	push 19
	mov ax, [xCube]
	push ax
	push 29
	call drawSmallLineX

	mov ax, [xCube]
	;inc ax
	push ax
	push [cubeSize]
	mov ax, [yCube]
	add ax, 10
	push ax
	push 29
	call drawSmallLineY

	add [yCube], 10
	 
	push [xCube]
	push [yCube]
	push [cubeSize]
	push [cubeColor]
	call drawCube1

	ret
endp moveDown1


;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו
proc cubeTouchedCheck1
	mov dx, 0
	mov cx, [cubeSize]
	add cx, [xCube]
    dec cx
	mov bx, [yCube]
	add bx, [cubeSize] 
	inc bx

	ThisIsLoop_1:
	
		push cx
		push bx
		call getPixel
		
		cmp al, 7h
		jne addOneTouchingCheck_1_1
		ok_1:
			dec cx
			cmp cx, [xCube]
	jne ThisIsLoop_1
	jmp stop_1
	
	addOneTouchingCheck_1_1:
		cmp al, 29
		jne addOneTouchingCheck_1_2
	jmp ok_1
	
	addOneTouchingCheck_1_2:
		mov dx, 1
		
	stop_1:

	ret
endp cubeTouchedCheck1 ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו מצד שמאל
proc cube_touched_blook_or_wall_Left1

	mov dx, 0
	
	;Left chacking
	xor cx, cx
	xor bx, bx
	mov cx, [yCube]
	add cx, [cubeSize] 
	dec cx
	mov bx, [xCube]
    dec bx

	checkEveryPixelLeft_1:
	
		push bx
		push cx
		call getPixel
	
		cmp al, 7h
		jne changeToYesLeft_1_1
		allrightLeft_1:
			dec cx
			cmp cx, [yCube]
	jne checkEveryPixelLeft_1
	jmp stopLeft_1
	
	changeToYesLeft_1_1:
		cmp al, 29
		jne changeToYesLeft_1_2
	jmp allrightLeft_1
	
	changeToYesLeft_1_2:
		mov dx, 1
		
	stopLeft_1:

	ret
endp cube_touched_blook_or_wall_Left1 ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו מצד ימין
proc cube_touched_blook_or_wall_Right1

	mov dx, 0
	
	;Right chacking
	xor cx, cx
	xor bx, bx
	mov cx, [yCube]
	add cx, [cubeSize] 
	dec cx
	mov bx, [cubeSize]
	add bx, [xCube]
    inc bx

	checkEveryPixelRight_1:
	
		push bx
		push cx
		call getPixel
		
	
		cmp al, 7h
		jne changeToYesRight_1_1
		allrightRight_1:
			dec cx
			cmp cx, [yCube]
	jne checkEveryPixelRight_1
	jmp stopRight_1
	
	changeToYesRight_1_1:
		cmp al, 29
		jne changeToYesRight_1_2
	jmp allrightRight_1
	
	changeToYesRight_1_2:
		mov dx, 1
		
	stopRight_1:
	
	ret

endp cube_touched_blook_or_wall_Right1



;=============================================================================================================================================================



;בודק אם המשתמש הפסיד והמשחק נגמר
proc endGameCheck
	mov dx, 0
	mov cx, 159
	
	startCheckPixel1:
		push cx
		push 19
		call getPixel
		
		cmp al, 7 ;check if the color is grey
		jne ItIsNotGrey ;if it isn't jump to another check
		continueChecking:
			cmp cx, 61
			je endLoop
	loop startCheckPixel1
	
	ItIsNotGrey:
		cmp al, 29 ;check if the color is white
		jne ItIsNotGreyOrWhite ;if it isn't the color is not board's color and we need to end the game
		jmp continueChecking
		
		jmp endLoop
		ItIsNotGreyOrWhite:
			mov dx, 1

	endLoop:
	ret
endp endGameCheck



;=============================================================================================================================================================



;פרוצדורה שמציירת את קוביה מספר 1
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
leng equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc drawCube1
	push bp
	mov bp, sp
	
	push x
	push y
	push leng
	push color
	call drawRect

	mov ax, y
	inc ax
	push ax
	mov ax, leng
	dec ax
	push ax
	mov ax, x
	add ax, 10
	push ax
	push 28
	call drawSmallLineX

	mov ax, x
	inc ax
	push ax
	push 19
	mov ax, y
	add ax, 10
	push ax
	push 28
	call drawSmallLineY

	mov ax, x
	inc ax
	push ax
	push 19
	mov ax, y
	add ax, 20
	push ax
	push 28
	call drawSmallLineY

	mov ax, y
	inc ax
	push ax
	push 19
	mov ax, x
	add ax, 20
	push ax
	push 28
	call drawSmallLineX

	mov ax, y
	inc ax
	push ax
	push 19
	mov ax, x
	add ax, 0
	push ax
	push 7h
	call drawSmallLineX
	
	pop bp
	ret 8
endp drawCube1



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 1 לפי קלט המשתמש
proc movment_1
	mov [touchingCheck], 0
	mov al, 0
	mov ah,01h
	int 16h 
	
	cmp al, 'd' 
	je extract_key

	cmp al, 'a'
	je extract_key
	
	cmp al,'s'
	je extract_key

	ret
	
	extract_key:
	
		mov ah,00h
		int 16h
		
		mov [k],al

		cmp [k], 'd'
		je d
		cmp [k], 'a'
		je a
		cmp [k],'s'
		je s
		
	
	d: ; right
		cmp [touchingCheck], 1
		je stopAll
		
		call cube_touched_blook_or_wall_Right1 ;בודק אם הקוביה נגעה במשהו מימין
		cmp dx, 1
		je stopAll
		
		call drawTheBackgroundAgain_1 ; מצייר את הרקע שוב
	
		add [xCube], 10
		 
		push [xCube]
		push [yCube]
		push [cubeSize]
		push [cubeColor]
		call drawCube1

		ret

	a: ; left
		cmp [touchingCheck], 1
		je stopAll
		
		
		call cube_touched_blook_or_wall_Left1 ;בודק אם הקוביה נדעה במשהו משמאל
		cmp dx, 1
		je stopAll
		
		call drawTheBackgroundAgain_1 ; מצייר את הרקע שוב
		
		sub [xCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeSize]
		push [cubeColor]
		call drawCube1
		
		ret
	s: ; down
		
		call cubeTouchedCheck1 ; בודק אם קוביה 1 נגעה במשהו

		cmp dx, 1 ; אם היא כן נגעה
		je DoNotMove ; אל תרד למטה
		
		call moveDown1 ; אחרת רד למטה
		
		DoNotMove:
	
		mov [touchingCheck], dx ; si = 1 - touched      0 - didn't touched
		
		ret
		
	stopAll:
	
ret
endp movment_1



;=============================================================================================================================================================



; פרוצדורה שמציירת שוב את הרקע מאחורי קוביה 1
proc drawTheBackgroundAgain_1
		push [xCube]
		push [yCube]
		push [cubeSize]
		push 7h
		call drawRect

		mov ax, [yCube]
		inc ax
		push ax
		push 19
		mov ax, [xCube]
		add ax, 10
		push ax
		push 29
		call drawSmallLineX

		mov ax, [yCube]
		inc ax
		push ax
		push 19
		mov ax, [xCube]
		add ax, 20
		push ax
		push 29
		call drawSmallLineX

		mov ax, [yCube]
		inc ax
		push ax
		push 19
		mov ax, [xCube]
		push ax
		push 29
		call drawSmallLineX

		mov ax, [xCube]
		;inc ax
		push ax
		push [cubeSize]
		mov ax, [yCube]
		add ax, 10
		push ax
		push 29
		call drawSmallLineY
		
		mov ax, [xCube]
		push ax
		push [cubeSize]
		mov ax, [yCube]
		add ax, 20
		push ax
		push 29
		call drawSmallLineY
		
		ret
endp drawTheBackgroundAgain_1



;=============================================================================================================================================================


; מצייר את המילה טטריס על המסך בגדול
	macro TetrisDrawer 
	
	;I:
		push 225 ;x
		push 69 ;y
		push 20 ;length
		push 70 ;width
		push 11 ;color
		call drawOblong
		
		push 225 ;x
		push 84 ;y
		push 20 ;length
		push 8 ;width
		push 0 ;color
		call drawOblong
		
	
	;S:
		push 240 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 2 ;color
		call drawOblong
		
		push 240 ;x
		push 127 ;y
		push 60 ;length
		push 12 ;width
		push 2 ;color
		call drawOblong

		push 248;x
		push 81;y
		push 8;length
		push 2;color
		call drawRect
		
		push 256;x
		push 89;y
		push 8;length
		push 2;color
		call drawRect

		push 264;x
		push 97;y
		push 8;length
		push 2;color
		call drawRect
		
		push 272;x
		push 105;y
		push 8;length
		push 2;color
		call drawRect
		
		push 280;x
		push 113;y
		push 8;length
		push 2;color
		call drawRect

		push 288;x
		push 121;y
		push 8;length
		push 2;color
		call drawRect

		push 242;x
		push 81;y
		push 8;length
		push 2;color
		call drawRect
		
		push 248;x
		push 89;y
		push 8;length
		push 2;color
		call drawRect

		push 256;x
		push 97;y
		push 8;length
		push 2;color
		call drawRect
		
		push 264;x
		push 105;y
		push 8;length
		push 2;color
		call drawRect
		
		push 272;x
		push 113;y
		push 8;length
		push 2;color
		call drawRect

		push 280;x
		push 121;y
		push 8;length
		push 2;color
		call drawRect

		push 240 ;x
		push 116 ;y
		push 3 ;length
		push 11 ;width
		push 2 ;color
		call drawOblong ;z's tail

		
	;T:
		push 20 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 4h ;color
		call drawOblong

		push 40 ;x
		push 69 ;y
		push 20 ;length
		push 70 ;width
		push 4h ;color
		call drawOblong
	
	
	;E:
		push 70 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 48h ;color
		call drawOblong
		
		push 70 ;x
		push 92 ;y
		push 60 ;length
		push 12 ;width
		push 48h ;color
		call drawOblong
		
		push 70 ;x
		push 127 ;y
		push 78 ;length
		push 12 ;width
		push 48h ;color
		call drawOblong
		
		push 70 ;x
		push 69 ;y
		push 20 ;length
		push 70 ;width
		push 48h ;color
		call drawOblong
		push 120 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 42 ;color
		call drawOblong
		push 20 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 4h ;color
		call drawOblong
		
	
	;R:
		push 175 ;x
		push 69 ;y
		push 50 ;length
		push 8 ;width
		push 9 ;color
		call drawOblong
		
		push 175 ;x
		push 69 ;y
		push 20 ;length
		push 70 ;width
		push 9 ;color
		call drawOblong
		
		push 217 ;x
		push 77 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 213 ;x
		push 81 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 209 ;x
		push 85 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 205 ;x
		push 90 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 201 ;x
		push 93 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 197 ;x
		push 97 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 193 ;x
		push 101 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 205 ;x
		push 113 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 201 ;x
		push 109 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 209 ;x
		push 117 ;y
		push 8;length
		push 9;color
		call DrawRect
			
		push 213 ;x
		push 121 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 217 ;x
		push 125 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 221 ;x
		push 129 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 225 ;x
		push 133 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 197 ;x
		push 105 ;y
		push 8;length
		push 9;color
		call DrawRect
		
		push 120 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 6h ;color
		call drawOblong
	
	;T:
		push 120 ;x
		push 69 ;y
		push 60 ;length
		push 12 ;width
		push 42 ;color
		call drawOblong

		push 140 ;x
		push 69 ;y
		push 20 ;length
		push 70 ;width
		push 42 ;color
		call drawOblong
	
	endm TetrisDrawer



;=============================================================================================================================================================



LineToCheck equ [word ptr bp + 6] ; השורה שבודקים
WhereToStartDestroy equ [word ptr bp + 4] ; מאיפה להתחיל להוריד את כולם שורה

; מקבל שורה ובודק האם המשתמש השלים את השורה הזאת ואם כן משמיד אותה ומוריד את כל שאר השורות בהתאם
proc destroyOneLine
	push bp
	mov bp, sp
	PushAll ; גיבוי

	L2:
		mov dx, 0
		mov cx, 159
		
		;בודק אם שואה הושלמה או לא
		startCheckPixel_2:
			push cx
			push LineToCheck ;מסמל את איזו שורה לבדוק
			call getPixel
			
			cmp al, 7 ;check if the color is grey
			je endLine_2
			
			cmp cx, 61
			je Line_2
			dec cx
		loop startCheckPixel_2
		
		;משמיד את השורה ומוריד את כולם משבצת
			Line_2:
				
				add [Score], 10 ; מעלה את הניקוד בעשר
				cmp [Speed], 14
				jbe DoNotDecSpeed
				dec [Speed]
				DoNotDecSpeed:
				mov dx, WhereToStartDestroy ; מסמל מאיזו קוביה להתחיל להוריד
			
			rows_2:	
			
				call openSpeaker
				call playRe
				mov cx, 160
				
				columns_2:
				
					push cx
					push dx
					call getPixel
					
					add dx, 10
					
					push cx
					push dx
					xor ah, ah
					push ax
					call drawPixel
					
					sub dx, 10
					
					dec cx
					cmp cx, 59
				jne columns_2
				dec dx
				cmp dx, 17
			jne rows_2
			
		endLine_2:
			call closeSpeaker
			
	PopAll
	pop bp
	ret
endp destroyOneLine



;=============================================================================================================================================================



; בודק על כל אחת מהשורות אם היא הושלמה ואם אחת כן אז משמיד אותה ומוריד את כל שאר השורות בהתאם
macro destroyLinesCheck
			;L2:
			push 32
			push 27
			call destroyOneLine
			;L3:
			push 42
			push 37
			call destroyOneLine
			;L4:
			push 52
			push 47
			call destroyOneLine
			;L5:
			push 62
			push 57
			call destroyOneLine
			;L6:
			push 72
			push 67
			call destroyOneLine
			;L7:
			push 82
			push 77
			call destroyOneLine
			;L8:
			push 92
			push 87
			call destroyOneLine
			;L9:
			push 102
			push 97
			call destroyOneLine
			;L10:
			push 112
			push 107
			call destroyOneLine
			;L11:
			push 122
			push 117
			call destroyOneLine
			;L12:
			push 132
			push 127
			call destroyOneLine
			;L13:
			push 142
			push 137
			call destroyOneLine
			;L14:
			push 152
			push 147
			call destroyOneLine
			;L15:
			push 162
			push 157
			call destroyOneLine
			;L16:
			push 172
			push 167
			call destroyOneLine
			;L17:
			push 182
			push 177
			call destroyOneLine
			;L18:
			push 192
			push 187
			call destroyOneLine
endm destroyLinesCheck



;=============================================================================================================================================================



; מגריל מספר אקראי שישמש כערך איקס לקוביה שזה עתה יוצאת
numOfBlocks equ [byte ptr bp + 4]
	proc getCubeStartingPoint 
		push bp
	mov bp, sp 

		PushAll
		mov [random],0
		mov ah, 2ch
		int 21h ;get clock millisecs and put it in dl
		xor dh,dh
		mov al, 17
		mul dl				;
		mov ax,dx
		
		mov bl, numOfBlocks
		div bl ;divid the random number with 6 and put the reminder in ah
		
	;	mov [random],ah ;put the random reminder in [random]
	mov bl, ah
	mov al, 10
	mul bl
	
		mov [random], ax
		add [random], 60
		PopAll
		pop bp
		ret 2
	endp getCubeStartingPoint
	


;=============================================================================================================================================================



proc printScore
 ; פרוצדורה מקבלת הודעה
 ;פרוצדורה מדפיסה את ההודעה
	push ax
	push bx
	push dx
	mov dh, 5	;Set cursor position
	mov dl, 27
	mov bh, 0
	mov ah, 2
	int 10h 
	mov dx, offset TopMessage
	call printString
	
;	call setTenThousandsOfScore
;	call printTav
	
	call setThousandsOfScore
	call printTav
	
	call setHundredsOfScore
	call printTav
	
	call setTensOfScore
	call printTav
	
	call setOnenessOfScore
	call printTav
	
	
	
	
	pop dx
	pop bx
	pop ax
	ret
endp printScore



;=============================================================================================================================================================



;מגדיר את ספרת האחדות של הניקוד ושם אותו בדי אל
proc setOnenessOfScore
xor ax, ax
	mov ax, [Score]

	mov bl, 10
	div bl 
	mov dl,ah 
	add dl, '0' 

ret
endp setOnenessOfScore



;=============================================================================================================================================================



;מגדיר את ספרת העשרות של הניקוד ושם אותו בדי אל
proc setTensOfScore
xor ax, ax
	mov ax, [Score]
	mov bl, 10
	div bl
	
	xor ah, ah

	mov bl, 10
	div bl 
	mov dl, ah 
	add dl, '0' 

ret
endp setTensOfScore



;=============================================================================================================================================================



;מגדיר את ספרת המאות של הניקוד ושם אותו בדי אל
proc setHundredsOfScore
xor ax, ax
	mov ax, [Score]
	mov bl, 100
	div bl
	xor ah, ah


	mov bl, 10
	div bl 
	mov dl,ah 
	add dl, '0' 

ret
endp setHundredsOfScore



;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו
proc cubeTouchedCheck_2
	mov dx, 0
	mov cx, 40
	add cx, [xCube]
    dec cx
	mov bx, [yCube]
	add bx, 10
	inc bx

	ThisIsLoop_2:
	
		push cx
		push bx
		call getPixel
		
		cmp al, 7h
		jne addOneTouchingCheck_1_1_2
		ok_1_2:
			dec cx
			cmp cx, [xCube]
	jne ThisIsLoop_2
	jmp stop_1_2
	
	addOneTouchingCheck_1_1_2:
		cmp al, 29
		jne addOneTouchingCheck_1_2_2
	jmp ok_1_2
	
	addOneTouchingCheck_1_2_2:
		mov dx, 1
		
	stop_1_2:

	ret
endp cubeTouchedCheck_2 ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו מצד שמאל
proc cube_touched_blook_or_wall_Left2

	mov dx, 0
	
	;Left chacking
	xor cx, cx
	xor bx, bx
	mov cx, [yCube]
	add cx, 10
	dec cx
	mov bx, [xCube]
    dec bx

	checkEveryPixelLeft_2:
	
		push bx
		push cx
		call getPixel
	
		cmp al, 7h
		jne changeToYesLeft_2_1
		allrightLeft_2:
			dec cx
			cmp cx, [yCube]
	jne checkEveryPixelLeft_2
	jmp stopLeft_2
	
	changeToYesLeft_2_1:
		cmp al, 29
		jne changeToYesLeft_2_2
	jmp allrightLeft_2
	
	changeToYesLeft_2_2:
		mov dx, 1
		
	stopLeft_2:

	ret
endp cube_touched_blook_or_wall_Left2 ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



;פרוצדורה שבודקת אם קוביה 1 נגעה במשהו מצד ימין
proc cube_touched_blook_or_wall_Right2

	mov dx, 0
	
	;Right chacking
	xor cx, cx
	xor bx, bx
	mov cx, [yCube]
	add cx, 10
	dec cx
	mov bx, 40
	add bx, [xCube]
    inc bx

	checkEveryPixelRight_2:
	
		push bx
		push cx
		call getPixel
		
	
		cmp al, 7h
		jne changeToYesRight_2_1
		allrightRight_2:
			dec cx
			cmp cx, [yCube]
	jne checkEveryPixelRight_2
	jmp stopRight_2
	
	changeToYesRight_2_1:
		cmp al, 29
		jne changeToYesRight_2_2
	jmp allrightRight_2
	
	changeToYesRight_2_2:
		mov dx, 1
		
	stopRight_2:
	
	ret

endp cube_touched_blook_or_wall_Right2



;=============================================================================================================================================================



x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [word ptr bp + 4]

;פרוצדורה שמציירת את קוביה מספר 2
proc drawCube2
	push bp
	mov bp, sp
	
	dec x 
	mov dx, 10
	add dx, y
	row2:	
		mov cx, 41 
		add cx, x
		column2:
			push cx
			push dx
			push color
			call drawPixel
			dec cx
			cmp cx, x
		jne column2
		dec dx
		cmp dx, y
	jne row2
	
	inc y
	inc x
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	dec y

	inc y
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	dec x ;
	add x, 11
	
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push [color_Of_Lines]
	call drawSmallLineX
	
	sub x, 40
	
	mov ax, 9
	add ax, y
	inc x
	push x
	push 39
	push ax
	push [color_Of_Lines]
	call drawSmallLineY
	dec x
	
	pop bp
	ret 6
endp drawCube2



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 1 לפי קלט המשתמש
proc movment_2
	mov [touchingCheck], 0
	mov al, 0
	mov ah,01h
	int 16h 
	
	cmp al, 'd' 
	je extract_key_2

	cmp al, 'a'
	je extract_key_2
	
	cmp al,'s'
	je extract_key_2
	

	ret
	
	
	extract_key_2:
	
		mov ah,00h
		int 16h
		
		mov [k],al

		cmp [k], 'd'
		je d_2
		cmp [k], 'a'
		je a_2
		cmp [k],'s'
		je s_2
		
	
	d_2: ; right
		cmp [touchingCheck], 1
		je stopAll_2
		
		call cube_touched_blook_or_wall_Right2 ;בודק אם הקוביה נגעה במשהו מימין
		cmp dx, 1
		je stopAll_2
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2 ; מצייר את הרקע שוב
	
		add [xCube], 10
		 
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2

		ret

	a_2: ; left
		cmp [touchingCheck], 1
		je stopAll_2
		
		
		call cube_touched_blook_or_wall_Left2 ;בודק אם הקוביה נדעה במשהו משמאל
		cmp dx, 1
		je stopAll_2
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2 ; מצייר את הרקע שוב
		
		sub [xCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2
		
		ret
	s_2: ; down
		
		call cubeTouchedCheck_2 ; בודק אם קוביה 1 נגעה במשהו

		cmp dx, 1 ; אם היא כן נגעה
		je DoNotMove_2 ; אל תרד למטה
		
		call moveDown_2 ; אחרת רד למטה

		DoNotMove_2:
	
			mov [touchingCheck], dx ; si = 1 - touched      0 - didn't touched
			
		ret
		
	stopAll_2:
	
ret
endp movment_2



;=============================================================================================================================================================



proc moveDown_2
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2 ; מצייר את הרקע שוב
		
		add [yCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2
		ret
endp moveDown_2



;=============================================================================================================================================================



x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

; פרוצדורה שמציירת שוב את הרקע שמאחורי קוביה 2
proc drawTheBackgroundAgain_2

	push bp
	mov bp, sp
	
	dec x 
	mov dx, 10
	add dx, y
	row_2:	
		mov cx, 41 
		add cx, x
		column_2:
			push cx
			push dx
			push 7
			call drawPixel
			dec cx
			cmp cx, x
		jne column_2
		dec dx
		cmp dx, y
	jne row_2
	
	inc y
	inc x
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	dec y

	inc y
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	dec x ;
	add x, 11
	
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	add x, 10
	
	push y
	push 9
	push x
	push 29
	call drawSmallLineX
	
	sub x, 40
	
	mov ax, 9
	add ax, y
	inc x
	push x
	push 39
	push ax
	push 29
	call drawSmallLineY
	dec x
	
	pop bp
	ret 4

endp drawTheBackgroundAgain_2





;get random between (1 - GetRandomBetween ) and put it in [random].
; מגריל את מספר הקוביה שתרד
GetRandomBetween equ [byte ptr bp + 4]
proc TheNextCubeToPlay 
	PushAll
		
	
	
		mov [random],0
		mov ah, 2ch
		int 21h ;get clock millisecs and put it in dl
		xor dh,dh
		mov al, 17
		mul dl				;
		mov ax,dx
		
		div GetRandomBetween ;divid the random number with GetRandomBetween and put the reminder in ah
		xor al, al
		mov [random],ax ;put the random reminder in [random]
	inc [random]
		PopAll
	ret 2
endp TheNextCubeToPlay
	

