x dw ?
y dw ?
x1 dw 30
y1 dw 50
x2 dw 290
y2 dw 170
x3 dw 100
y3 dw 100
color1 db ?
color2 db ?
color3 db 90
key1 db 'd'
key2 db 'j'
delayMinSecend dw ?
MinSecend dw 100
lose1 db 0
lose2 db 0
boxSize dw 1
randomNumber db ?
clock dw 0
clock1 dw ?
clock2 db ?
pointsMess db 'TIME:$'
points dw 0
pointsP1Mess db 'PLAYER1:$'
pointsP1 dw 0
pointsP2Mess db 'PLAYER2:$'
pointsP2 dw 0
ten db 10
box120 dw 0
box90 dw 0
filename  db 'oac.bmp',0 
filename1 db 'misgert.bmp',0 
filename2 db 'yesOrNot.bmp',0
‏‏filename3 db 'pvp.bmp',0
‏‏filename4 db 'survive.bmp',0
filehandle  dw  ? 
filenamee dw ?
Header db 54 dup (0) 
Palette  db 256*4 dup (0) 
ScrLine db 320 dup (0) 
ErrorMsg db 'Error', 13, 10,'$' 
youLose  db 'you lose!$'
youWin  db 'you win!$'
winSur db 0


























DATASEG

; משתנים לניהול קבצים
filenamee dw ?
	filehandle dw ?
	Message db 'Hello world!' ;12
	ErrorMsg db 'Error', 10, 13,'$'
	Buffer db 10 dup(0)
	TetrisTitle db 'tetris.bmp',0
	KeyBoardInfo db 'KeyBoard.bmp',0
	instructions db 'HowToPlay.bmp',0
	Header db 54 dup (0) 
	Palette  db 256*4 dup (0) 
	ScrLine db 320 dup (0) 
	
;משתנים לניהול התכנית

	Score dw 0 ; ניקוד של השחקן
	xCube dw 180 ; ערך האיקס הגלובלי של הקוביה
	yCube dw 17 ; ערך הוואי הגלובלי של הקוביה
	cubeSize dw 30 ; גודל הקוביה
	k db ? ; the key that the user inserted
	miliSeconds db 0 ; מספר המילי שניות שעברו עד כה
	newMiliseconds db ? ; מספר המילי שניות שעברו עד כה לאחר הלולאה
	timer dw 100 ; מספר אלפיות השנייה שנשארו עד שתעבור שנייה מלאה
	SaveIt db ? ; dx מגבה את
	color_Of_Lines dw 0F8h ; צבע הקו המחלק את הקוביות
	touchingCheck dw 0
	TopMessage db 'Score: $'
	Speed dw 100
	PosCounter dw 1
	position db 0
	LinesCounter db 0
	RotateTimer dw 14
	
	xCube1 dw ? ; האיקס של בלוק 1
	yCube1 dw ? ; הוואי של בלוק 1
	xCube2 dw ? ; האיקס של בלוק 2
	yCube2 dw ? ; הוואי של בלוק 2
	xCube3 dw ? ; האיקס של בלוק 3
	yCube3 dw ? ; הוואי של בלוק 3
	xCube4 dw ? ; האיקס של בלוק 4
	yCube4 dw ? ; הוואי של בלוק 4
	ColorBlock dw ? ; צבעם של הבלוקים
	
	Right_Parts dw ? ; כמות השינויים בגובה שיש לצד ימין של הקוביה
	Right_AddToY1 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Right_sideLength1 dw ? ; אורך הצלע שבודקים
	Right_distance1 dw ?; המרחק האופקי מראשית הקוביה שבודקים
	Right_AddToY2 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Right_sideLength2 dw ? ; אורך הצלע שבודקים
	Right_distance2 dw ? ; המרחק האופקי מראשית הקוביה שבודקים
	Right_AddToY3 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Right_sideLength3 dw ? ; אורך הצלע שבודקים
	Right_distance3 dw ? ; המרחק האופקי מראשית הקוביה שבודקים
	
	Left_Parts dw ? ; כמות השינויים בגובה שיש לצד ימין של הקוביה
	Left_AddToY1 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Left_sideLength1 dw ? ; אורך הצלע שבודקים
	Left_distance1 dw ?; המרחק האופקי מראשית הקוביה שבודקים
	Left_AddToY2 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Left_sideLength2 dw ? ; אורך הצלע שבודקים
	Left_distance2 dw ? ; המרחק האופקי מראשית הקוביה שבודקים
	Left_AddToY3 dw ? ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Left_sideLength3 dw ? ; אורך הצלע שבודקים
	Left_distance3 dw ? ; המרחק האופקי מראשית הקוביה שבודקים
		
		
	Floor_Parts dw ? ; כמות השינויים בגובה שיש לבסיס הקוביה
	Floor_AddToX1 dw ? ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Floor_sideLength1 dw ? ; אורך הבסיס שבודקים
	Floor_distance1 dw ?; המרחק האנכי מראשית הקוביה שבודקים
	Floor_AddToX2 dw ? ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Floor_sideLength2 dw ? ; אורך הבסיס שבודקים
	Floor_distance2 dw ?; המרחק האנכי מראשית הקוביה שבודקים
	Floor_AddToX3 dw ? ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	Floor_sideLength3 dw ? ; אורך הבסיס שבודקים
	Floor_distance3 dw ?; המרחק האנכי מראשית הקוביה שבודקים

	xRotate1 dw ?  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
	yRotate1 dw ? ; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	xRotate2 dw ?  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
	yRotate2 dw ? ; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	xRotate3 dw ?  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
	yRotate3 dw ? ; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

	Xstart dw ?
	addX dw ?
	rangeX dw ?
	NumOfCube db ?
	StateOfCube dw ? ;;;
	CUBEfinal dw ?
	startingY dw ?
	NumOfStates dw ? ;מספר המצבים שיש לקוביה
	
	BlackAndWhite_check db 0
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
		push ffh;29
		call drawLineY
		add ax, 10
		cmp ax, 199
	jne w

	push 198
	push ffh;29
	call drawLineY
	push 0
	push ffh;29
	call drawLineY
	push 199
	push ffh;29
	call drawLineY
		

	mov ax, 0 ; draw the X lines on the board
	w2:
		push ax
		push ffh;29
		call drawLineX
		add ax, 10
		cmp ax, 320
	jne w2
	
	push 319
	push ffh;29
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
proc BoardDrawer
	push 7h ; קובע את צבע הרקע לאפור
	call backgroundColor ; מגדיר את צבע הרקע
	
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

	push 59 ; x
	push 0 ; y
	push 101 ; length
	push 14 ; width
	push 0fah;10 ;color
	call drawOblong ; מצייר את הריבוע האמצעי העליון של המסך

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
		push 0ffh;29 ;קובע צבע ללבן
		call drawLineY
		add ax, 10
		cmp ax, 199
	jne t

	push 198
	push 0ffh;29 ;קובע צבע ללבן
	call drawLineY
	push 0
	push 0ffh;29 ;קובע צבע ללבן
	call drawLineY
	push 199
	push 0ffh;29 ;קובע צבע ללבן
	call drawLineY
		

	mov ax, 0 ; draw the X lines on the board
	t2:
		push ax
		push 0ffh;29 ;קובע צבע ללבן
		call drawLineX
		add ax, 10
		cmp ax, 320
	jne t2
	
	push 319
	push 0ffh;29 ;קובע צבע ללבן
	call drawLineX

