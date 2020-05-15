DATASEG

; משתנים לניהול קבצים
	filename db 'zo.txt',0
	filehandle dw ?
	Message db 'Hello world!' ;12
	ErrorMsg db 'Error', 10, 13,'$'
	Buffer db 10 dup(0)
	k db ? ; the key that the user inserted
	
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
	xRotate4 dw ?  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
	yRotate4 dw ? ; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

	

	Xstart dw ?
	addX dw ?
	rangeX dw ?
		
	NumOfCube db ?
	StateOfCube dw ? ;;;
	CUBEfinal dw ?
	
	startingY dw ?
	
		NumOfStates dw ? ;מספר המצבים שיש לקוביה
		
		TheNextCube dw ?

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



proc Start_The_Game

	mov [Score], 0 										; מאפס את ניקוד השחקן
	mov [Speed], 100 									; מאפס את המהירות למהירות האיטית ביותר
	
	Game: ; לולאת המשחק
		
		c1:				; במקרה ועכשיו תור קוביה 1 לרדת, זה קטע הקוד שיתבצע וידאג כי הקוביה תרד ותפעל כראוי עד שתינחת על משהו	
		
			call cube1_Turn

			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם

			call endGameCheck 							; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je EndGame 
		
			
		c2:
			call cube2_Turn 
			
			call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם
			
			call endGameCheck 							; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
			cmp dx, 1 
			je EndGame 									; אם היא נגעה לולאת המשחק תסתיים
			
			c3:
				;call cube3_Turn
				
				call destroyLinesCheck 							; בודק אם המשתמש השלים שורה ופועל בהתאם
			
				call endGameCheck 							; בודק אם המשתמש הפסיד וקוביה נגעה בחלקו העליון של הלוח
				cmp dx, 1 
				je EndGame 	

	
	jmp Game 											; סיום לולאת המשחק
	
	EndGame:
	ret
	
