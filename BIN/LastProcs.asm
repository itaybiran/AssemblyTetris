
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
	;cubeColor dw 6 ; צבע הקוביה
	miliSeconds db 0 ; מספר המילי שניות שעברו עד כה
	newMiliseconds db ? ; מספר המילי שניות שעברו עד כה לאחר הלולאה
	timer dw 100 ; מספר אלפיות השנייה שנשארו עד שתעבור שנייה מלאה
	SaveIt db ? ; dx מגבה את
	color_Of_Lines dw 28 ; צבע הקו המחלק את הקוביות
	touchingCheck dw 0
	;random dw ?
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
		
		;TheNextCube dw ?
		
		
		
		
		
		
		
		
		
		
		
		

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



;סוגר קובץ
proc closeFile
	mov ah,3Eh
;	mov bx, [filehandle]
	int 21h
	ret
endp closeFile



;=============================================================================================================================================================