endm drawNet



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



;קליטת מספר מהמשתמש
proc inputNum
	mov ah, 1h
	int 21h
	sub al, '0'
	ret
endp inputNum ;al = number


;=============================================================================================================================================================



macro ToGetTav
	
	mov al, 0
	mov ah,01h
	int 16h 
endm ToGetTav



;=============================================================================================================================================================



;קליטת מחרוזת תווים
proc inputString
	mov ah, 0Ah
	int 21h
	ret
endp inputString



;=============================================================================================================================================================



;ירידת שורה
proc newLine
	PushAll
	mov dl, 10
	mov ah, 2
	int 21h
	mov dl, 13
	mov ah, 2
	int 21h
	PopAll
	ret
endp newLine


;=============================================================================================================================================================



proc clearkeyboardbuffer ;a proc that clears the buffer
	mov ah,0ch
	mov al,0
	int 21h
	ret
endp clearkeyboardbuffer



;=============================================================================================================================================================



;קריאת השעה
proc readTime
	;mov al, 0
	mov ah, 2ch
	int 21h
		
	ret
endp readTime ; ch = hours     cl = minutes     dh = seconds     dl = miliseconds 



;=============================================================================================================================================================



;איפוס השעה
proc resetTime ; ch = hours     cl = minutes     dh = seconds     dl = miliseconds 
	PushAll
		xor dl, dl ;miliseconds
		xor dh, dh ;seconds
		xor cl, cl ;minutes
		xor ch, ch ;hours
		mov ah, 2ch
		int 21h
	PopAll
	ret
endp resetTime 



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



;פרוצדורה שמשנה למצב טקסט
proc textMod
	push ax
	mov al, 3h
	mov ah, 0
	int 10h
	pop ax
	ret
endp textMod



;=============================================================================================================================================================



;הפעלת העכבר
proc activeMouse
	push ax
	mov ax, 1
	INT 33h
	pop ax
	ret
endp activeMouse



;=============================================================================================================================================================



;אתחול העכבר
proc mouse
	push ax
	mov ax, 0
	INT 33h
	pop ax
	ret
endp mouse



;=============================================================================================================================================================



;קבלת סטטוס העכבר
proc mouseStatus
	push ax
	mov ax, 3h
	INT 33h
	SHR cx, 1
	pop ax
	ret
endp mouseStatus 

; bx = מצב הלחיצה של כפתורי העכבר- כפתור שמאלי לחוץ הביט במקום ה0 שווה 1. כפתור ימני לחוץ הביט במקום ה1 שווה 1
; cx = מיקום אופקי של הנקודה החמה
; dx = מיקום אנכי של הנקודה החמה



;=============================================================================================================================================================



numOfChars equ [byte ptr bp + 4]

;כותב לקובץ
proc writeToFile
	
	mov ah, 40h
	mov bx, [filehandle]
	mov cl, numOfChars
	mov dx, offset Message
	int 21h
	ret 2
endp writeToFile ; יש לדחוף למחסנית את מספר התווים בהודעה ולשמור אותה במשתנה הודעה לפני הקריאה לפעולה



;=============================================================================================================================================================



numOfChars equ [byte ptr bp + 4]

;קורא מקובץ
proc readFile
	mov ah,3Fh
	mov bx, [filehandle]
	mov cl, numOfChars
	mov dx, offset Buffer
	int 21h
	ret 2
endp readFile ;יש לדחוף למחסנית את כמות התווים שרוצים לקרוא



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
	ret 10
endp drawOblong



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
		cmp al, 0ffh ;check if the color is white
		jne ItIsNotGreyOrWhite ;if it isn't the color is not board's color and we need to end the game
		jmp continueChecking
		
		jmp endLoop
		ItIsNotGreyOrWhite:
			mov dx, 1

	endLoop:
	ret
endp endGameCheck



;=============================================================================================================================================================



LineToCheck equ [word ptr bp + 6] ; השורה שבודקים
WhereToStartDestroy equ [word ptr bp + 4] ; מאיפה להתחיל להוריד את כולם שורה

; מקבל שורה ובודק האם המשתמש השלים את השורה הזאת ואם כן משמיד אותה ומוריד את כל שאר השורות בהתאם
proc destroyOneLine
	push bp
	mov bp, sp
	PushAll ; גיבוי

	L_2:
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
				
				inc [LinesCounter]
				cmp [Speed], 14
				jbe DoNotDecSpeed_2
				dec [Speed]
				DoNotDecSpeed_2:
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
	ret 4
endp destroyOneLine



;=============================================================================================================================================================



; בודק על כל אחת מהשורות אם היא הושלמה ואם אחת כן אז משמיד אותה ומוריד את כל שאר השורות בהתאם
proc destroyLinesCheck
		mov [LinesCounter], 0

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
			
	cmp [LinesCounter], 1
	je Add10
	cmp [LinesCounter], 2
	je Add30
	cmp [LinesCounter], 3
	je Add50
	cmp [LinesCounter], 4
	je Add80
	jmp Add0
			
			
	Add10:
		add [Score], 10
		jmp Add0
	Add30:
		add [Score], 30
		jmp Add0
	Add50:
		add [Score], 50
		jmp Add0
	Add80:
		add [Score], 80
					
	Add0:
			
	ret		
endp destroyLinesCheck



;=============================================================================================================================================================



; קובע את מצב הקוביה
proc CubePosition


	mov ax, [PosCounter]

	mov bl, [byte ptr NumOfStates]
	div bl

	mov [position], ah
	inc [position]

ret
endp CubePosition



;=============================================================================================================================================================



length_Side equ [ word ptr bp + 6 ] ; ארוך הצלע שבודקים
disstance equ [ word ptr bp + 4 ] ; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה

; פרוצדורה שבודקת אם קוביה נגעה במשהו מצד ימין או שמאל
proc cube_touched_block_or_wall
	push bp
	mov bp, sp

	mov dx, 0 				; מאפס
	
	xor cx, cx 				; מאפס
	xor bx, bx 				; מאפס
	
	mov cx, [yCube] 		; מעביר לסי איקס את ערך הוואי של הקוביה
	add cx, length_Side 				; מוסיף לכי איקס את אורך הצלע השמאלית או הימנית של הקוביה שבודקים
	dec cx 					; מחסר מסי איקס אחד לצורך הבדיקה
	mov bx, [xCube] 		; מעבירים לבי איקס את ערך האיקס של הקוביה
    
	cmp disstance, 0
	jne right000
	
	left000:
		dec bx
		
	jmp checkEveryPixel
	right000:
		add bx, disstance
		inc bx

	checkEveryPixel:
	
		push bx
		push cx
		call getPixel

		cmp al, 7h
		jne changeToYes1
		allright:
			dec cx
			cmp cx, [yCube]
	jne checkEveryPixel
	jmp stop
	
	changeToYes1:
		cmp al, 0ffh;29 ;קובע צבע
		jne changeToYes2
	jmp allright
	
	changeToYes2:
		mov dx, 1
		
	stop:
		pop bp
		ret 4
endp cube_touched_block_or_wall ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