endp Start_The_Game



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
			
			
			call RotateCheck_1 ; בודק אם הקוביה תיווצר בעתיד במקום בו יש כבר קוביה
			cmp dx, 1 ; אם כן עוצר את הקוביה
			je stopMovingCube_1____part1
			; אחרת יוצר אותה
			
			
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
				
				
				jmp SecondPast_1
				stopMovingCube_1____part1:
				jmp stopMovingCube_1
				
				SecondPast_1:
				
					push 20 ; אורך בסיס הקוביה
					push 20 ; גובה הקוביה
					call cubeTouchedCheck

					;call cubeTouchedCheck1 ; בודק אם קוביה 1 נגעה במשהו
		
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
			
			call CubePosition ; מעדכן את המצב של הקוביה
			
			cmp [position], 1
			je POS1_CUBE2
			
			cmp [position], 2
			je POS2_CUBE2
			
			POS1_CUBE2:
			
				call RotateCheck_2_POS1  ; בודק אם הקוביה תיווצר בעתיד במקום בו יש כבר קוביה
				cmp dx, 1 ;אם כן עוצר את הקוביה
				je POS1_STOPED_2____part1
				
			
			
				push [xCube]
				push [yCube]
				push [cubeColor]
				call drawCube2_POS1 ; draw the cube
				
			jmp moveCube_2
			
			
			POS2_CUBE2:
			
			
				call RotateCheck_2_POS2  ; בודק אם הקוביה תיווצר בעתיד במקום בו יש כבר קוביה
				cmp dx, 1;אם כן עוצר את הקוביה
				je POS2_STOPED_2____part1
			
				push [xCube]
				push [yCube]
				push [cubeColor]
				call drawCube2_POS2 ; draw the cube
			
			
			
			moveCube_2: ; move down the cube
				
				call CubePosition
				call printScore			
				mov [touchingCheck], 0			
				mov [SaveIt], dl ; dx מגבה את 
				
				cmp [position], 1
				je POS1_MOVMENT_2
			
				cmp [position], 2
				je POS2_MOVMENT_2
			
				POS1_MOVMENT_2:
				
					call movment_2_POS1 ; מזיז את הקוביה לצדדים לפי קלט
				jmp BeContinue
				
				POS2_MOVMENT_2:
					call movment_2_POS2 ; מזיז את הקוביה לצדדים לפי קלט
				
				
				BeContinue:
					cmp [touchingCheck], 1
					je stopMovingCube_2_____part2
					
					;:קטע קוד שאחראי לבדוק מתי עברה שנייה				
					
					mov dl,  [SaveIt] ;  מוציא את די איקס מגיבוי
					call readTime
				
					;xor dh, dh
					mov [newMiliseconds], dl
					
					cmp dl, [miliSeconds]
					jb add1000_2
					jmp fine_2
					
					
					POS1_STOPED_2____part1:
						jmp POS1_STOPED_2
					POS2_STOPED_2____part1:
						jmp POS2_STOPED_2
					
					stopMovingCube_2_____part2:
					jmp stopMovingCube_2_____part1
					
					
					add1000_2:
						;xor dh, dh
						add dl, 100
					fine_2:
						sub dl, [miliSeconds]
						xor dh, dh
						sub [timer], dx
						sub [RotateTimer], dx
						mov dl, [newMiliseconds]
						mov [miliSeconds], dl
						cmp [timer], 0
				jge moveCube_2
					
					SecondPast_2:
					
					
				cmp [position], 1
				je POS1_TouchedCheck_2
			
				cmp [position], 2
				je POS2_TouchedCheck_2
			
				POS1_TouchedCheck_2:
				
					
					push 40 ; אורך בסיס הקוביה
					push 10 ; גובה הקוביה
					call cubeTouchedCheck

							
				
					;call cubeTouchedCheck_2_POS1 ; בודק אם הקוביה נגעה במשהו
				jmp BeContinue1
				
				POS2_TouchedCheck_2:
				
				
								
					push 10 ; אורך בסיס הקוביה
					push 40 ; גובה הקוביה
					call cubeTouchedCheck

					;call cubeTouchedCheck_2_POS2  ; בודק אם הקוביה נגעה במשהו
				
				BeContinue1: 
			
						cmp dx, 1 ; אם היא כן נגעה
						je stopMovingCube_2_____part1 ; אז תפסיק להניע את הקוביה
						
						cmp [touchingCheck], 1 ; בודק אם הקוביה כבר נחתה על משהו
						je YesItTouched_2 ;אם הקוביה נגעה
						
						
						jmp overMe
						stopMovingCube_2_____part1:
						jmp  stopMovingCube_2 
						
						overMe:
							
				cmp [position], 1
				je POS1_MoveDown_2
			
				cmp [position], 2
				je POS2_MoveDown_2
			
				POS1_MoveDown_2:
				
					call moveDown_2_POS1 ; מוריד את הקוביה למטה
				jmp BeContinue2
				
				POS2_MoveDown_2:
					call moveDown_2_POS2  ; מוריד את הקוביה למטה
				
				
				BeContinue2: 
						
						
						
						
						
						
						
						YesItTouched_2:
						mov ax, [Speed]
						mov [timer], ax; מאפס את הטיימר
						
				jmp moveCube_2 ; אם היא לא נגעה המשך להניע אותה
						
				stopMovingCube_2: ; הפסק להניע את הקוביה
					mov ax, [Speed]
					mov [timer], ax ; מאפס את הטיימר
					
					
					
									
							
				cmp [position], 1
				je POS1_STOPED_2
			
				cmp [position], 2
				je POS2_STOPED_2
			
				POS1_STOPED_2:
				
				
					push [xCube]
					push [yCube]
					push [cubeColor]
					call drawCube2_POS1 ; מצייר את המקום האחרון בו הייתה הקוביה
				
				jmp BeContinue3
				
				POS2_STOPED_2:
				
					push [xCube]
					push [yCube]
					push [cubeColor]
					call drawCube2_POS2 ; מצייר את המקום האחרון בו הייתה הקוביה
	
				BeContinue3: 
						
					
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



;פותח קובץ לקריאה וכתיבה
proc openFile
	mov ah, 3Dh
	mov al, 2
	lea dx, [filename]
	int 21h
	jc openError
	mov [filehandle], ax
	ret
	openError:
	mov dx, offset ErrorMsg
	call printString
	ret
endp openFile



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


;סוגר קובץ
proc closeFile
	mov ah,3Eh
;	mov bx, [filehandle]
	int 21h
	ret
endp closeFile



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
	ret 10
endp drawOblong



;=============================================================================================================================================================



color equ [word ptr bp + 4]

;מצייר פיקסל לאן שהעכבר זז
proc drawWithMouse
	push bp
	mov bp, sp
	
	call mouse
	call activeMouse
	
	l:
		call mouseStatus
		push cx
		push dx
		push color
		call drawPixel
	 jmp l

	pop bp
	ret
endp drawWithMouse



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


	call drawTheBackgroundAgain_1

	add [yCube], 10
	 
	push [xCube]
	push [yCube]
	push [cubeSize]
	push [cubeColor]
	call drawCube1

	ret
