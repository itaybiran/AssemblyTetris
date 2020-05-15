
		mov [yCube], 137
		mov [xCube], 90
		
		push 74
		call SetCube
		call drawAllCubes


		mov [yCube], 97
		mov [xCube], 90
		
		push 63
		call SetCube
		call drawAllCubes


		mov [yCube], 67
		mov [xCube], 90
		
		push 52
		call SetCube
		call drawAllCubes
		
		
		mov [yCube], 177
		mov [xCube], 90
		
		push 42
		call SetCube
		call drawAllCubes



		mov [yCube], 97
		mov [xCube], 130
		
		push 34
		call SetCube
		call drawAllCubes


		mov [yCube], 127
		mov [xCube], 120
		
		push 22
		call SetCube
		call drawAllCubes



		mov [yCube], 167
		mov [xCube], 140
		
		push 11
		call SetCube
		call drawAllCubes




















proc Set_Cube2_Pos1
		mov [xCube1], 0 ; x of block 1
		mov [yCube1], 0 ; y of block 1
		mov [xCube2], 10 ; x of block 2
		mov [yCube2], 0  ; y of block 2
		mov [xCube3], 20 ; x of block 3
		mov [yCube3], 0  ; y of block 3
		mov [xCube4], 30 ; x of block 4
		mov [yCube4], 0  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Right_distance1], 40; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Left_sideLength1], 10 ; אורך הצלע שבודקים
		mov	[Left_distance1], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength2], 0; אורך הצלע שבודקים
		;mov	[Left_distance2], 0 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Left_AddToY3], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Left_sideLength3], 0 ; אורך הצלע שבודקים
		;mov	[Left_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
		
		
		mov [Floor_Parts], 1 ; כמות השינויים בגובה שיש לבסיס הקוביה
		mov [Floor_AddToX1], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov [Floor_sideLength1], 40; אורך הבסיס שבודקים
		mov [Floor_distance1], 10; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],7 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17	; ערך הוואי ההתחלתי של הקוביה
		
			mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה
			
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
		mov [yCube4], 30  ; y of block 4
		mov [colorBlock], 4 ;color of blocks
		
		mov	[Right_Parts], 1; כמות השינויים בגובה שיש לצד ימין של הקוביה
		mov	[Right_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		mov	[Right_sideLength1], 40 ; אורך הצלע שבודקים
		mov	[Right_distance1], 10 ; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY2], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength2], 0 ; אורך הצלע שבודקים
		;mov	[Right_distance2], 0; המרחק האופקי מראשית הקוביה שבודקים
		;mov	[Right_AddToY3], 0; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov	[Right_sideLength3], 0; אורך הצלע שבודקים
		;mov	[Right_distance3], 0; המרחק האופקי מראשית הקוביה שבודקים
			
		mov	[Left_Parts], 1 ; כמות השינויים בגובה שיש לצד שמאל של הקוביה
		mov	[Left_AddToY1], 0 ; המספר שצריך להוסיף לוואי כדי להגיע לנקודת ההתחלה של הצלע שבודקים
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
		mov [Floor_distance1], 40; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX2], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength2], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance2], 0; המרחק האנכי מראשית הקוביה שבודקים
		;mov [Floor_AddToX3], 0; המספר שצריך להוסיף לאיקס כדי להגיע לנקודת ההתחלה של הצלע שבודקים
		;mov [Floor_sideLength3], 0 ; אורך הבסיס שבודקים
		;mov [Floor_distance3], 0; המרחק האנכי מראשית הקוביה שבודקים
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 17		; ערך הוואי ההתחלתי של הקוביה
					mov [NumOfStates], 2 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos2















	
	GetANum:
	call DrawModesPage
		call inputTav
		cmp al, '1'
		je Classic_
		cmp al, '2'
		je TurtleSpeed_
		cmp al, '3'
		je SuperHard_
		cmp al, '4'
		je Spiderman_
		cmp al, '5'
		je OneByOne_
		cmp al, '6'
		je Rainbow_
		
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
		
	Spiderman_:
		call Spiderman_Mood
		ret
		
	OneByOne_:
		call OneByOne_Mood
		ret
	Rainbow_:
	call Rainbow_Mood
	ret