length_Side equ [ word ptr bp + 6 ] ; אורך בסיס הקוביה
hight equ [ word ptr bp + 4 ] ; גובה הקוביה

;פרוצדורה שבודקת אם הקוביה נחתה על משהו 
proc cubeTouchedCheck
	push bp
	mov bp, sp
	
	mov dx, 0
	mov cx, length_Side
	add cx, [xCube]
    dec cx
	mov bx, [yCube]
	add bx, hight
	inc bx

	ThisIsLoop:
	
		push cx
		push bx
		call getPixel
		
		cmp al, 7h
		jne addOneTouchingCheck_1
		ok0:
			dec cx
			cmp cx, [xCube]
	jne ThisIsLoop
	jmp stop1
	
	addOneTouchingCheck_1:
		cmp al, 0ffh;29 ;קובע צבע
		jne addOneTouchingCheck_2
	jmp ok0
	
	addOneTouchingCheck_2:
		mov dx, 1
		
	stop1:
		pop bp
		ret 4
endp cubeTouchedCheck ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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



;=============================================================================================================================================================



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


;=============================================================================================================================================================



cube equ [word ptr bp + 4] ;ספרת העשרות מייצגת את הקוביה וספרת היחידות מייצגת את מצב הקוביה

proc SetCube
	push bp
	mov bp, sp

	cmp cube, 11
	je Cube1_Pos1
	
	cmp cube, 21
	je Cube2_Pos1
	cmp cube, 22
	je Cube2_Pos2
	cmp cube, 23
	je Cube2_Pos3
	cmp cube, 24
	je Cube2_Pos4
	
	cmp cube, 31
	je Cube3_Pos1
	cmp cube, 32
	je Cube3_Pos2
	cmp cube, 33
	je Cube3_Pos3
	cmp cube, 34
	je Cube3_Pos4

	cmp cube, 41
	je Cube4_Pos1
	cmp cube, 42
	je Cube4_Pos2
	
	cmp cube, 51
	je Cube5_Pos1
	cmp cube, 52
	je Cube5_Pos2

	cmp cube, 61
	je Cube6_Pos1
	cmp cube, 62
	je Cube6_Pos2
	cmp cube, 63
	je Cube6_Pos3
	cmp cube, 64
	je Cube6_Pos4

	cmp cube, 71
	je Cube7_Pos1
	cmp cube, 72
	je Cube7_Pos2
	cmp cube, 73
	je Cube7_Pos3
	cmp cube, 74
	je Cube7_Pos4

	jmp TheEnd

	Cube1_Pos1: ;Set cube 1 pos 1
		call Set_Cube1_Pos1
	jmp TheEnd
	
	Cube2_Pos1: ;Set cube 2 pos 1
		call Set_Cube2_Pos1
	jmp TheEnd
	
	Cube2_Pos2: ;Set cube 2 pos 2
		call Set_Cube2_Pos2
	jmp TheEnd
	
	Cube2_Pos3: ;Set cube 2 pos 3
		call Set_Cube2_Pos3
	jmp TheEnd
	
	Cube2_Pos4: ;Set cube 2 pos 4
		call Set_Cube2_Pos4
	jmp TheEnd

	Cube3_Pos1: ;Set cube 3 pos 1
		call Set_Cube3_Pos1
	jmp TheEnd
	
	Cube3_Pos2: ;Set cube 3 pos 2
		call Set_Cube3_Pos2
	jmp TheEnd
	
	Cube3_Pos3: ;Set cube 3 pos 3
		call Set_Cube3_Pos3
	jmp TheEnd
	
	Cube3_Pos4: ;Set cube 3 pos 4
		call Set_Cube3_Pos4
	jmp TheEnd
	
	Cube4_Pos1: ;Set cube 4 pos 1
		call Set_Cube4_Pos1
	jmp TheEnd
	
	Cube4_Pos2: ;Set cube 4 pos 2
		call Set_Cube4_Pos2
	jmp TheEnd
	
	Cube5_Pos1: ;Set cube 5 pos 1
		call Set_Cube5_Pos1
	jmp TheEnd
	
	Cube5_Pos2: ;Set cube 5 pos 2
		call Set_Cube5_Pos2
	jmp TheEnd
	
	Cube6_Pos1: ;Set cube 6 pos 1
		call Set_Cube6_Pos1
	jmp TheEnd
	
	Cube6_Pos2: ;Set cube 6 pos 2
		call Set_Cube6_Pos2
	jmp TheEnd
	
	
	Cube6_Pos3: ;Set cube 6 pos 3
		call Set_Cube6_Pos3
	jmp TheEnd
	
	Cube6_Pos4: ;Set cube 6 pos 4
		call Set_Cube6_Pos4
	jmp TheEnd
	
	Cube7_Pos1: ;Set cube 7 pos 1
		call Set_Cube7_Pos1
	jmp TheEnd
	
	Cube7_Pos2: ;Set cube 7 pos 2
		call Set_Cube7_Pos2
	jmp TheEnd

	Cube7_Pos3: ;Set cube 7 pos 3
		call Set_Cube7_Pos3
	jmp TheEnd

	Cube7_Pos4: ;Set cube 7 pos 4
		call Set_Cube7_Pos4
	jmp TheEnd




TheEnd:

pop bp
ret 2

endp SetCube



;=============================================================================================================================================================



proc Set_Cube1_Pos1

;Draw cube set:

		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], 10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 10 ; x of block 4
		mov [yCube4], 10  ; y of block 4
		mov [colorBlock], 9 ;color of blocks
		
;Right side check set:

		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		
;Left side check set:
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים

;Floor check set:

		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים

;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	


;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
						
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה		
		
		mov [NumOfStates], 1 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube1_Pos1



;=============================================================================================================================================================



proc Set_Cube2_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -20 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 40 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -20; המרחק האופקי מראשית הקוביה שבודקים


		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 40; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים

		
			;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		;cube's starting place set:

		mov [addX],	20; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],7 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube2_Pos1



;=============================================================================================================================================================



proc Set_Cube2_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -20  ; y of block 4
		mov [colorBlock], 40 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים


		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים


		;Rotate check set:

		mov [xRotate1], 10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37		; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos2



;=============================================================================================================================================================

proc Set_Cube2_Pos3
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], -10 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10 ; y of block 3
		mov [xCube4], -20 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 40 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
	
	
	
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -20; המרחק האופקי מראשית הקוביה שבודקים



		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 40; אורך הבסיס שבודקים
		mov [Floor_distance1], 0; המרחק האנכי מראשית הקוביה שבודקים


		
						;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	

		;cube's starting place set:

		mov [addX],	20; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],7 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube2_Pos3



;=============================================================================================================================================================



proc Set_Cube2_Pos4
		mov [xCube1], -10 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], -20  ; y of block 4
		mov [colorBlock], 40 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Right_distance1], 0 ; המרחק האופקי מראשית הקוביה שבודקים



		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים



		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים

				
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37		; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos4



;=============================================================================================================================================================



proc Set_Cube3_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 34 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20; המרחק האופקי מראשית הקוביה שבודקים
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים

		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים


						;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube3_Pos1



;=============================================================================================================================================================



