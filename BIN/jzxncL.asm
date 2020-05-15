DATASEG

xs1 dw 140              ;The spaceship's x variable
colors1 dw 0FEh         ;The spaceship's color variable
m db ?                  ;Variable for comparison in receiving a key
previoust db ?  		;Variable of the previous time we checked the clock
ybullet dw 165			;y value of the bullet
play_pressed dw 0		;Vriable that contains 1 if the 'play' button was pressed
was_pressed dw 0 		;Checks if a button eas pressed - MouseAndButton

;משתנים של הצבעים של החייזרים
color1_1 dw 03Ah ;First row of aliens
color1_2 dw 0F2h 
color1_3 dw 0D2h
color1_4 dw 0D5h
color1_5 dw 0E7h
color1_6 dw 047h
color1_7 dw 037h

color2_1 dw 038h ;Second row of aliens
color2_2 dw 0F1h 
color2_3 dw 0D1h
color2_4 dw 0D4h
color2_5 dw 0D7h
color2_6 dw 046h
color2_7 dw 027h

color3_1 dw 030h ;Third row of aliens
color3_2 dw 0F0h 
color3_3 dw 0D0h
color3_4 dw 0D3h
color3_5 dw 0C7h
color3_6 dw 045h
color3_7 dw 017h

;משתנים של קבצים
OpeningScreen db 'open.bmp',0
GameBackground db 'Game.bmp',0
menu db 'menu.bmp',0
filenamee dw ?
filehandle dw ?
ErrorMsg db 'Error', 10, 13, '$'
Buffer db 10 dup(0)
Header db 54 dup (0) 
Palette  db 256*4 dup (0) 
ScrLine db 320 dup (0) 

CODESEG

;==============================================================================================================================
;מעבר למצב גרפי
proc GraphMode
	push ax
	mov al, 13h
	mov ah, 0
	int 10h
	pop ax
	ret
endp GraphMode

;==============================================================================================================================
;Reads the time
proc readtime
	 mov ah, 2Ch 
	 int  21h 
	 ret
endp readtime
;==============================================================================================================================

;חזרה למצב טקסט
proc TextMode
	push ax
	mov al, 3h
	mov ah, 0
	int 10h
	pop ax
	ret
endp TextMode

;==============================================================================================================================

;מחכה שנייה
proc second
	push bp
	push ax
	push dx
	push cx
	
	mov cx, 10
	mov dx, 0
	mov ah, 86h
	int 15h
	 
	pop cx
	pop dx
	pop ax
	pop bp
	ret
endp second

;==============================================================================================================================

;Clears the buffer
proc buffercleaner
	mov ah,0ch
	mov al,0
	int 21h
	ret
endp buffercleaner

;===============================================================================================================================

;Receives key
macro Receivekey
	mov al, 0
	mov ah,01h
	int 16h 
endm Receivekey

;===============================================================================================================================

;פרוצדורה שמציירת פיקסל
x equ [word ptr bp + 8]
y equ [word ptr bp + 6]
color equ [byte ptr bp + 4]

proc drawPixel
	push bp
	mov bp, sp
	push ax
	push dx 
	push cx

	mov ah, 0Ch
	mov al, color
	mov cx, x ; 0 <= x <= 319
	mov dx, y ; 0 <= y <= 199
	int 10h

	pop cx
	pop dx
	pop ax
	pop bp
	ret 6
endp drawPixel


;==============================================================================================================================

;Draws horizontal line
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineY
	push bp
	mov bp, sp
	push ax

	liney1:
	push x
	push y
	push color
	call drawPixel

	mov ax, compto
	cmp x, ax
	je endliney
	dec x
	jmp liney1
	
	endliney:
	pop ax
	pop bp
	ret 8
endp LineY

;==============================================================================================================================

; Draws vertical line
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
color equ [word ptr bp + 6]
compto equ [word ptr bp + 4]

proc LineX
	push bp
	mov bp, sp
	push ax

	linex1:
	push x
	push y
	push color
	call drawPixel

	mov ax, compto
	cmp y, ax
	je endlinex
	dec y
	jmp linex1
	
	endlinex:
	pop ax
	pop bp
	ret 8
endp LineX

;==============================================================================================================================

