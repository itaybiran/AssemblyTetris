IDEAL
MODEL small
STACK 100h
DATASEG



CODESEG


xCube dw 180
yCube dw 17
cubeSize dw 30
cubeColor dw 6
miliSeconds db ?
counter db 0
touchingCheck db 0
AllTheX dw 0
AllTheY dw 0

	include "proc.asm"



start:

	call begin ;מאפס הכל


;   call PushAll (macro) - מגבה
;   call PopAll (macro) - מגבה
;   call begin - התחלת תוכנית
;   call escape - יציאה מהתוכנית

;   call inputTav - קולט תו
;   call inputNum - קולט מספר
;   call inputString - קולט מחרוזת
;   call printTav - מדפיס תו
;   call printString - מדפיס מחרוזת
;   call newLine - שורה חדשה

;   call readTime - קורא את הזמן
;   call second - השהייה של שנייה

;   call graphicMod - מצב גרפי
;   call textMod - מצב טקסט
;   call activeMouse - מפעיל עכבר
;   call mouse - מאתחל עכבר
;   call mouseStatus - מצב עכבר

;   call openFile - יוצר קובץ
;   call writeToFile - כותב לקובץ
;   call readFile - קורא מקובץ
;   call closeFile - סוגר קובץ

;   call openSpeaker - מפעיל שמע
;   call closeSpeaker - סוגר שמע
;   call playDo - מנגן דו
;   call playLa - מנגן לה
;   call playRe - מנגן רה

;   call drawPixel - מצייר פיקסל
;   call getPixel - מקבל צבע פיקסל
;   call drawLine - מצייר קו
;   call drawRect - מצייר ריבוע
;   call drawOblong - מצייר מלבן
;   call drawWithMouse - מצייר עם העכבר
;   call rectMovment - תנועת ריבוע 
;   call backgroundColor - צבע רקע

	call graphicMod ; change to graphic mood


	BoardDrawer ; draw the board

call openSpeaker
call playDo
	push 60
	push 187
	push 4
	call drawCube2

	push 70
	push 177
	push 4
	call drawCube2

	push 70
	push 157
	push 20
	push 9h
	call drawCube1


;call inputTav

;cmp al, 'd'
;je moveRightCube
;cmp al, 'D'
;je moveRightCube
;cmp al, 'a'
;je moveLeftCube
;cmp al, 'A'
;je moveLeftCube


;moveRightCube:
;	call moveRight
;jmp moveItDown

;moveLeftCube:
;	call moveLeft
;jmp moveItDown

;moveItDown:


		
	
	Game:
		
		mov [xCube], 60 ; 60\80\100\120\140\160\180\200\220\240
		mov [yCube], 17
		mov [cubeSize],20
		mov [cubeColor], 9h
		
		push [xCube]
		push [yCube]
		push [cubeSize]
		push [cubeColor]
		call drawCube1 ; draw the cube
		
		
		
		
		moveCube: ; move down the cube
		
				call second
				call moveDown2
				
				call cubeTouchedCheck
	
				cmp dx, 1
				je stopMovingCube
				
				
		jmp moveCube
				
		stopMovingCube:
		
			push [xCube]
			push [yCube]
			push [cubeSize]
			push [cubeColor]
			call drawCube1

	jmp Game
	
exit:

	call escape ;יוצא מהריצה

END start 