proc Set_Cube3_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], 10  ; y of block 4
		mov [colorBlock], 34 ;color of blocks
		
		mov	[Right_Parts], 3 ; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY3], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength3], 10 ; אורך הצלע שבודקים
		mov	[Right_distance3], 10; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 30 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים

				
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					   
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
		
	ret
endp Set_Cube3_Pos2



;=============================================================================================================================================================



proc Set_Cube3_Pos3
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], 10  ; y of block 4
		mov [colorBlock], 34 ;color of blocks
		
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
			
			
		mov [Floor_Parts], 3 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
					;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה	
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube3_Pos3



;=============================================================================================================================================================



proc Set_Cube3_Pos4
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], 10  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 34 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 3 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY3], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength3], 10 ; אורך הצלע שבודקים
		mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
	
	
	;Rotate check set:

		mov [xRotate1], 10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
	
		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
				
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	
	ret
endp Set_Cube3_Pos4



;=============================================================================================================================================================



proc Set_Cube4_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock],1 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20 ; המרחק האופקי מראשית הקוביה שבודקים
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 0; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
	
			
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
			
			
			
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה

	mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה		
	ret
endp Set_Cube4_Pos1



;=============================================================================================================================================================



proc Set_Cube4_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], 10  ; y of block 4
		mov [colorBlock], 1 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 20; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים


		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
	
			
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
	
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		
	mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube4_Pos2



;=============================================================================================================================================================



proc Set_Cube5_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], 10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 11 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
			
			
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה

	mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה		
					
	ret
endp Set_Cube5_Pos1



;=============================================================================================================================================================



proc Set_Cube5_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock],11 ;color of blocks
		
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 20 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 10; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים


		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
	
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה		
					
	ret
endp Set_Cube5_Pos2



;=============================================================================================================================================================



proc Set_Cube6_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 42 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 20; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 0; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
	
		
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		
				mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube6_Pos1



;=============================================================================================================================================================



proc Set_Cube6_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -20 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 42 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
	
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], -20 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים

		
				;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		;cube's starting place set:

		mov [addX],	20; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
					mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube6_Pos2



;=============================================================================================================================================================



proc Set_Cube6_Pos3
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], -20  ; y of block 4
		mov [colorBlock], 42 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 30 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
	
	
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה		
	ret
endp Set_Cube6_Pos3



;=============================================================================================================================================================



proc Set_Cube6_Pos4
		mov [xCube1], -10 ; x of block 1
		mov [yCube1], 0    ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 10 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 42 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
	
	
	
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0 ; המרחק האנכי מראשית הקוביה שבודקים
		
		
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube6_Pos4



;=============================================================================================================================================================



proc Set_Cube7_Pos1
		mov [xCube1], -10 ; x of block 1
		mov [yCube1], -10    ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 15 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 20 ; אורך הצלע שבודקים
		mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
	
	
	
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 30 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים

			
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20 ; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
	
		
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube7_Pos1



;=============================================================================================================================================================



proc Set_Cube7_Pos2
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0    ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], -10  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], -20 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 15 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -20 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20 ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance1], 0 ; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
		
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים


		;cube's starting place set:

		mov [addX],	20; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube7_Pos2



;=============================================================================================================================================================



proc Set_Cube7_Pos3
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0    ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -20  ; y of block 4
		mov [colorBlock],15 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
	
	
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים


		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
			
			;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],9 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube7_Pos3



;=============================================================================================================================================================



proc Set_Cube7_Pos4
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0    ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 10 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 15 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20; המרחק האופקי מראשית הקוביה שבודקים


		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
			
			;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube7_Pos4



;=============================================================================================================================================================



proc Set_Cube8_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0    ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 0FBh ;yellow ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים



		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
	
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
			
			;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 1 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube8_Pos1



;=============================================================================================================================================================



proc MoveRight
		cmp [touchingCheck], 1 ; בדיקה אם הקוביה נחתה על משהו
		jne DoNotRet_R
		ret
		DoNotRet_R:
		xor dx, dx

;Part1
		push 1 ;right checking
		push [Right_AddToY1]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Right_sideLength1] ; אורך הצלע שבודקים
		push [Right_distance1] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		cmp [Right_Parts], 1
		je TheCheck_Right
;Part2
		push 1 ;right checking
		push [Right_AddToY2]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Right_sideLength2] ; אורך הצלע שבודקים
		push [Right_distance2] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		cmp [Right_Parts], 2
		je TheCheck_Right
;Part3
		push 1 ;right checking
		push [Right_AddToY3]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Right_sideLength3] ; אורך הצלע שבודקים
		push [Right_distance3] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		TheCheck_Right:
		cmp dx, 1 ; בדיקה עם הקוביה נגעה במשהו מצד ימין
		jne NotRet_R
		ret
		NotRet_R:
		
		call drawAllCubes_BackGround ; מצייר את הרקע מחדש
		
		add [xCube], 10 ; מזיז את הקוביה ימינה
		 
		call drawAllCubes ; מצייר את הקוביה מחדש
		
ret
endp MoveRight



;=============================================================================================================================================================



proc MoveLeft
		cmp [touchingCheck], 1 ; בדיקה אם הקוביה נחתה על משהו
		jne DoNotRet_L
		ret
		DoNotRet_L:
		xor dx, dx

;Part1
		push 0 ;left checking
		push [Left_AddToY1]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Left_sideLength1] ; אורך הצלע שבודקים
		push [Left_distance1] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		cmp [Left_Parts], 1
		je TheCheck_Left
;Part2
		push 0 ;left checking
		push [Left_AddToY2]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Left_sideLength2] ; אורך הצלע שבודקים
		push [Left_distance2] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		cmp [Left_Parts], 2
		je TheCheck_Left
;Part3
		push 0 ;left checking
		push [Left_AddToY3]  ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		push [Left_sideLength3] ; אורך הצלע שבודקים
		push [Left_distance3] ; המרחק האופקי מראשית הקוביה שבודקים
		call cube_touched_Left_Or_Right ; בודק אם הקוביה נגעה במשהו מהצד
		
		TheCheck_Left:
		cmp dx, 1 ; בדיקה עם הקוביה נגעה במשהו מצד ימין
		jne NotRet_L
		ret
		NotRet_L:
		
		call drawAllCubes_BackGround ; מצייר את הרקע מחדש
		
		sub [xCube], 10 ; מזיז את הקוביה ימינה
		 
		call drawAllCubes ; מצייר את הקוביה מחדש
		
ret
endp MoveLeft



;=============================================================================================================================================================



proc MoveDown

xor dx, dx


;part1:
	push [Floor_AddToX1] ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	push [Floor_sideLength1]  ; אורך הבסיס שבודקים
	push [Floor_distance1] ; המרחק האנכי מראשית הקוביה שבודקים
	call cube_Touched_Floor_Check
		
	cmp [Floor_Parts],1
	je TheCheck_Floor
	
;part2:	
	push [Floor_AddToX2] ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	push [Floor_sideLength2]  ; אורך הבסיס שבודקים
	push [Floor_distance2] ; המרחק האנכי מראשית הקוביה שבודקים
	call cube_Touched_Floor_Check
		
		
	cmp [Floor_Parts],2
	je TheCheck_Floor
	