; The board's outline 
proc outline
 
	push 297	;x
	push 4		;y
	push 0FFh	;color
	push 20		;number to be compared to
	call LineY

	push 297	;x
	push 195	;y
	push 0FFh	;color
	push 20		;number to be compared to
	call LineY

	push 20		;x
	push 195	;y
	push 0FFh	;color
	push 4		;number to be compared to
	call LineX

	push 297	;x
	push 195	;y
	push 0FFh	;color
	push 4		;number to be compared to
	call LineX

	ret
endp outline

;==============================================================================================================================

;Redraws the higher Y line
proc RedrawLineY
	push 297
	push 28
	push 0FFh
	push 20
	call LineY
	ret
endp RedrawLineY
;==============================================================================================================================

;Draws a Rectangle
x equ [word ptr bp + 12]
y equ [ word ptr bp + 10]
leng equ [ word ptr bp + 8]
wid equ [word ptr bp + 6]
color equ [byte ptr bp + 4]

proc drawRect
	push bp
	mov bp, sp
	
	mov dx, leng
	add dx, y
	row:	
			mov cx, wid
			add cx, x
		column:
			mov ah, 0Ch
			mov al, color
			mov cx, cx
			mov dx, dx
			int 10h
			dec cx
			cmp cx, x
		jne column
		
			dec dx
			cmp dx, y
	jne row
	
	pop bp
	ret 10
endp drawRect

;==============================================================================================================================

; Creates a spaceship figure

proc spaceship

	
	push [xs1]
	push 180	;y
	push 8		;length
	push 26		;width
	push [colors1]
	call drawRect
	
	add [xs1], 2
	
	push [xs1]
	push 178	;y
	push 2		;length
	push 22		;width
	push [colors1]
	call drawRect
	
	add [xs1], 8
	
	push [xs1]
	push 175	;y
	push 3		;length
	push 6		;width
	push [colors1]
	call drawRect
	
	add [xs1], 2
	
	push [xs1]
	push 173	;y
	push 2		;length
	push 2		;width
	push [colors1]
	call drawRect
	
	sub [xs1], 12
		

	ret 
endp spaceship

;==============================================================================================================================

;draws new bullets
proc newbullet
	push ax
	
	mov ax, [xs1]
	add ax, 12
	push ax
		
	push [ybullet]
	push 6
	push 2
	push 0FFh
	call drawRect
	
	pop ax
	ret 
endp newbullet

;==============================================================================================================================

;deletes bullets from screen
proc deletebullet
	push ax
	
	mov ax, [xs1]
	add ax, 12
	push ax
		
	push [ybullet]
	push 6
	push 2
	push 000h
	call drawRect
	
	pop ax
	ret 
endp deletebullet

;==============================================================================================================================

;shoots bullet from the spaceship
proc shoot

	mov [ybullet], 165
	shoot1:
	call newbullet
	
	call readtime
	mov [previoust], dl
		
	timer:
		call readtime
			
		cmp dl, [previoust]
		je timer
			
		mov [previoust], dl
		call deletebullet
		call hitalien
		cmp dx, 1
		je exit3
		sub [ybullet], 6
		jmp shoot1
	
	exit3:
	ret			
endp shoot

;==============================================================================================================================