endp moveDown1



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





		mov	[xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov	[xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov	[xCube3], 0 ; x of block 3
		mov [yCube3], 10  ; y of block 3
		mov	[xCube4], 10 ; x of block 4
		mov [yCube4], 10  ; y of block 4
		
		mov [colorBlock], 9 ;color of blocks

		call drawAllCubes ; draw the cube















	pop bp
	ret 8
endp drawCube1



;=============================================================================================================================================================



		
		
		
proc MoveRight_Cube1_Pos1
		cmp [touchingCheck], 1
		jne notRet5
		ret
		notRet5:

			push 20 ; ארוך הצלע שבודקים
			push 20	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
			call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
			
			cmp dx, 1
			jne NotRet1
			ret
			
		NotRet1:
		
			call drawTheBackgroundAgain_1 ; מצייר את הרקע שוב
		
			add [xCube], 10
			 
			push [xCube]
			push [yCube]
			push [cubeSize]
			push [cubeColor]
			call drawCube1
ret
endp MoveRight_Cube1_Pos1



;=============================================================================================================================================================



proc MoveLeft_Cube1_Pos1
		
		cmp [touchingCheck], 1
		jne notRet4
		ret
		notRet4:
			push 20 ; ארוך הצלע שבודקים
			push 0	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
			call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
			
			
			cmp dx, 1
			jne notRet2
			ret
			
		notRet2:

			call drawTheBackgroundAgain_1 ; מצייר את הרקע שוב
			
			sub [xCube], 10
		
			push [xCube]
			push [yCube]
			push [cubeSize]
			push [cubeColor]
			call drawCube1
			
ret
endp MoveLeft_Cube1_Pos1



;=============================================================================================================================================================



proc MoveDown_Cube1_Pos1

		push 20 ; אורך בסיס הקוביה
		push 20 ; גובה הקוביה
		call cubeTouchedCheck ; בודק אם הקוביה נוגעת במשהו

		cmp dx, 1 ; אם היא לא נגעה תרדי למטה
		jne notRet3 ; אחרת אל תרד
		mov [touchingCheck], dx
		
		ret
		
		notRet3:
			call moveDown1
	
ret
endp MoveDown_Cube1_Pos1

	
	
;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 1 לפי קלט המשתמש
proc movment_1
	
	mov [touchingCheck], 0
	
	ToGetTav ; מקבל תו מהמשתמש בלי לעצור את התוכנית
	
	cmp ah, 4dh ;right
	je extract_key

	cmp ah, 4bh ;left
	je extract_key
	
	cmp ah, 50h ;down
	je extract_key
	
	cmp ah, 48h ;up
	je extract_key
	
	cmp al, 'd' 
	je extract_key

	cmp al, 'a'
	je extract_key
	
	cmp al,'s'
	je extract_key
	
	cmp al,'w'
	je extract_key

	ret
	
	
	extract_key:
	
		mov ah,00h
		int 16h
		
		mov [k],ah

		cmp [k], 4dh ;right
		je d
		
		cmp [k], 4bh ;left
		je a
		
		cmp [k], 50h ;down
		je s
		
		cmp [k], 48h ;up
		je w_Cube1
	
		mov [k],al
		
		cmp [k], 'd'
		je d
		cmp [k], 'a'
		je a
		cmp [k],'s'
		je s
		cmp [k],'w'
		je w_Cube1
		
	
	d:; right
		call MoveRight_Cube1_Pos1
		ret
	
	a:; left
		call MoveLeft_Cube1_Pos1 
		ret
		
	s: ; down
		call MoveDown_Cube1_Pos1
		ret
		
	w_Cube1: ;rotate
		ret ;קוביה 1 לא מסוגלת להסתובב
	
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

;=============================================================================================================================================================


proc MoveRight_Cube2_Pos1
		cmp [touchingCheck], 1
		jne notRet7
		ret
		notRet7:
		
		
		push 10 ; ארוך הצלע שבודקים
		push 40	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
		call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
		
		
		cmp dx, 1
		jne notRet6
		ret
		notRet6:
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS1 ; מצייר את הרקע שוב
	
		add [xCube], 10
		 
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS1
		
ret
endp MoveRight_Cube2_Pos1



;=============================================================================================================================================================



proc MoveLeft_Cube2_Pos1

		
		cmp [touchingCheck], 1
		jne notRet8
		ret
		notRet8:
		
		
		push 10 ; ארוך הצלע שבודקים
		push 0	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
		call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
		
		
		
		
		cmp dx, 1
		jne notRet9
		ret
		notRet9:
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS1 ; מצייר את הרקע שוב
		
		sub [xCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS1
		
ret
endp MoveLeft_Cube2_Pos1



;=============================================================================================================================================================



proc MoveDown_Cube2_Pos1

		push 40 ; אורך בסיס הקוביה
		push 10 ; גובה הקוביה
		call cubeTouchedCheck

		cmp dx, 1 ; אם היא כן נגעה
		je DoNotMove_2_POS1 ; אל תרד למטה
		
		call moveDown_2_POS1 ; אחרת רד למטה

		DoNotMove_2_POS1:
	
			mov [touchingCheck], dx ; si = 1 - touched      0 - didn't touched
			
ret
endp MoveDown_Cube2_Pos1



;=============================================================================================================================================================



proc Rotate_Cube2_Pos1

		cmp [RotateTimer], 0
			jge stopAll_2_POS1
			mov [RotateTimer], 14
	
			call RotateCheck_2_POS2 ;  בודק האם הקוביה יכולה להסתובב בלי לעלות על קוביות אחרות או להרוס את הלוח
			cmp dx, 1 ; אם לא
			je stopAll_2_POS1 ; אל תעשה כלום
		
		
		inc [PosCounter] ; מעלה את המשתנה שסופר באיזה מצב הקוביה נמצאת
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS1 ; מעלים את הקוביה הקודמת כדי שמצב הקוביה יוכל להתשתנות
		
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS2 ; מצייר את הקוביה במצב 2
		ret
		
	stopAll_2_POS1:

endp Rotate_Cube2_Pos1



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 2 לפי קלט המשתמש
proc movment_2_POS1

	ToGetTav ; מקבל תו מהמשתמש בלי לעצור את התוכנית

	cmp ah, 4dh ;right
	je extract_key_2_POS1

	cmp ah, 4bh ;left
	je extract_key_2_POS1
	
	cmp ah, 50h ;down
	je extract_key_2_POS1
	
	cmp ah, 48h ;up
	je extract_key_2_POS1
	
	cmp al, 'd' 
	je extract_key_2_POS1

	cmp al, 'a'
	je extract_key_2_POS1
	
	cmp al,'s'
	je extract_key_2_POS1
	
	cmp al,'w'
	je extract_key_2_POS1

	ret
	
	extract_key_2_POS1:
	
		mov ah,00h
		int 16h
		
		mov [k],ah
	
		
		cmp [k], 4d ;right
		je d_2_POS1
		
		cmp [k], 4bh ;left
		je a_2_POS1
		
		cmp [k], 50h ;down
		je s_2_POS1
		
		cmp [k], 48h ;up
		je w_2_POS1
	
	
		mov [k],al
		
		cmp [k], 'd'
		je d_2_POS1
		
		cmp [k], 'a'
		je a_2_POS1
		
		cmp [k],'s'
		je s_2_POS1
		
		cmp [k],'w'
		je w_2_POS1
	
	
	d_2_POS1: ; right
		call MoveRight_Cube2_Pos1
		ret

	a_2_POS1: ; left
		call MoveLeft_Cube2_Pos1
		ret
		
	s_2_POS1: ; down
		call MoveDown_Cube2_Pos1
		ret
		
	w_2_POS1: ; switch position
		call Rotate_Cube2_Pos1
		ret

ret
endp movment_2_POS1







;=============================================================================================================================================================


proc MoveRight_Cube2_Pos2
		cmp [touchingCheck], 1
		jne notRet10
		ret
		notRet10:
		
		
		push 40 ; ארוך הצלע שבודקים
		push 10	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
		call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
		
		
	
		cmp dx, 1
		jne notRet11
		ret
		notRet11:
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS2 ; מצייר את הרקע שוב
	
		add [xCube], 10
		 
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS2
		
ret
endp MoveRight_Cube2_Pos2



;=============================================================================================================================================================



proc MoveLeft_Cube2_Pos2

		
		cmp [touchingCheck], 1
		jne notRet12
		ret
		notRet12:
		
		push 40 ; ארוך הצלע שבודקים
		push 0	; לצד שמאל תמיד מכניסים 0, לצד ימין מכניסים את רוחב הקוביה
		call cube_touched_block_or_wall ; בודק אם הקוביה נגעה במשהו מהצד
		
		cmp dx, 1
		jne notRet13
		ret
		notRet13:
		
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS2 ; מצייר את הרקע שוב
		
		sub [xCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS2
		
		
ret
endp MoveLeft_Cube2_Pos2



;=============================================================================================================================================================



proc MoveDown_Cube2_Pos2

		push 10 ; אורך בסיס הקוביה
		push 40 ; גובה הקוביה
		call cubeTouchedCheck

		cmp dx, 1 ; אם היא כן נגעה
		je DoNotMove_2_POS2 ; אל תרד למטה
		
		call moveDown_2_POS2 ; אחרת רד למטה

		DoNotMove_2_POS2:
	
			mov [touchingCheck], dx 
			
ret
endp MoveDown_Cube2_Pos2



;=============================================================================================================================================================



proc Rotate_Cube2_Pos2


			cmp [RotateTimer], 0
			jge stopAll_2_POS2
			mov [RotateTimer], 14

			call RotateCheck_2_POS1 ;  בודק האם הקוביה יכולה להסתובב בלי לעלות על קוביות אחרות או להרוס את הלוח
			cmp dx, 1 ; אם לא
			je stopAll_2_POS2 ; אל תעשה כלום
			inc [PosCounter] ; מעלה את המשתנה שסופר באיזה מצב הקוביה נמצאת
			push [xCube]
			push [yCube]
			call drawTheBackgroundAgain_2_POS2
			
			push [xCube]
			push [yCube]
			push [cubeColor]
			call drawCube2_POS1
		ret
		
	stopAll_2_POS2:
	ret
endp Rotate_Cube2_Pos2



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 2 לפי קלט המשתמש
proc movment_2_POS2

	ToGetTav ; מקבל תו מהמשתמש בלי לעצור את התוכנית

	cmp ah, 4dh ;right
	je extract_key_2_POS2

	cmp ah, 4bh ;left
	je extract_key_2_POS2
	
	cmp ah, 50h ;down
	je extract_key_2_POS2
	
	cmp ah, 48h ;up
	je extract_key_2_POS2

	cmp al, 'd' 
	je extract_key_2_POS2

	cmp al, 'a'
	je extract_key_2_POS2
	
	cmp al,'s'
	je extract_key_2_POS2
	
	cmp al,'w'
	je extract_key_2_POS2

	ret

	extract_key_2_POS2:
	
		mov ah,00h
		int 16h

		mov [k],ah

		cmp [k], 4dh ;right
		je d_2_POS2
		
		cmp [k], 4bh ;left
		je a_2_POS2
		
		cmp [k], 50h ;down
		je s_2_POS2
		
		cmp [k], 48h ;up
		je w_2_POS2
	
		mov [k],al
		
		cmp [k], 'd'
		je d_2_POS2
		
		cmp [k], 'a'
		je a_2_POS2
		
		cmp [k],'s'
		je s_2_POS2
		
		cmp [k],'w'
		je w_2_POS2
		
	
	d_2_POS2: ; right
		call MoveRight_Cube2_Pos2
		ret

	a_2_POS2: ; left
		call MoveLeft_Cube2_Pos2
		ret
		
	s_2_POS2: ; down
		call MoveDown_Cube2_Pos2
		ret
		
	w_2_POS2: ; switch position
		call Rotate_Cube2_Pos2
		ret
		
ret
endp movment_2_POS2



;=============================================================================================================================================================



; פרוצדורה שמורידה את קוביה 2 למטה
proc moveDown_2_POS1
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS1 ; מצייר את הרקע שוב
		
		add [yCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS1
		ret
endp moveDown_2_POS1



;=============================================================================================================================================================



; פרוצדורה שמורידה את קוביה 2 במצב 2 למטה
proc moveDown_2_POS2
		push [xCube]
		push [yCube]
		call drawTheBackgroundAgain_2_POS2 ; מצייר את הרקע שוב
		
		add [yCube], 10
	
		push [xCube]
		push [yCube]
		push [cubeColor]
		call drawCube2_POS2
		ret
endp moveDown_2_POS2



;=============================================================================================================================================================



x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

; פרוצדורה שמציירת שוב את הרקע שמאחורי קוביה 2
proc drawTheBackgroundAgain_2_POS1

	push bp
	mov bp, sp
	
	dec x 
	mov dx, 10
	add dx, y
	row_2_POS1:	
		mov cx, 41 
		add cx, x
		column_2_POS1:
			push cx
			push dx
			push 7
			call drawPixel
			dec cx
			cmp cx, x
		jne column_2_POS1
		dec dx
		cmp dx, y
	jne row_2_POS1
	
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

endp drawTheBackgroundAgain_2_POS1



;=============================================================================================================================================================



x equ [word ptr bp + 6]
y equ [word ptr bp + 4]


; פרוצדורה שמציירת את הרקע שוב של קוביה 2 במצב 2
proc drawTheBackgroundAgain_2_POS2
	push bp
	mov bp, sp
	
	mov cx, 4
	DrawCube:
		push x
		push y
		call draw_Small_Cube_BackGround
		
		add y, 10
	loop DrawCube
	
	pop bp
	
	ret 4
endp drawTheBackgroundAgain_2_POS2



;=============================================================================================================================================================



x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [word ptr bp + 4]

;פרוצדורה שמציירת את קוביה מספר 2
proc drawCube2_POS1
	push bp
	mov bp, sp
	
	mov cx, 4
	DrawSmallCube:
		push x
		push y
		push color
		call draw_Small_Cube
		
		add x, 10
	loop DrawSmallCube
	
	pop bp
	ret 6
endp drawCube2_POS1



;=============================================================================================================================================================



x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [word ptr bp + 4]

;פרוצדורה שמציירת את קוביה מספר 2 במצב 2
proc drawCube2_POS2
	push bp
	mov bp, sp
	
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], 20  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], 30  ; y of block 4
		
		mov [colorBlock], 4 ;color of blocks

		call drawAllCubes ; draw the cube

	pop bp
	
	ret 6
endp drawCube2_POS2



;=============================================================================================================================================================




	


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








; קובע את מצב הקוביה
proc CubePosition4



	mov ax, [PosCounter]

	mov bl, 4
	div bl
	mov [position], ah
	inc [position]

ret
endp CubePosition4


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
		cmp al, 29
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
		cmp al, 29
		jne addOneTouchingCheck_2
	jmp ok0
	
	addOneTouchingCheck_2:
		mov dx, 1
		
	stop1:
		pop bp
		ret 4
endp cubeTouchedCheck ; dx = 1 - yes \ dx = 0 - no



;=============================================================================================================================================================



; פרוצדורה שבודקת אם קוביה 2 יכולה להסתובב או לא כאר היא במצב 2
proc RotateCheck_2_POS1

	xor dx, dx
	
	inc [yCube]
	mov bx, [yCube]
	add bx, 8
	
	mov si, [xCube]
	add si, 11
	row2_POS1R:	
		mov cx, 28
		add cx, si
		column2_POS1R:
		
		
		push cx
		push bx
		call getPixel



		cmp al, 7h
		jne NotGrey_2_POS1
		
		Fine_2_POS1:
			dec cx
			cmp cx, si
	jne column2_POS1R
	
	
	dec bx
		cmp bx, [yCube]
	jne row2_POS1R
	
	jmp stop_2_POS1
	
	NotGrey_2_POS1:
		cmp al, 29
		jne NotGreyOrWhite_2_POS1
	jmp Fine_2_POS1
	
	NotGreyOrWhite_2_POS1:
		mov dx, 1
	
	stop_2_POS1:
	
	dec [yCube]
	
	ret
endp RotateCheck_2_POS1 ; dx = 1 can't rotate      dx = 0 can rotate
	
	
	
;=============================================================================================================================================================

	
	
; פרוצדורה שבודקת אם קוביה 2 יכולה להסתובב או לא כאשר היא במצב 1
proc RotateCheck_2_POS2

	xor dx, dx
	
	mov bx, [yCube]
	mov si, [yCube]
	add si, 11
	add bx, 40
	
	inc [xCube]
	row2_POS2R:	
		mov cx, 8
		add cx, [xCube]
		column2_POS2R:
		
		
		push cx
		push bx
		call getPixel





		cmp al, 7h
		jne NotGrey_2_POS2
		
		Fine_2_POS2:
			dec cx
			cmp cx, [xCube]
	jne column2_POS2R
	
	
	dec bx
		cmp bx, si
	jne row2_POS2R
	
	jmp stop_2_POS2
	
	NotGrey_2_POS2:
		cmp al, 29
		jne NotGreyOrWhite_2_POS2
	jmp Fine_2_POS2
	
	NotGreyOrWhite_2_POS2:
		mov dx, 1
	
	stop_2_POS2:
	dec [xCube]
	

	ret
endp RotateCheck_2_POS2 ; dx = 1 can't rotate      dx = 0 can rotate
	


;=============================================================================================================================================================

	
	
proc RotateCheck_1

	xor dx, dx
	
	mov bx, [yCube]
	add bx, 19
	

	row1_POS1R:	
		mov cx, [xCube]
		add cx, 19
		column1_POS1R:
		
		
		push cx
		push bx
		call getPixel

		cmp al, 7h
		jne NotGrey_1_POS1
		
		Fine_1_POS1:
			dec cx
			cmp cx, [xCube]
	jne column1_POS1R
	
	
		dec bx
		cmp bx, [yCube]
	jne row1_POS1R
	
	jmp stop_1_POS1
	
	NotGrey_1_POS1:
		cmp al, 29
		jne NotGreyOrWhite_2_POS1
	jmp Fine_1_POS1
	
	NotGreyOrWhite_1_POS1:
		mov dx, 1
	
	stop_1_POS1:
	
	
	ret
endp RotateCheck_1 ; dx = 1 can't rotate      dx = 0 can rotate
	
	

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
	push 29 ; color
	call drawSmallLineY ; מצייר קו אופקי לקוביה

	inc y ; חישובים לקראת ציור הקו או הריבוע הב

	push y ; y
	push 9 ; length
	push x ; x
	push 29 ; color
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	add x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא

	push y ; y
	push 9 ; length
	push x ; x
	push 29 ; color
	call drawSmallLineX ; מצייר קו אנכי לאמצע הקוביה
	
	sub x, 10 ; חישובים לקראת ציור הקו או הריבוע הבא
	add y, 9 ; חישובים לקראת ציור הקו או הריבוע הבא

	push x ; x
	push 10 ; length
	push y ; y
	push 29 ; color
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
		
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
;Left side check set:
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
;Floor check set:

		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים

;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], 0 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים





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
		mov [xCube3], 20 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -10 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 30; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 40; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], 20 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
				
				;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], 0 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		
		;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],6 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
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
		mov [yCube3], 20  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 30; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		
		
				;Rotate check set:

		mov [xRotate1], 10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], -20 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27		; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos2