;part3:
	push [Floor_AddToX3] ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
	push [Floor_sideLength3]  ; אורך הבסיס שבודקים
	push [Floor_distance3] ; המרחק האנכי מראשית הקוביה שבודקים
	call cube_Touched_Floor_Check
	
	TheCheck_Floor:
		cmp dx, 1 ; אם היא כן נגעה
		je DoNotMove ; אל תרד למטה
		
		call moveDownCube
		DoNotMove:
	
	mov [touchingCheck], dx 
			
ret
endp MoveDown



;=============================================================================================================================================================


; בודק אם הקוביה מסוגלת להסתובב בלי לעלות על דברים אחרים ואם כן מסובב אותה
proc RotateCube

		call RotateCheck
		cmp dx, 1
		je retTime

		cmp [RotateTimer], 0
		jge retTime
		mov [RotateTimer], 2 ;14

		
		call drawALLCubes_BackGround
	
		inc [position]
		
		call FixPosition ;make sure that [position] equals to the next [position]
		call Calculate_Cube_Num ;מחשב את המספר של הקוביה
		push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
		call SetCube
		
		cmp [BlackAndWhite_check], 1 ;בודק אם המוד שהשחקן משחק בו הוא שחור לבן או לא
		jne StayInSameColor ; אם לא לא משתנה דבר אך אחרת...
		call changeToWhiteOrBlack ;change the color of the cube to black or white randomly
		
		StayInSameColor:
			call drawALLCubes
		
	retTime:
	ret
endp RotateCube



;=============================================================================================================================================================



; מאקרו שבודק את התו שנכנס ופועל לפיו, אם נלחץ ימינה קופץ לתזוזה ימינה, אם שמאלה אז שמאלה, אם למטה אז למטה ואם להסתובב אז מסובב את הקוביה
macro checkTheTavWeGot 
	cmp ah, 4dh ;right
	je key

	cmp ah, 4bh ;left
	je key
	
	cmp ah, 50h ;down
	je key
	
	cmp ah, 48h ;up
	je key

	cmp al, 'd' ;right
	je key

	cmp al, 'a' ;left
	je key
	
	cmp al,'s' ;down
	je key
	
	cmp al,'w' ;up
	je key

	ret

	key:
	
		mov ah,00h
		int 16h

		mov [k],ah ; arrows checking

		cmp [k], 4dh ;right
		je right
		
		cmp [k], 4bh ;left
		je left
		
		cmp [k], 50h ;down
		je down
		
		cmp [k], 48h ;up
		je rotate
	
		mov [k],al ; letters checking
		
		cmp [k], 'd' ;right
		je right
		
		cmp [k], 'a' ;left
		je left
		
		cmp [k],'s' ;down
		je down
		
		cmp [k],'w' ;up
		je rotate
	
endm checkTheTavWeGot 



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את הקוביה לפי קלט המשתמש
proc Movment_Cube

	xor ax, ax
	ToGetTav ; מקבל תו מהמשתמש בלי לעצור את התוכנית

	checkTheTavWeGot ; בודק את התו שקיבלנו ופועל בהתאם
	
	right: ; right
		call MoveRight
		ret

	left: ; left
		call MoveLeft
		ret
		
	down: ; down
		call MoveDown
		ret
		
	rotate: ; switch position / rotate cube
		call RotateCube
		ret
		
ret
endp Movment_Cube



;=============================================================================================================================================================



; פרוצדורה שמורידה את הקוביה למטה
proc moveDownCube
		call drawAllCubes_BackGround ; מצייר את הרקע מחדש
		add [yCube], 10 ; מזיז את הקוביה למטה
		call drawAllCubes ; מצייר את הקוביה מחדש
	ret
endp moveDownCube



;=============================================================================================================================================================



; מכפיל את מספר הקוביה בעשר ומוסיף לזה את מספר הקוביה, את זה מכניס לתוך משתנה בשם קוביה
proc Calculate_Cube_Num

	xor ax, ax
	mov al, [NumOfCube]

	mov bl, 10
	mul bl

	add al, [position]
	mov [CUBEfinal], ax
	
	ret
endp Calculate_Cube_Num



;=============================================================================================================================================================



RightOrLeft equ [ word ptr bp + 10 ] ;1 - for right ||| 0 - for left
starting_Point equ [ word ptr bp + 8 ] ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
length_Side equ [ word ptr bp + 6 ] ; ארוך הצלע שבודקים
disstance equ [ word ptr bp + 4 ] ; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה

; פרוצדורה שבודקת אם קוביה נגעה במשהו מצד ימין או שמאל
proc cube_touched_Left_Or_Right
	push bp
	mov bp, sp

	;mov dx, 0 				; מאפס
	
	xor cx, cx 				; מאפס
	xor bx, bx 				; מאפס
	
	
	xor ax, ax
	mov ax, starting_Point
	add [yCube], ax
	
	mov cx, [yCube] 		; מעביר לסי איקס את ערך הוואי של הקוביה
	
	add cx, length_Side 				; מוסיף לכי איקס את אורך הצלע השמאלית או הימנית של הקוביה שבודקים
	dec cx 					; מחסר מסי איקס אחד לצורך הבדיקה
	mov bx, [xCube] 		; מעבירים לבי איקס את ערך האיקס של הקוביה
    
	add bx, disstance
	
	cmp RightOrLeft, 1
	je rightCheck
	
	leftCheck:
		dec bx	
		
	jmp checkEverySinglePixel
	
	rightCheck:

		inc bx

	checkEverySinglePixel:
	
		push bx
		push cx
		
		call getPixel ;בודק את צבע הפיקסל

		cmp al, 7h ;grey
		jne changeTo_Yes
		all_right:
			dec cx
			cmp cx, [yCube]
	jne checkEverySinglePixel
	jmp stopIt
	
	changeTo_Yes:
		cmp al, 0ffh;29 ;קובע צבע
		jne changeTo__Yes
	jmp all_right
	
	changeTo__Yes:
		mov dx, 1
		
	stopIt:
		xor ax, ax
		mov ax, starting_Point
		sub [yCube], ax
		pop bp
		ret 8
endp cube_touched_Left_Or_Right ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



starting_Point equ [ word ptr bp + 8 ] ; המספר שצריך להוסיף לאיקס כדי הגיע לנקודת ההתחלה של הצלע שבודקים
length_Side equ [ word ptr bp + 6 ] ; אורך בסיס הקוביה
hight equ [ word ptr bp + 4 ] ; גובה הקוביה

;פרוצדורה שבודקת אם הקוביה נחתה על משהו 
proc cube_Touched_Floor_Check
	push bp
	mov bp, sp
	
	
	;mov dx, 0
	
	xor ax, ax
	mov ax, starting_Point
	add [xCube], ax
	
	mov cx, length_Side
	add cx, [xCube]
    dec cx
	mov bx, [yCube]
	add bx, hight
	inc bx

	ThisIsLoop_:
	
		push cx
		push bx
		call getPixel
		
		cmp al, 7h
		jne addOneTouchingCheck_1_
		ok_:
			dec cx
			cmp cx, [xCube]
	jne ThisIsLoop_
	jmp stop_
	
	addOneTouchingCheck_1_:
		cmp al,0ffh;29 ;קובע צבע
		jne addOneTouchingCheck_2_
	jmp ok_
	
	addOneTouchingCheck_2_:
		mov dx, 1
		
	stop_:
		xor ax, ax
		mov ax, starting_Point
		sub [xCube], ax
		
		pop bp
		ret 6
