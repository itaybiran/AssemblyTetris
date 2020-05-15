
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
		
;=============================================================================================================================================	
		
proc TheNextCubeToPlay_OneByOne
        ; generate a rand no using the system time
RANDSTART8:
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov  ax, dx
	xor  dx, dx
	mov bl, 17
	mul bl
	mov cx, ax
	mov  cx, 8  
	div  cx       ; here dx contains the remainder of the division - from 0 to 7
	inc dl
RET
endp TheNextCubeToPlay_OneByOne ; dl = מספר הקוביה האקראי שהוגרל
	
;=============================================================================================================================================
			
cube equ [word ptr bp + 4] ;ספרת העשרות מייצגת את הקוביה וספרת היחידות מייצגת את מצב הקוביה
; מגדיר את קוביה 8 במקרה והיא נבחרה
proc SetCube8
	push bp
	mov bp, sp


	cmp cube, 81
	je Cube8_Pos1
	jmp TheEnd8

	Cube8_Pos1: ;Set cube 8 pos 1
		call Set_Cube8_Pos1
	jmp TheEnd8

	TheEnd8:

	pop bp
	ret 2

endp SetCube8
		
;=============================================================================================================================================
	
;change the color of hte cube to white or blcak randomly
proc changeToRedOrBlue
	call TheNextPositionToPlay2 					;מגריל מספר אקראי מ1 עד 2
	cmp dl, 2
	je Red
	Blue:
		mov [colorBlock], 0C8h ;blue 						;color of blocks
	jmp ColorWasSetted
	Red:
		mov [colorBlock], 0Fh ;red							;color of blocks
	ColorWasSetted:
	ret
endp changeToRedOrBlue	
	
;=============================================================================================================================================	
			
;change the color of hte cube to white or blue randomly
proc changeToWhiteOrBlue
	call TheNextPositionToPlay2 					;מגריל מספר אקראי מ1 עד 2
	cmp dl, 2
	je White
	Blue_:
		mov [colorBlock], 0FCh ;blue 						;color of blocks
	jmp ColorWasSetted
	White:
		mov [colorBlock], 0F6h ;white						;color of blocks
	ColorWasSetted_:
	ret
endp changeToWhiteOrBlue

;=============================================================================================================================================	

proc MakeTheBoardSmaller
		push 59
		push 157
		push 101
		push 40
		push 7h
		call drawOblong
		
		push 60 ; נקודת התחלה של הקו
		push 100 ; אורך הקו
		push 158 ; שיעור הוואי של הקו
		push 0 ; צבע הקו
		call drawSmallLineY

		push 60 ; נקודת התחלה של הקו
		push 100 ; אורך הקו
		push 159 ; שיעור הוואי של הקו
		push 0 ; צבע הקו
		call drawSmallLineY
		ret
endp MakeTheBoardSmaller

;=============================================================================================================================================

proc drawCrazyBoard1
			
		mov [yCube], 137
		mov [xCube], 90
		
		push 74
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 97
		mov [xCube], 90
		
		push 63
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 67
		mov [xCube], 110
		
		push 52
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
	
		mov [yCube], 177
		mov [xCube], 120
		
		push 42
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
	
		mov [yCube], 167
		mov [xCube], 140
		
		push 11
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
	
	ret
endp drawCrazyBoard1

;=============================================================================================================================================

proc drawCrazyBoard2

		mov [yCube], 177
		mov [xCube], 80
		
		push 42
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
	
		mov [yCube], 157
		mov [xCube], 130
		
		push 11
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		
		mov [yCube], 97
		mov [xCube], 130
		
		push 34
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 147
		mov [xCube], 80
		
		push 21
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		
		mov [yCube], 127
		mov [xCube], 140
		
		push 72
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		
		ret
endp drawCrazyBoard2

;=============================================================================================================================================

proc drawCrazyBoard3

		mov [yCube], 147
		mov [xCube], 90
		
		push 52
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 137
		mov [xCube], 120
		
		push 33
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		
		mov [yCube], 177
		mov [xCube], 70
		
		push 11
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 157
		mov [xCube], 150
		
		push 22
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		ret
		
		mov [yCube], 127
		mov [xCube], 130
		
		push 62
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		ret
		
endp drawCrazyBoard3

;=============================================================================================================================================

proc drawCrazyBoard4

		mov [yCube], 127
		mov [xCube], 80
		
		push 43
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 157
		mov [xCube], 130
		
		push 31
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		
		mov [yCube], 177
		mov [xCube], 60
		
		push 11
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second

		mov [yCube], 117
		mov [xCube], 60
		
		push 22
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		ret
		
		mov [yCube], 147
		mov [xCube], 80
		
		push 74
		call SetCube
		mov [colorBlock], 9 ;color of block
		call drawAllCubes
		call second
		ret
		
endp drawCrazyBoard4

;=============================================================================================================================================

proc drawCrazyBoard
	call TheNextPositionToPlay4
	cmp dl, 1
	je draw1
	cmp dl, 2
	je draw2
	cmp dl, 3
	je draw3
	cmp dl, 4
	je draw4
	jmp drawRet
	draw1:
		call drawCrazyBoard1
	jmp drawRet
	draw2:
		call drawCrazyBoard2
	jmp drawRet
	draw3:
		call drawCrazyBoard3
	jmp drawRet
	draw4:
		call drawCrazyBoard4
	jmp drawRet

	drawRet:
ret
endp drawCrazyBoard
