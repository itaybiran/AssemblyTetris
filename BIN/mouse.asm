		
;הפעלת העכבר
proc activeMouse
	push ax
	mov ax, 1
	INT 33h
	pop ax
	ret
endp activeMouse
	
;=============================================================================================================================================	
		
;אתחול העכבר
proc mouse
	push ax
	mov ax, 0
	INT 33h
	pop ax
	ret
endp mouse
	
;=============================================================================================================================================	
		
;קבלת סטטוס העכבר
proc mouseStatus
	push ax
	mov ax, 3h
	INT 33h
	SHR cx, 1
	mov [mouse_x], cx
	mov [mouse_y], dx
	pop ax
	ret
endp mouseStatus 

; bx = מצב הלחיצה של כפתורי העכבר- כפתור שמאלי לחוץ הביט במקום ה0 שווה 1. כפתור ימני לחוץ הביט במקום ה1 שווה 1
; cx = מיקום אופקי של הנקודה החמה
; dx = מיקום אנכי של הנקודה החמה
		
;=============================================================================================================================================

width_ equ [bp+10] ;רוחב הקוביה
hight_ equ [bp+8] ; גובה הקוביה
y equ [bp+6] ; וואי הקוביה
x equ [bp+4] ; איקס הקוביה

; מקבל מלבן ובודק אם העבר נלחץ בתוכו		
proc check_mouse_status
	push bp
	mov bp,sp
	PushAll

		mov [check_pressed],0
		call mouseStatus ; בודק את מצב סטטוס העכבר
		cmp bx,1 ; אם כפתור השמאלי של העבר נלחץ
		je next_1
		jmp RetTime_Mouse
		
	next_1:
	
		mov ax, y
		cmp [mouse_y],ax
		jg next_2
		jmp RetTime_Mouse
		
	next_2:
	
		mov ax, y
		add ax, hight_
		cmp [mouse_y],ax
		jl next_3
		jmp RetTime_Mouse
		
	next_3:
	
		mov ax,x
		cmp [mouse_x],ax
		jg next_4
		jmp RetTime_Mouse
		
	next_4:
	
		mov ax,x
		add ax,width_
		cmp [mouse_x],ax
		jl next_5
		jmp RetTime_Mouse
		
	next_5:
	
		mov [check_pressed],1
		
		RetTime_Mouse:
			pop bp
			PopAll
			ret 8
	
endp check_mouse_status
	
;=============================================================================================================================================	

; בודק אם נלחץ כפתור המוד הקלאסי
proc ClickHere_Button
	push 51 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 120 ; וואי הקוביה
	push 134 ; איקס הקוביה
	call check_mouse_status
	ret
endp ClickHere_Button

;=============================================================================================================================================

; בודק אם נלחץ כפתור התחלת המשחק
proc Start_Button
	push 71 ;רוחב הקוביה
	push 26 ; גובה הקוביה
	push 27 ; וואי הקוביה
	push 116 ; איקס הקוביה
	call check_mouse_status
	ret
endp Start_Button
	
;=============================================================================================================================================	
				
; בודק אם נלחץ כפתור ההוראות
proc Instruction_Button
	push 105 ;רוחב הקוביה
	push 16 ; גובה הקוביה
	push 70 ; וואי הקוביה
	push 100 ; איקס הקוביה
	call check_mouse_status
	ret
endp Instruction_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור הסבר המקלדת
proc KeyBoard_Button
	push 100 ;רוחב הקוביה
	push 33 ; גובה הקוביה
	push 105 ; וואי הקוביה
	push 103 ; איקס הקוביה
	call check_mouse_status
	ret
endp KeyBoard_Button
	
;=============================================================================================================================================	
			
;בודק אם נלחץ כפתור היציאה
proc Quit_Button
	push 71 ;רוחב הקוביה
	push 27 ; גובה הקוביה
	push 154 ; וואי הקוביה
	push 117 ; איקס הקוביה
	call check_mouse_status
	ret
endp Quit_Button
	
;=============================================================================================================================================