endp cube_Touched_Floor_Check ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



proc cube_Starts
			;call clearkeyboardbuffer
			push [addX]									; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
			push [rangeX]								; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70
			call getCubeStartingPointX					;מחזיר ערך איקס שהקוביה יכולה לצאת ממנו

		cube_:
			; קובע את ההגדרות של הקוביה שתיווצר
			mov ax, [Xstart]	
			mov [xCube], ax	; X of the cube: 60/70/80/90/100/110/120/130/140/150
			mov ax, [startingY]
			mov [yCube], ax ;17/27/37
			
			call CreateCheck ;בודק אם הקוביה יכולה להיווצר
			cmp dx, 0 ;אם הקוביה יכולה להיווצר ולא תעלה על קוביה אחרת
			je CreateAndmoveCube ; אז המשך את המשחק כרגיל
			call drawAllCubes ; draw the cube
			
			ret ; אחרת סיים את המשחק
			
			CreateAndmoveCube:
				call drawAllCubes ; draw the cube
			
			moveCube: ; move down the cube

				call printScore			
				mov [touchingCheck], 0			
				mov [SaveIt], dl ; dx מגבה את 
				
				
				;call Movment_Cube ; מזיז את הקוביה לצדדים לפי קלט
				call Movment_Cube ; מזיז את הקוביה לצדדים לפי קלט
				call clearkeyboardbuffer ;מנקה את הבאפר
				cmp [touchingCheck], 1
				je stopMovingCube_
				
				;:קטע קוד שאחראי לבדוק מתי עברה שנייה				
				
				mov dl,  [SaveIt] ;  מוציא את די איקס מגיבוי
				call readTime
			
				mov [newMiliseconds], dl
				
				cmp dl, [miliSeconds]
				jb add100_
				jmp fine_
				
				add100_:
					add dl, 100
				fine_:
					sub dl, [miliSeconds]
					xor dh, dh
					sub [timer], dx
					sub [RotateTimer], dx
			
					mov dl, [newMiliseconds]
					mov [miliSeconds], dl
					cmp [timer], 0
			jge moveCube

				SecondPast_:
				call Movment_Cube ; מזיז את הקוביה לצדדים לפי קלט
				call clearkeyboardbuffer ;מנקה את הבאפר
				
					call MoveDown

					cmp dx, 1 ; אם היא כן נגעה
					je stopMovingCube_ ; אז תפסיק להניע את הקוביה
					
					cmp [touchingCheck], 1 ; בודק אם הקוביה כבר נחתה על משהו
					je YesItTouched_ ;אם הקוביה נגעה
				
					
					YesItTouched_:
					mov ax, [Speed]
					mov [timer], ax; מאפס את הטיימר
					;call clearkeyboardbuffer
			jmp moveCube ; אם היא לא נגעה המשך להניע אותה
					
			stopMovingCube_: ; הפסק להניע את הקוביה
				mov ax, [Speed]
				mov [timer], ax ; מאפס את הטיימר
				call clearkeyboardbuffer ;מנקה את הבאפר
				call drawAllCubes ; draw the cube
			ret
endp cube_Starts



;=============================================================================================================================================================



; מגריל מספר אקראי שישמש כערך איקס לקוביה שזה עתה יוצאת
addToX equ [word ptr bp + 6] ; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
range equ [byte ptr bp + 4]; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70
proc getCubeStartingPointX
		push bp
	mov bp, sp 

		PushAll
		mov [Xstart],0
		mov ah, 2ch
		int 21h ;get clock millisecs and put it in dl
		xor dh,dh
		mov al, 17
		mul dl				;
		mov ax,dx
		
		mov bl, range
		div bl ;divid the random number with 6 and put the reminder in ah
		
	;	mov [random],ah ;put the random reminder in [random]
		mov bl, ah
		mov al, 10
		mul bl
	
		mov [Xstart], ax
		add [Xstart], 60
		mov ax, addToX
		add [Xstart], ax
		PopAll
		pop bp
		ret 4
endp getCubeStartingPointX
	


;=============================================================================================================================================================



proc TheNextCubeToPlay 
        ; generate a rand no using the system time
RANDSTART7:
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov  ax, dx
	xor  dx, dx
	mov  cx, 7   
	div  cx       ; here dx contains the remainder of the division - from 0 to 7
	inc dl
RET
endp TheNextCubeToPlay ; dl = מספר הקוביה האקראי שהוגרל



;=============================================================================================================================================================


; מגריל מספר אקראי בין 1 ל4 למצב הקוביה עבור קוביות בעלות ארבעה מצבים
proc TheNextPositionToPlay4
        ; generate a rand no using the system time
RANDSTART4:
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov  ax, dx
	xor  dx, dx
	mov  cx, 4  
	div  cx       ; here dx contains the remainder of the division - from 0 to 4
	inc dl
RET
endp TheNextPositionToPlay4 ; dl = מספר הקוביה האקראי שהוגרל



;=============================================================================================================================================================


; מגריל מספר בין 1 ל2 עבור קוביות בעלות שני מצבים
proc TheNextPositionToPlay2
        ; generate a rand no using the system time
RANDSTART2:
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov  ax, dx
	xor  dx, dx
	mov  cx, 2  
	div  cx       ; here dx contains the remainder of the division - from 0 to 2
	inc dl
RET
endp TheNextPositionToPlay2 ; dl = מספר הקוביה האקראי שהוגרל



;=============================================================================================================================================================



; מגריל קוביה ומצב קוביה באופן רנדומלי לחלוטין
proc GetRandomCube
		call TheNextCubeToPlay ; dl = מספר הקוביה האקראי שהוגרל
		mov [NumOfCube], dl ;מעבירים את מספר הקוביה למשתנה שאמור להכיל את מספר הקוביה
		mov [position], 1 ; מגדירים את מצב הקוביה ל1 לצורך בדיקה עתידית
		call Calculate_Cube_Num ;מחשב את המספר של הקוביה
		push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
		call SetCube ;קובע את מצב הקוביה לקוביה אקראית במצב אחד
		cmp [NumOfStates], 1 ;בודק את מספר המצבים שיש לקוביה כדי לשנות את מהצב למספר רנדומלי
		je calculate ;אם שווה לקוביה אחת שיש לה רק מצב אחד אין צורך להגריל מספר רנדומלי
		cmp [NumOfStates], 4 ;בודק את מספר המצבים שיש לקוביה כדי לשנות את מהצב למספר רנדומלי
		jne TwoStates ; אם יש לקוביה שתי מצבים ולא ארבע אז קופץ להגרלת שני מצבים
		FourStates: ;ארבע מצבים
		call TheNextPositionToPlay4 ; מגריל מספר אקראי בין 1 ל4
		jmp SetBeforeCalculate ; קופץ לחישוב הקוביה שנבחרה
		TwoStates: ;שני מצבים
			call TheNextPositionToPlay2 ; מגריל מספר בין 1 ל2
		SetBeforeCalculate:
			mov [position], dl
			calculate:
			call Calculate_Cube_Num ;מחשב את המספר של הקוביה
			push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
			call SetCube
			
		
			ret