;Checks to see if a bullet hit an alien1 or outline
proc hitalien
	push ax
	xor dx, dx   ;Resets the variable dx (1 is if the bullet touched an alien and 0 is if it didn't)
	
	mov ax, [xs1]
	add ax, 12
	push ax
	inc [ybullet]
	push [ybullet]
	call CurrentColor ;checks color above the bullet
	dec [ybullet]
		
	cmp al, 0FFh	;checks if it hit the outline
	jne next
	mov dx, 1
	call RedrawLineY
	jmp exit2
		
	next:
	cmp al, 03Ah
	jne next1
	mov [color1_1], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next1:
	cmp al, 0F2h
	jne next2
	mov [color1_2], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next2:
	cmp al, 0D2h
	jne next3
	mov [color1_3], 000h
	call aliens
	mov dx, 1
	jmp exit2

	next3:
	cmp al, 0D5h
	jne next4
	mov [color1_4], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next4:
	cmp al, 0E7h
	jne next5
	mov [color1_5], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next5:
	cmp al, 047h
	jne next6
	mov [color1_6], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next6:
	cmp al, 037h
	jne next7
	mov [color1_7], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	
	next7:
	cmp al, 038h
	jne next8
	mov [color2_1], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next8:
	cmp al, 0F1h
	jne next9
	mov [color2_2], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next9:
	cmp al, 0D1h
	jne next10
	mov [color2_3], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next10:
	cmp al, 0D4h
	jne next11
	mov [color2_4], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next11:
	cmp al, 0D7h
	jne next12
	mov [color2_5], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next12:
	cmp al, 046h
	jne next13
	mov [color2_6], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next13:
	cmp al, 027h
	jne next14
	mov [color2_7], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	
	next14:
	cmp al, 030h
	jne next15
	mov [color3_1], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next15:
	cmp al, 0F0h
	jne next16
	mov [color3_2], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next16:
	cmp al, 0D0h
	jne next17
	mov [color3_3], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next17:
	cmp al, 0D3h
	jne next18
	mov [color3_4], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next18:
	cmp al, 0C7h
	jne next19
	mov [color3_5], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next19:
	cmp al, 045h
	jne next20
	mov [color3_6], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	next20:
	cmp al, 017h
	jne exit2
	mov [color3_7], 000h
	call aliens
	mov dx, 1
	jmp exit2
	
	
	exit2:
	pop ax
	ret
endp hitalien
	
;==============================================================================================================================

;moves the spaceship to the left
proc moveleft
	push [xs1]
	push 185
	call CurrentColor	;checks the color of the pixel to the left of the ship
	cmp al, 0FFh		;compares the color of the pixel to the color of the outline 
	je ret1_
	mov [colors1], 000h	;draws a black spaceship on top of the spaceship
	call spaceship
	mov [colors1], 0FEh
	sub [xs1], 10
	call spaceship		;redraws the spaceship 10 pixels to the left
	ret1_:
	ret
endp moveleft

;==============================================================================================================================

;moves the spaceship to the right
proc moveright
	add [xs1], 27
	push [xs1]
	push 182
	call CurrentColor	;checks the color of the pixel to the right of the ship
	sub [xs1], 27
	cmp al, 0FFh		;compares the color of the pixel to the color of the outline 
	je ret_
	mov [colors1], 000h	
	call spaceship		;draws a black spaceship on top of the spaceship
	mov [colors1], 0FEh
	add [xs1], 10
	call spaceship		;redraws the spaceship 10 pixels to the right
	ret_:
	ret
endp moveright

;==============================================================================================================================

;Movement of the spaceship
proc MoveSS
	
	call spaceship
	
	keys:
		Receivekey
		
		cmp al, 'a'
		je extract
		cmp al, 'd'
		je extract
		cmp al, 20h
		je extract
		
		
		
	extract:
		mov ah,00h
		int 16h
		
		mov [m],al

		cmp [m], 'a'
		je left
		cmp [m], 'd'
		je right
		cmp [m], 20h
		je shoot2
		
		jmp stop
		

	left:
		call moveleft
		ret
		
	right:
		call moveright
		ret
		
	shoot2:
		call shoot
		ret
	
	stop:
		ret
endp MoveSS
	
;==============================================================================================================================

;Receives current color of pixel
x equ [word ptr bp + 6]
y equ [word ptr bp + 4]

proc CurrentColor
	push bp
	mov bp, sp
	push dx
	push cx
	
	mov ah, 0Dh
	mov cx, x ;0 ≤ X ≤ 319
	mov dx, y ;0 ≤ Y ≤ 199
	int 10h
	
	pop cx
	pop dx
	pop bp
	ret 4
endp CurrentColor

;==============================================================================================================================

;Alien Number 1
x equ [word ptr bp + 12]
y equ [ word ptr bp + 10]
leng equ [ word ptr bp + 8]
wid equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc alien1
	push bp
	mov bp, sp
	
	drawsbody1:	
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add y, 6
	sub leng, 4
	sub wid, 17
	
	drawsleftleg:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 17
	
	drawsrightleg:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	sub x, 12
	sub y, 4
	sub wid, 1
	mov color, 0
	
	drawslefteye:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 8
	
	drawsrighteye:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	pop bp
	ret 10
endp alien1

;==============================================================================================================================

;Alien Number 2
x equ [word ptr bp + 12]
y equ [ word ptr bp + 10]
leng equ [ word ptr bp + 8]
wid equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc alien2
	push bp
	mov bp, sp
	
	drawsbody2:	
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	sub x, 3
	add y, 9
	sub leng, 6
	sub wid, 6
	
	drawsleftleg2:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 12
	
	drawsrightleg2:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	sub x, 8
	sub y, 5
	sub wid, 1
	sub leng, 1
	mov color, 0
	
	drawslefteye2:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 5
	
	drawsrighteye2:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	pop bp
	ret 10
endp alien2

;==============================================================================================================================

;Alien Number 3
x equ [word ptr bp + 12]
y equ [ word ptr bp + 10]
leng equ [ word ptr bp + 8]
wid equ [word ptr bp + 6]
color equ [word ptr bp + 4]

proc alien3
	push bp
	mov bp, sp
	
	drawsbody3:	
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	inc x
	add y, 6
	sub leng, 4
	sub wid, 2
	
	drawsleg3:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 3
	sub y, 8
	sub wid, 12
	
	drawsleftear3:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 6
	
	drawsrightear3:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	sub x,6
	add y, 3
	mov color, 0
	
	drawslefteye3:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
		
	add x, 6
	
	drawsrighteye3:
		push x
		push y
		push leng
		push wid
		push color
		call drawRect
	
	pop bp
	ret 10
endp alien3

;==============================================================================================================================
;Draws aliens
proc aliens 

	type1:
		num1:
			push 55		;x
			push 70		;y	
			push 6		;length
			push 20		;width
			push [color1_1]	;color
			call alien1
			
		num2:
			push 85		;x
			push 70		;y
			push 6		;length
			push 20		;width
			push [color1_2]	;color
			call alien1
			
		num3:
			push 115	;x
			push 70		;y
			push 6		;length
			push 20		;width
			push [color1_3]	;color
			call alien1
			
		num4:
			push 145		
			push 70
			push 6
			push 20
			push [color1_4]
			call alien1

		num5:
			push 175
			push 70
			push 6
			push 20
			push [color1_5]
			call alien1
			
		num6:
			push 205
			push 70
			push 6
			push 20
			push [color1_6]
			call alien1
			
		num7:
			push 235
			push 70
			push 6
			push 20
			push [color1_7]
			call alien1
			
	type2:
		numb1:
			push 61
			push 50
			push 9
			push 9
			push [color2_1]
			call alien2
			
		numb2:
			push 91
			push 50
			push 9
			push 9
			push [color2_2]
			call alien2
			
		numb3:
			push 121
			push 50
			push 9
			push 9
			push [color2_3]
			call alien2
			
		numb4:
			push 151
			push 50
			push 9
			push 9
			push [color2_4]
			call alien2

		numb5:
			push 181
			push 50
			push 9
			push 9
			push [color2_5]
			call alien2
			
		numb6:
			push 211
			push 50
			push 9
			push 9
			push [color2_6]
			call alien2
			
		numb7:
			push 241
			push 50
			push 9
			push 9
			push [color2_7]
			call alien2
			
	type3:
		number1:
			push 57
			push 35
			push 6
			push 16
			push [color3_1]
			call alien3
			
		number2:
			push 87
			push 35
			push 6
			push 16
			push [color3_2]
			call alien3
			
		number3:
			push 117
			push 35
			push 6
			push 16
			push [color3_3]
			call alien3
			
		number4:
			push 147
			push 35
			push 6
			push 16
			push [color3_4]
			call alien3

		number5:
			push 177
			push 35
			push 6
			push 16
			push [color3_5]
			call alien3
			
		number6:
			push 207
			push 35
			push 6
			push 16
			push [color3_6]
			call alien3
			
		number7:
			push 237
			push 35
			push 6
			push 16
			push [color3_7]
			call alien3
		
	ret 
endp aliens

;=============================================================================================================================================	

;אתחול עכבר
proc restartMouse
	push ax
	
	mov ax, 0
	int 33h
	
	pop ax
	ret
endp restartMouse

;=============================================================================================================================================

;שינוי סטטוס סמן לפעיל
proc startMouse
	push ax
	
	mov ax, 1
	int 33h
	
	pop ax
	ret
endp startMouse

;=============================================================================================================================================

;Mouse's status
proc mouseStatus
	
	xor bx, bx
	mov ax, 3h	; מייצג את מצב הלחיצה bx 
	int 33h		; מיקום אופקי cx
				; מיקום אנכי dx
				
	SHR cx, 1 	;adjust cx to range 0-319, to fit screen

	ret
endp mouseStatus ; if bx equals 1 the left button was pressed

;=============================================================================================================================================

;Checks if the mouse is on the 'click here' button
x equ [word ptr bp + 10]
y equ [word ptr bp + 8]
leng equ [word ptr bp + 6]
wid equ [word ptr bp + 4]

proc MouseAndButton
	push bp
	mov bp, sp
	push ax
	mov [was_pressed], 0
	
	call mouseStatus
	cmp bx, 1	;checks to see if the left button of the mouse was pressed on
	je check1
	jmp exit4 
	
	check1:		;checks if you clicked on the 'cllick here' button (x)
	cmp cx, x
	JGE check2
	jmp exit4
	
	check2:		;checks if you clicked on the 'cllick here' button (x)
	mov ax, x
	add ax, wid
	cmp cx, ax
	JLE check3
	jmp exit4
	
	check3:		;checks if you clicked on the 'cllick here' button (y)
	cmp dx, y
	JGE check4
	jmp exit4
	
	check4:		;checks if you clicked on the 'cllick here' button (y)
	xor ax, ax
	mov ax, y
	add ax, leng
	cmp dx, ax
	JLE correct
	jmp exit4
	
	correct:
	mov [was_pressed], 1

	exit4:
	pop ax
	pop bp
	ret 8
endp MouseAndButton

;=============================================================================================================================================

;A loop that check if the 'click here' button was pressed
proc clickHereButton
	
	call restartMouse
	call startMouse
	
	looper:
		push 105	;x
		push 162	;y
		push 28		;leng
		push 102	;wid
		call MouseAndButton
		cmp [was_pressed], 1
	jne looper
		call restartMouse
		call DrawBlackScreen
		jmp exit5
	
	exit5:
	ret
endp clickHereButton
	
;=============================================================================================================================================

;A loop that check if the 'play' button was pressed
proc playButton
	
	call restartMouse
	call startMouse
	
	looper2:
		push 112	;x
		push 95		;y
		push 27		;leng
		push 95		;wid
		call MouseAndButton
		cmp [was_pressed], 1
	jne looper2
		call restartMouse
		;call DrawBlackScreen
		jmp exit6
	
	exit6:
	ret
endp playButton
	
;=============================================================================================================================================

;Receives a photo and prints it
proc Splash
	call OpenFile 	; Process BMP file 
	call ReadHeader 
	call ReadPalette 
	call CopyPal 
	call CopyBitmap
	call CloseFile
ret 
endp Splash
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
proc ReadHeader  
; Read BMP file header, 54 bytes 
 mov ah,3fh 
 mov bx, [filehandle] 
 mov  cx,54 
 mov  dx,offset Header 
 int  21h                      
 ret 
endp ReadHeader  

;=============================================================================================================================================	
		
proc ReadPalette 
; Read BMP file color palette, 256 colors * 4 bytes (400h) 
 mov ah,3fh 
 mov  cx,400h                           
 mov  dx,offset Palette 
 int  21h                      
 ret 
endp ReadPalette 
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
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
	
;=============================================================================================================================================	
		
proc CloseFile
	;closes file
	MOV AH,3Eh 
	MOV BX, [filehandle] 
	INT  21h 
	ret
endp CloseFile
	
;=============================================================================================================================================

;Draws the opening screen
proc DrawOpeningScreen
	lea bx, [OpeningScreen]
	mov [filenamee],bx
	call Splash
	ret
endp DrawOpeningScreen
	
;=============================================================================================================================================

;Draws the background of the game
proc DrawGameBackground
	lea bx, [GameBackground]
	mov [filenamee],bx
	call Splash
	ret
endp DrawGameBackground
	
;=============================================================================================================================================

;Draws the menu
proc DrawMenu
	lea bx, [menu]
	mov [filenamee],bx
	call Splash
	ret
endp DrawMenu

;=============================================================================================================================================

proc DrawBlackScreen
	push 0		;x
	push 0		;y
	push 200	;length
	push 320	;width
	push 000h	;color
	call drawRect
	ret
endp DrawBlackScreen
;=============================================================================================================================================


;=============================================================================================================================================