;=============================================================================================================================================================

proc Set_Cube2_Pos3
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], -10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], -20 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -20; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 40; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		;cube's starting place set:

		mov [addX],	20; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],7 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
			
	ret
endp Set_Cube2_Pos3



;=============================================================================================================================================================



proc Set_Cube2_Pos4
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 0 ; x of block 2
		mov [yCube2], 10  ; y of block 2
		mov [xCube3], 0 ; x of block 3
		mov [yCube3], -10  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -20  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37		; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos4
































proc Set_Cube3_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], -10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 10 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 0 ; x of block 4
		mov [yCube4], -10  ; y of block 4
		mov [colorBlock], 5 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		
		
				;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], 0 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		
		
		
		
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
		mov [colorBlock], 5 ;color of blocks
		
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
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], -10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], -10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		
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
		mov [colorBlock], 5 ;color of blocks
		
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
			
			
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
		mov [xRotate4], 0 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		
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
		mov [colorBlock], 5 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
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
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			;cube's starting place set:
	
	
	
	;Rotate check set:

		mov [xRotate1], 10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 10; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate4], 10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate4], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים







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
		mov [colorBlock],0 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 20 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 0; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
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
		mov [colorBlock], 0 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 20; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
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
		mov [colorBlock], 1 ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			
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
		mov [colorBlock],1 ;color of blocks
		
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10; אורך הצלע שבודקים
		mov	[Right_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 20 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 10; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים


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
		mov [colorBlock], 6h ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 20; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 0; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
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
		mov [colorBlock], 6h ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], -20 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
		
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
		mov [colorBlock], 6h ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 20; אורך הצלע שבודקים
		mov	[Right_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 30 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
		
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
		mov [colorBlock], 6h ;color of blocks
		
		mov	[Right_Parts], 2; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 20; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0 ; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
		
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
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 30 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
			
			
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 10; אורך הבסיס שבודקים
		mov [Floor_distance1], 20 ; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
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
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], -20 ; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10; אורך הצלע שבודקים
		mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		
		mov [Floor_Parts], 2 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -20 ; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20 ; אורך הבסיס שבודקים
		mov [Floor_distance1], 0 ; המרחק האנכי מראשית הקוביה שבודקים
		mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		mov [Floor_distance2], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
		
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
		mov [colorBlock], 15 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 30; אורך הצלע שבודקים
		mov	[Right_distance1], 10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 2 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -20 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength2], 10 ; אורך הצלע שבודקים
		mov	[Left_distance2], -10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 20; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
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
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], -10 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 20 ; אורך הצלע שבודקים
		mov	[Left_distance1], -10; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], -10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 30; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 20; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 10; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 10 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 10; המרחק האנכי מראשית הקוביה שבודקים
			
			
			;cube's starting place set:

		mov [addX],	10; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],8 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 27	; ערך הוואי ההתחלתי של הקוביה	
			mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube7_Pos4



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