endp GetRandomCube



;=============================================================================================================================================================



; פעולה שמוודאת כי כאשר הקוביה מסתובבת היא הופכת להיות הקוביה במצב הבא ולא משהו אחר
proc FixPosition

	cmp [NumOfStates], 1
	je Reset2
	cmp [NumOfStates], 2
	je Reset3
	cmp [NumOfStates], 4
	je Reset5

	jmp TimeToRet

	reset2:

		cmp [position], 2
		jne TimeToRet
		mov [position], 1

	jmp TimeToRet

	reset3:

		cmp [position], 3
		jne TimeToRet
		mov [position], 1

	jmp TimeToRet

	reset5:

		cmp [position], 5
		jne TimeToRet
		mov [position], 1


	TimeToRet:
ret
endp FixPosition
	
	
	
;=============================================================================================================================================================

	
	
; מצייר כל קוביה לפי הערכים של איקס והוואי של הבלוקים
proc RotateCheck

	xor dx, dx

		mov ax, [xRotate1]
		add ax, [xCube]
		mov bx, [yRotate1]
		add bx, [yCube]
		add ax, 2
		add bx, 2

		push ax
		push bx
		call getPixel
		
		cmp al, 7 ;check if the color is grey
		jne ItCantRotate ;if it isn't jump to another check

		mov ax, [xRotate2]
		add ax, [xCube]
		mov bx, [yRotate2]
		add bx, [yCube]
		add ax, 2
		add bx, 2

		push ax
		push bx
		call getPixel
		
		cmp al, 7 ;check if the color is grey
		jne ItCantRotate ;if it isn't jump to another check

		mov ax, [xRotate3]
		add ax, [xCube]
		mov bx, [yRotate3]
		add bx, [yCube]
		add ax, 2
		add bx, 2
		
		push ax
		push bx
		call getPixel
		
		cmp al, 7 ;check if the color is grey
		jne ItCantRotate ;if it isn't jump to another check
		
		jmp ItCanRotate
		ItCantRotate:
		
		mov dx, 1
		ItCanRotate:
ret
endp RotateCheck ; dx = 1 - can't rotate     dx = 0 - can rotate

	
	
;=============================================================================================================================================================

	
	
; מצייר כל קוביה לפי הערכים של איקס והוואי של הבלוקים
proc CreateCheck

	xor dx, dx

	mov ax, [xCube1]
	add ax, [xCube]
	mov bx, [yCube1]
	add bx, [yCube]
	add ax, 5
	add bx, 5

	push ax
	push bx
	call getPixel
	
	
	cmp al, 7 ;check if the color is grey
	jne ItCantCreate ;if it isn't jump to another check

	mov ax, [xCube2]
	add ax, [xCube]
	mov bx, [yCube2]
	add bx, [yCube]
	add ax, 5
	add bx, 5

	push ax
	push bx
	call getPixel
	
	cmp al, 7 ;check if the color is grey
	jne ItCantCreate ;if it isn't jump to another check

	mov ax, [xCube3]
	add ax, [xCube]
	mov bx, [yCube3]
	add bx, [yCube]
	add ax, 5
	add bx, 5
	
	push ax
	push bx
	call getPixel
	
	cmp al, 7 ;check if the color is grey
	jne ItCantCreate ;if it isn't jump to another check

	mov ax, [xCube4]
	add ax, [xCube]
	mov bx, [yCube4]
	add bx, [yCube]
	add ax, 5
	add bx, 5

	push ax
	push bx
	call getPixel
	
	cmp al, 7 ;check if the color is grey
	jne ItCantCreate ;if it isn't jump to another check

	
	jmp ItCanCreate
	ItCantCreate:
	
	mov dx, 1
	ItCanCreate:
	
ret
endp CreateCheck ; dx = 1 - can't create     dx = 0 - can create



;=============================================================================================================================================================


color_ equ [word ptr bp +4]
; מצייר את הריבוע האמצעי העליון של המסך
proc Draw_Middle_Oblong
push bp
mov bp, sp
	push 59 ; x
	push 0 ; y
	push 101 ; length
	push 14 ; width
	push color_ ;color
	call drawOblong ; מצייר את הריבוע האמצעי העליון של המסך
pop bp
ret 2
endp  Draw_Middle_Oblong



;=============================================================================================================================================================



proc Classic_Mood
	call clearkeyboardbuffer
	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 100										; מאפס את המהירות למהירות ממוצעת
	call BoardDrawer 										; מצייר את הלוח
	;push 10
	;call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך

	Classic: ; לולאת המשחק
		
			call GetRandomCube 								;מגריל קוביה אקראית

			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck 								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je End_Classic
	
	jmp Classic												; סיום לולאת המשחק
	
	End_Classic:
	ret
	
endp Classic_Mood



;=============================================================================================================================================================



proc TurtleSpeed_Mood
	call clearkeyboardbuffer
	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 150										; מאפס את המהירות למהירות האיטית ביותר
	call BoardDrawer 										; מצייר את הלוח
	push 66
	call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך

	TurtleSpeed: ; לולאת המשחק
		
			call GetRandomCube 								;מגריל קוביה אקראית

			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck  								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je End_TurtleSpeed
	
	jmp TurtleSpeed											; סיום לולאת המשחק
	
	End_TurtleSpeed:
	ret
	
endp TurtleSpeed_Mood



;=============================================================================================================================================================



proc SuperHard_Mood
	call clearkeyboardbuffer
	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 30											; מאפס את המהירות למהירות ממוצעת
	call BoardDrawer 										; מצייר את הלוח
	push 4
	call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך

	SuperHard: ; לולאת המשחק
		
			call GetRandomCube 								;מגריל קוביה אקראית

			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck  								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je End_SuperHard
	
	jmp SuperHard											; סיום לולאת המשחק
	
	End_SuperHard:
	ret
	
endp SuperHard_Mood



;=============================================================================================================================================================



proc BlackAndWhite_Mood
	call clearkeyboardbuffer
	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 100											; מאפס את המהירות למהירות ממוצעת
	call BoardDrawer 										; מצייר את הלוח
	push 0
	call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך
	mov [BlackAndWhite_check], 1 							; התחיל המשחק של השחור לבן

	BlackAndWhite:											; לולאת המשחק
		
			call GetRandomCube 								;מגריל קוביה אקראית
			
			call changeToWhiteOrBlack 						;change the color of the cube to black or white randomly
			
			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck  								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je End_BlackAndWhite
	
	jmp BlackAndWhite										; סיום לולאת המשחק
	
	End_BlackAndWhite:
	mov [BlackAndWhite_check], 0							; נגמר המשחק של השחור לבן
	ret
	
endp BlackAndWhite_Mood



;=============================================================================================================================================================



proc OneByOne_Mood
	call clearkeyboardbuffer
	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 90											; מאפס את המהירות למהירות ממוצעת
	call BoardDrawer 										; מצייר את הלוח
	push 87h
	call Draw_Middle_Oblong 								; מצייר את המלבן העליון באמצע המסך
	mov [BlackAndWhite_check], 1 							; התחיל המשחק של השחור לבן

	BlackAndWhite:											; לולאת המשחק
		
			call GetRandomCube 								;מגריל קוביה אקראית
			
			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck  								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je End_BlackAndWhite
	
	jmp BlackAndWhite										; סיום לולאת המשחק
	
	End_BlackAndWhite:
	mov [BlackAndWhite_check], 0							; נגמר המשחק של השחור לבן
	ret
	
