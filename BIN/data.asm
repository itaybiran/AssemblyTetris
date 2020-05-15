
DATASEG
;=============================================================================================================================================
;TIME:
	Clock db '00:00'
	DLHolder db 0
	InternalClock dw 0
	seconds db 0
	minutes db 0
;=============================================================================================================================================
;music
	counter_mili dw 0 ; count tiks
	time_check db 0 ;check the time
	former_note dw 0 ;התו הקודם שהתנגן
	delay_var db 0
;=============================================================================================================================================
;messages:
	TopMessage db 'Score:$'
	BestMessage db 'Best:$'
	TimeMessage db 'Time:$'
	classic_Message db 'Classic$'
	TurtleSpeed_Message db 'Turtle Speed$'
	SuperHard_Message db 'Super Hard$'
	SpiderMan_Message db 'Spider-Man$'
	OneByOne_Message db 'One By One$'
	CrazyBoard_Message db 'Crazy Board$'
	NoRotations_Message db 'NoRotaitions$'
	Israel_Message db 'Israel$'
	TinyBoard_Message db 'Tiny Board$'
	Tetris_Message db 'TETRIS$'
;=============================================================================================================================================	
; משתנים לניהול קבצים
	filenamee dw ?
	filehandle dw ?
	Message db 'Hello world!' ;12
	ErrorMsg db 'Error', 10, 13,'$'
	Buffer db 10 dup(0)
	TetrisTitle db 'tetris.bmp',0
	KeyBoardInfo db 'KeyBoard.bmp',0
	instructions db 'HTPlay.bmp',0
	ModesPage db 'Modes.bmp', 0
	Menu db 'Menu.bmp',0
	quitPage db 'quit.bmp', 0
	Loading1 db 'Loading1.bmp', 0
	Loading2 db 'Loading2.bmp', 0
	Loading3 db 'Loading3.bmp', 0
	Header db 54 dup (0) 
	Palette  db 256*4 dup (0) 
	ScrLine db 320 dup (0) 
;=============================================================================================================================================	
;mouse:
	check_pressed db 0 ; שווה אחד עם העכבר נלחץ ואפס אם לא
	mouse_x dw ? ;מיקום אנכי של העכבר
	mouse_y dw ? ;מיקום אופקי של העכבר
	
	Mask7  	dw 1111111011111111b ;background
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 0000000100000000b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b
            dw 1111111011111111b

            dw 0000000100000000b ;start cursor
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 1111111011111111b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
            dw 0000000100000000b
;=============================================================================================================================================
;משתנים לניהול התכנית

	Score dw 0 ; ניקוד של השחקן
	best dw 0 ; הניקוד הכי גבוה שהשחקן הגיע אליו
	xCube dw 180 ; ערך האיקס הגלובלי של הקוביה
	yCube dw 17 ; ערך הוואי הגלובלי של הקוביה
	cubeSize dw 30 ; גודל הקוביה
	k db ? ; the key that the user inserted
	miliSeconds db 0 ; מספר המילי שניות שעברו עד כה
	newMiliseconds db ? ; מספר המילי שניות שעברו עד כה לאחר הלולאה
	timer dw 100 ; מספר אלפיות השנייה שנשארו עד שתעבור שנייה מלאה
	SaveIt db ? ; dx מגבה את
	color_Of_Lines dw 0F7h;0;0F5h ; צבע הקו המחלק את הקוביות
	touchingCheck dw 0 ; משתנה שבודק אם הקוביה נגעה במשהו 

	Speed dw 100 ;המהירות של המשחק
	PosCounter dw 1 ;אחראי לספור באיזה מצב הקוביה
	position db 0 ; משתנה שמכיל את מצב הקוביה
	LinesCounter db 0 ; מספר השורות שהושמדו הסיבוב
	RotateTimer dw 2 ;זמן ההשהייה בין כל סיבוב של הקוביה
	
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
	
	mode db 0 ; מסמל את המוד שהמשחק נמצא בו
	Spiderman_check db 0 ;בודק אם השמתמש בחר במוד הספיידרמן
	OneByOne_check db 0 ;בודק אם המשתמש בחר את מוד הקוביה האחת
	Rainbow_check db 0 ;בודק אם המשתמש בחר את מוד הצבעוני
	NoRorations_check db 0 ;בודק אם השמתמש בחר במוד הספיידרמן
	Israel_check db 0 ;בודק אם השמתמש בחר במוד הספיידרמן
	counter_Rainbow dw 0 ; סופר את המספר של הצבע של הקוביה שכל הזמן משתנה במוד הצבעוני
