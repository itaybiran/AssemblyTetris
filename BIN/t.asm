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
		mov [xRotate2], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
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
		
		
						;Rotate check set:

		mov [xRotate1], 0  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 0 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], -10; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 0; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], -20; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
	
		
		
		
		
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
		
		
		
		;Rotate check set:

		mov [xRotate1], -10  ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate1], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate2], 10 ; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate2], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים
		mov [xRotate3], 20; כמה שצריך הוסיף לאיקס הקוביה מראשית הקוביה כדי להגיע לפיקסל שבודקים
		mov [yRotate3], 0; כמה שצריך להוסיף לוואי הקוביה מראשית הצירים כדי להגיע לפיקסל שבודקים

		
		
		;cube's starting place set:

		mov [addX],	0; כמה להוסיף לערך האיקס של הקוביה כדי שהיא לא תיגע בקצה מצד שמאל
		mov [rangeX],10 ; 10 = 150, 9 = 140, 8 = 130, 7 = 120, 6 = 110, 5 = 100, 4 = 90, 3 = 80, 2 = 70 
					
		mov [startingY], 37		; ערך הוואי ההתחלתי של הקוביה
		
		mov [NumOfStates], 4 ;מספר המצבים שיש לקוביה
	ret
endp Set_Cube2_Pos4