endp OneByOne_Mood



;=============================================================================================================================================================



;מקבל את המוד שהשחקן רוצה לשחק ומתחיל את המשחק לפי המוד
proc SetTheMood
	GetANum:
		call inputTav

		cmp al, '1'
		je TurtleSpeed_
		cmp al, '2'
		je Classic_
		cmp al, '3'
		je SuperHard_
		cmp al, '4'
		je BlackAndWhite_
		
	jmp GetANum
	
	Classic_:
		call  Classic_Mood
		ret
		
	TurtleSpeed_:
		call TurtleSpeed_Mood
		ret
		
	SuperHard_:
		call SuperHard_Mood
		ret
	BlackAndWhite_:
		call BlackAndWhite_Mood
		ret
	ret
endp SetTheMood



;=============================================================================================================================================================



proc StartTheGame

	TheOpenning:
		;call graphicMod ; משנה למצב גרפי
		;drawTheOpeningScrean ; מצייר את הרשת והמילה טטריס עליה עם האפקט בהתחלה

	
	TheGame:
		
		call SetTheMood ;מקבל מהמשתמש את המוד שבו הוא רוצה לשחק ומתחיל את המשחק
		
		ret
endp StartTheGame
		
		
;=============================================================================================================================================================



proc Splash
 ;פרוצדורה מקבלת תמונה
 ;פרוצדורה מדפיסה תמונה
	call OpenFile 	; Process BMP file 
	call ReadHeader 
	call ReadPalette 
	call CopyPal 
	call CopyBitmap
	call CloseFile
ret 
endp Splash


;=============================================================================================================================================================



proc OpenFile 
	; Open file 
		 mov  ah, 3Dh 
		 xor  al, al 
		 mov  dx, [filenamee]
		 int  21h 
		 jc openerror 
		 mov  [filehandle], ax 
		 ret 
	openerror: 
		 mov dx, offset ErrorMsg 
		 mov ah, 9h 
		 int 21h 
 ret  
endp OpenFile 



;=============================================================================================================================================================



proc ReadHeader  
; Read BMP file header, 54 bytes 
 mov ah,3fh 
 mov bx, [filehandle] 
 mov  cx,54 
 mov  dx,offset Header 
 int  21h                      
 ret 
endp ReadHeader  



;=============================================================================================================================================================


proc ReadPalette 
; Read BMP file color palette, 256 colors * 4 bytes (400h) 
 mov ah,3fh 
 mov  cx,400h                           
 mov  dx,offset Palette 
 int  21h                      
 ret 
endp ReadPalette 



;=============================================================================================================================================================



proc CopyPal  
; Copy the colors palette to the video memory  
; The number of the first color should be sent to port 3C8h 
; The palette is sent to port 3C9h 
 mov     si,offset Palette        
 mov     cx,256               
 mov     dx,3C8h 
 mov     al,0                     
 ; Copy starting color to port 3C8h 
 out      dx,al 
 ; Copy palette itself to port 3C9h  
 inc       dx                       
PalLoop: 
 ; Note: Colors in a BMP file are saved as BGR values rather than RGB. 
 mov ax, [si+2]             ; Get red value. 
 shr al,2                     ; Max. is 255, but video palette maximal 
     ; value is 63.  Therefore dividing by 4. 
 out      dx,al   ; Send it. 
 mov     al,[si+1]   ; Get green value. 
 shr      al,2 
 out      dx,al                    ; Send it. 
 mov     al,[si]                  ; Get blue value. 
 shr      al,2 
 out      dx,al                    ; Send it. 
 add      si,4                     ; Point to next color. 
     ; (There is a null chr. after every color.) 

 loop    PalLoop 
 ret 
endp CopyPal  



;=============================================================================================================================================================



proc CopyBitmap 
; BMP graphics are saved upside-down. 
; Read the graphic line by line (200 lines in VGA format), 
; displaying the lines from bottom to top.  
	 mov ax, 0A000h 
	 mov es, ax 
	 mov     cx,200               
	PrintBMPLoop: 
	 push    cx 
	 ; di = cx*320, point to the correct screen line 
	 mov     di,cx                    
	 shl      cx,6                     
	 shl      di,8                     
	 add      di,cx 
	 ; Read one line 
	 mov     ah,3fh 
	 mov     cx,320 
	 mov     dx,offset ScrLine 
	 int      21h                      
	 ; Copy one line into video memory 
	 cld                               ; Clear direction flag, for movsb 
	 mov     cx,320 
	 mov     si,offset ScrLine 

	 rep      movsb                    ; Copy line to the screen  
		  ;rep movsb is same as the following code: 
		  ;mov es:di, ds:si 
		  ;inc si 
		  ;inc di 
		  ;dec cx 
		  ;loop until cx=0      
	 pop     cx 
	 loop    PrintBMPLoop
 ret 
endp CopyBitmap 



;=============================================================================================================================================================



proc CloseFile
	;פרוצדורה סוגרת קובץ
	MOV AH,3Eh 
	MOV BX, [filehandle] 
	INT  21h 
	ret
endp CloseFile



;=============================================================================================================================================================



proc DrawTetrisTitle
	lea bx, [TetrisTitle]
	mov [filenamee],bx
	call Splash
ret
endp DrawTetrisTitle


proc DrawKeyboardInfo
	lea bx, [KeyBoardInfo]
	mov [filenamee],bx
	call Splash
ret
endp  DrawKeyboardInfo


proc DrawHowToPlay
	lea bx, [instructions]
	mov [filenamee],bx
	call Splash
ret
endp DrawHowToPlay



;=============================================================================================================================================================



proc Start_The_Game_

	mov [Score], 0 											; מאפס את ניקוד השחקן
	mov [Speed], 100 										; מאפס את המהירות למהירות האיטית ביותר
	
	Game_: ; לולאת המשחק
		
		;mov [NumOfCube], 2 ;מעבירים את מספר הקוביה למשתנה שאמור להכיל את מספר הקוביה
		;mov [position], 1 ; מגדירים את מצב הקוביה ל1 לצורך בדיקה עתידית
		;call Calculate_Cube_Num ;מחשב את המספר של הקוביה
		;push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
		;call SetCube 
		
			;push  ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
			;call SetCube
		
			call GetRandomCube 								;מגריל קוביה אקראית

			call cube_Starts							 	; קוביה יורדת ופועלת כמו שצריך עד שנעצרת בנחיתה על משטח
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck 								; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je EndGame_
	
	jmp Game_ 												; סיום לולאת המשחק
	
	EndGame_:
	ret
	
endp Start_The_Game_



;=============================================================================================================================================================



;change the color of hte cube to white or blcak randomly
proc changeToWhiteOrBlack
	call TheNextPositionToPlay2 					;מגריל מספר אקראי מ1 עד 2
	cmp dl, 2
	je black
	white:
		mov [colorBlock], 15							;color of blocks
	jmp ColorWasSetted
	black:
		mov [colorBlock], 0 							;color of blocks
	ColorWasSetted:
	ret
endp changeToWhiteOrBlack
			
