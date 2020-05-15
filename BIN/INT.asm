
;פרוצדורה שמתחילה את התכנית
proc begin
	mov ax, @data
	mov ds, ax
	ret
endp begin
	
;=============================================================================================================================================	
;procedure that exit.
proc escape
	push ax
	mov ax, 4c00h
	int 21h
	pop ax
	ret
endp escape
	
;=============================================================================================================================================	
		
;קליטת תו מהמשתמש
proc inputTav
	mov ah, 1h
	int 21h
	ret
endp inputTav ; al = ASCII of the tav
	
;=============================================================================================================================================	
		
;קליטת מספר מהמשתמש
proc inputNum
	mov ah, 1h
	int 21h
	sub al, '0'
	ret
endp inputNum ;al = number
	
;=============================================================================================================================================		
		
;קליטת מחרוזת תווים
proc inputString
	mov ah, 0Ah
	int 21h
	ret
endp inputString
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
proc clearkeyboardbuffer ;a proc that clears the buffer
	mov ah,0ch
	mov al,0
	int 21h
	ret
endp clearkeyboardbuffer
	
;=============================================================================================================================================	
		
;קריאת השעה
proc readTime
	mov ah, 2ch
	int 21h
	ret
endp readTime ;Return: CH = hour CL = minute DH = second DL = 1/100 seconds
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
;פרוצדורה שמשנה למצב גרפי
proc graphicMod
	push ax
	mov al, 13h
	mov ah, 0
	int 10h
	pop ax
	ret
endp graphicMod
	
;=============================================================================================================================================	
		
;פרוצדורה שמשנה למצב טקסט
proc textMod
	push ax
	mov al, 3h
	mov ah, 0
	int 10h
	pop ax
	ret
endp textMod
	
;=============================================================================================================================================		
		
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
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
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
	