; בודק אם נלחץ כפתור המוד הקלאסי
proc Back_Button
	push 15 ;רוחב הקוביה
	push 17 ; גובה הקוביה
	push 178 ; וואי הקוביה
	push 3 ; איקס הקוביה
	call check_mouse_status
	ret
endp Back_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור המוד הקלאסי
proc Classic_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 25 ; וואי הקוביה
	push 26 ; איקס הקוביה
	call check_mouse_status
	ret
endp Classic_Mood_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור מהירות הצב
proc TurtleSpeed_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 25 ; וואי הקוביה
	push 126 ; איקס הקוביה
	call check_mouse_status
	ret
endp TurtleSpeed_Mood_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור הסופר קשה
proc SuperHard_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 25 ; וואי הקוביה
	push 226 ; איקס הקוביה
	call check_mouse_status
	ret
endp SuperHard_Mood_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור המוד הקלאסי
proc Spiderman_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 85 ; וואי הקוביה
	push 26 ; איקס הקוביה
	call check_mouse_status
	ret
endp Spiderman_Mood_Button
	
;=============================================================================================================================================	
			
; בודק אם נלחץ כפתור מהירות הצב
proc OneByOne_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 85 ; וואי הקוביה
	push 126 ; איקס הקוביה
	call check_mouse_status
	ret
endp OneByOne_Mood_Button
	
;=============================================================================================================================================	
		
; בודק אם נלחץ כפתור הסופר קשה
proc CrazyBoard_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 85 ; וואי הקוביה
	push 226 ; איקס הקוביה
	call check_mouse_status
	ret
endp CrazyBoard_Mood_Button
	
;=============================================================================================================================================	

; בודק אם נלחץ כפתור המוד ללא הסיבוב
proc NoRorations_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 145 ; וואי הקוביה
	push 26 ; איקס הקוביה
	call check_mouse_status
	ret
endp NoRorations_Mood_Button
	
;=============================================================================================================================================	
	
; בודק אם נלחץ כפתור המוד הישראלי
proc Israel_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 145 ; וואי הקוביה
	push 126 ; איקס הקוביה
	call check_mouse_status
	ret
endp Israel_Mood_Button

;=============================================================================================================================================

; בודק אם נלחץ כפתור המוד הלוח הקטן
proc TinyBoard_Mood_Button
	push 67 ;רוחב הקוביה
	push 29 ; גובה הקוביה
	push 145 ; וואי הקוביה
	push 226 ; איקס הקוביה
	call check_mouse_status
	ret
endp TinyBoard_Mood_Button

;=============================================================================================================================================

; כפתור של לאשר יציאה מהמשחק
proc yes_button
	push 55 ;רוחב הקוביה
	push 23 ; גובה הקוביה
	push 128 ; וואי הקוביה
	push 190 ; איקס הקוביה
	call check_mouse_status
	ret
endp yes_button

;=============================================================================================================================================

; כפתור של לבטל יציאה מהמשחק
proc Cancel_Button
	push 97 ;רוחב הקוביה
	push 23 ; גובה הקוביה
	push 128 ; וואי הקוביה
	push 72 ; איקס הקוביה
	call check_mouse_status
	ret
endp Cancel_Button

;=============================================================================================================================================
	
;בודק אם נלחץ כפתור חהזרה לתפריט הראשי
proc BackCheck
	BackcheckLoop:
	push 24
	push 23
	push 169
	push 7
	call check_mouse_status ;בודק אם נלחץ כפתור חהזרה לתפריט הראשי
	cmp [check_pressed], 1
	je GoBack ;אם כן חוזר לתפריט
	jmp BackcheckLoop
	GoBack:
ret
endp BackCheck

;=============================================================================================================================================

;בודק אם נלחץ כפתור חהזרה לתפריט הראשי
proc BackCheckHowToPlay
	BackcheckLoopHowToPlay:
	push 16
	push 18
	push 8
	push 8
	call check_mouse_status ;בודק אם נלחץ כפתור חהזרה לתפריט הראשי
	cmp [check_pressed], 1
	je GoBackHowToPlay ;אם כן חוזר לתפריט
	jmp BackcheckLoopHowToPlay
	GoBackHowToPlay:
ret
endp BackCheckHowToPlay