;proc Rotate


		;	cmp [RotateTimer], 0
		;	jge stopAllRotate
		;	mov [RotateTimer], 14

		;	call RotateCheck ;  בודק האם הקוביה יכולה להסתובב בלי לעלות על קוביות אחרות או להרוס את הלוח
		;	cmp dx, 1 ; אם לא
		;	je stopAllRotate ; אל תעשה כלום
		;	inc [PosCounter] ; מעלה את המשתנה שסופר באיזה מצב הקוביה נמצאת
		;	push [xCube]
		;	push [yCube]
		;	call drawTheBackgroundAgain_2_POS2
			
		;	push [xCube]
		;	push [yCube]
		;	push [cubeColor]
		;	call drawCube2_POS1
		;ret
		
	;stopAllRotate:
	;ret
;endp Rotate



;=============================================================================================================================================================



; פרוצדורה שאחראית להזיז את קוביה 2 לפי קלט המשתמש
proc Movment_Cube
	;call Calculate_Cube_Num ;מחשב את המספר של הקוביה
	;push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
	;call SetCube


	ToGetTav ; מקבל תו מהמשתמש בלי לעצור את התוכנית

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
		;call Rotate
		;ret
		
		;call RotateCheck_
		;cmp dx, 1
		;je retTime

		cmp [RotateTimer], 0
		jge retTime
		mov [RotateTimer], 14

		
		call drawALLCubes_BackGround
	
		inc [position]
		
		call FixPosition ;make sure that [position] equals to the next [position]
		call Calculate_Cube_Num ;מחשב את המספר של הקוביה
		push [CUBEfinal] ; דוחף את הקוביה במצב שלה. ספרת היחידות זה מהצב וספרת העשרות זה מספר הקוביה
		call SetCube
		call drawALLCubes
		
	retTime:
ret
endp Movment_Cube



;=============================================================================================================================================================



; פרוצדורה שמורידה את קוביה 2 במצב 2 למטה
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

		cmp al, 7h
		jne changeTo_Yes
		all_right:
			dec cx
			cmp cx, [yCube]
	jne checkEverySinglePixel
	jmp stopIt
	
	changeTo_Yes:
		cmp al, 29
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
		cmp al, 29
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




			push [addX]									; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
			push [rangeX]								; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70
			call getCubeStartingPointX					;מחזיר ערך איקס שהקוביה יכולה לצאת ממנו

		cube_:
			; קובע את ההגדרות של הקוביה שתיווצר
			mov ax, [Xstart]	
			mov [xCube], ax	; X of the cube: 60/70/80/90/100/110/120/130/140/150
			mov ax, [startingY]
			mov [yCube], ax ;17/27/37
			
		

			;call RotateCheck_ ; בודק אם הקוביה תיווצר בעתיד במקום בו יש כבר קוביה
			;cmp dx, 1 ; אם כן עוצר את הקוביה
			;je stopMovingCube_1____part1
			; אחרת יוצר אותה
			
			
			call drawAllCubes ; draw the cube
			
			moveCube_: ; move down the cube

				call printScore			
				mov [touchingCheck], 0			
				mov [SaveIt], dl ; dx מגבה את 
				
				call Movment_Cube ; מזיז את הקוביה לצדדים לפי קלט
				
				cmp [touchingCheck], 1
				je stopMovingCube_
				
				;:קטע קוד שאחראי לבדוק מתי עברה שנייה				
				
				mov dl,  [SaveIt] ;  מוציא את די איקס מגיבוי
				call readTime
			
				;xor dh, dh
				mov [newMiliseconds], dl
				
				cmp dl, [miliSeconds]
				jb add100_
				jmp fine_
				
				add100_:
					;xor dh, dh
					add dl, 100
				fine_:
					sub dl, [miliSeconds]
					xor dh, dh
					sub [timer], dx
					sub [RotateTimer], dx
			
					mov dl, [newMiliseconds]
					mov [miliSeconds], dl
					cmp [timer], 0
			jge moveCube_
				
				
			;	jmp SecondPast_
				;stopMovingCube_1____part1:
				;jmp stopMovingCube_1
				
				SecondPast_:
				
					call MoveDown

					;call cubeTouchedCheck1 ; בודק אם קוביה 1 נגעה במשהו
		
					cmp dx, 1 ; אם היא כן נגעה
					je stopMovingCube_ ; אז תפסיק להניע את הקוביה
					
					cmp [touchingCheck], 1 ; בודק אם הקוביה כבר נחתה על משהו
					je YesItTouched_ ;אם הקוביה נגעה
				
					
					YesItTouched_:
					mov ax, [Speed]
					mov [timer], ax; מאפס את הטיימר
					
			jmp moveCube_ ; אם היא לא נגעה המשך להניע אותה
					
			stopMovingCube_: ; הפסק להניע את הקוביה
				mov ax, [Speed]
				mov [timer], ax ; מאפס את הטיימר
		
				call drawAllCubes ; draw the cube
			ret
endp cube_Starts



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
	
	
	
	
	
	
	; מצייר כל קוביה לפי הערכים של איקס והוואי של הבלוקים
proc RotateCheck_


xor dx, dx

mov ax, [xRotate1]
add ax, [xCube]
mov bx, [yRotate1]
add bx, [yCube]
add ax, 5
add bx, 5

	push ax
	push bx
	push 2
	call drawPixel
	;call getPixel
	
	
	;cmp al, 7 ;check if the color is grey
	;jne ItCantRotate ;if it isn't jump to another check

	
	
	
	
mov ax, [xRotate2]
add ax, [xCube]
mov bx, [yRotate2]
add bx, [yCube]
add ax, 5
add bx, 5

	push ax
	push bx
	push 2
	call drawPixel
	;call getPixel
	
	
	;cmp al, 7 ;check if the color is grey
	;jne ItCantRotate ;if it isn't jump to another check

	
	
	
	
mov ax, [xRotate3]
add ax, [xCube]
mov bx, [yRotate3]
add bx, [yCube]
add ax, 5
add bx, 5
	
	
		push ax
	push bx
	push 2
	call drawPixel
	;call getPixel
	
	;cmp al, 7 ;check if the color is grey
	;jne ItCantRotate ;if it isn't jump to another check

	
	
mov ax, [xRotate4]
add ax, [xCube]
mov bx, [yRotate4]
add bx, [yCube]
add ax, 5
add bx, 5
	
	push ax
	push bx
	push 2
	call drawPixel
	;call getPixel
	
	
	cmp al, 7 ;check if the color is grey
	jne ItCantRotate ;if it isn't jump to another check

	
	

	
	
	
	
	
	
	
	jmp ItCanRotate
	ItCantRotate:
	
	mov dx, 1
	ItCanRotate:
	
ret
endp RotateCheck_ ; dx = 1 - can't rotate     dx = 0 - can rotate

	

	
	
	
	
	
	
	
	
	