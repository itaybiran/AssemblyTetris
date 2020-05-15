
;dl -מדפיס את התו שב
proc printTav
	mov ah, 2h
	int 21h
	ret
endp printTav

;=============================================================================================================================================================

;מדפיס את התו שבדי אל בצבע שבבי אל
proc printSmartTav
	mov al, dl
	mov bh, 1
	mov cx, 1
	mov ah, 09h
	int 10h
	ret
endp  printSmartTav

;=============================================================================================================================================================

;dx -מדפיס מחרוזת שנגמרת ב$ והאופסט שלה ב 
proc printString
	mov ah, 9h
	int 21h
	ret
endp printString

;=============================================================================================================================================================

;Set cursor position
proc setCursor ; dh = y somehow, dl = x somehow
	mov bh, 0
	mov ah, 2
	int 10h
	ret
endp setCursor

;=============================================================================================================================================================

;מדפיס את ניקוד השחקן
proc printScore

pushAll
		mov dh, 6 ;y
		mov dl, 27 ;x
		call setCursor ;Set cursor position
	mov dx, offset TopMessage
	call printString
	
		mov dh, 6 ;y
		mov dl, 33 ;x
		call setCursor ;Set cursor position

	mov ax, [Score]
	call setThousandsOfScore
	mov bl, 0F0h ;cyan
	call  printSmartTav;printTav
	
		mov dh, 6 ;y
		mov dl, 34 ;x
		call setCursor ;Set cursor position
	
	mov ax, [Score]
	call setHundredsOfScore
	mov bl, 0F0h ;cyan
	call  printSmartTav;printTav
	
	
		mov dh, 6 ;y
		mov dl, 35 ;x
		call setCursor ;Set cursor position
	
	mov ax, [Score]
	call setTensOfScore
	mov bl, 0F0h ;cyan
	call  printSmartTav;printTav
	
	
		mov dh, 6 ;y
		mov dl, 36 ;x
		call setCursor ;Set cursor position
	
	mov ax, [Score]
	call setOnenessOfScore
	mov bl, 0F0h ;cyan
	call printSmartTav;printTav
	
popAll
	ret
endp printScore

;=============================================================================================================================================================

;מדפיס את שיא השחקן
proc printBest
pushAll
		mov dh, 9 ;y
		mov dl, 27 ;x
		call setCursor ;Set cursor position
	mov dx, offset BestMessage
	call printString
	
		mov dh, 9 ;y
		mov dl, 32 ;x
		call setCursor ;Set cursor position

	mov ax, [Best]
	call setThousandsOfScore
	mov bl, 0FBh ;yellow
	call  printSmartTav;printTav
	
		mov dh, 9 ;y
		mov dl, 33 ;x
		call setCursor ;Set cursor position
	
	mov ax, [Best]
	call setHundredsOfScore
	mov bl, 0FBh ;yellow
	call  printSmartTav;printTav
	
	
		mov dh, 9 ;y
		mov dl, 34 ;x
		call setCursor ;Set cursor position
		
	mov ax, [Best]
	call setTensOfScore
	mov bl, 0FBh ;yellow
	call  printSmartTav;printTav
	
	
		mov dh, 9 ;y
		mov dl, 35 ;x
		call setCursor ;Set cursor position
	
	mov ax, [Best]
	call setOnenessOfScore
	mov bl, 0FBh ;yellow
	call printSmartTav;printTav
	
popAll
	ret
endp printBest

;=============================================================================================================================================================

; בודק אם המשתמש שבר את השיא שלו
proc updateBest
	mov ax, [Score]
	cmp ax, [best]
	jng NotupdateHighScore
	mov [best], ax

	NotupdateHighScore:
ret
endp updateBest
	
	
;=============================================================================================================================================================

;מגדיר את ספרת האחדות של הניקוד ושם אותו בדי אל
proc setOnenessOfScore ;it uses the value in ax

	mov bl, 10
	div bl 
	mov dl,ah 
	add dl, '0' 

ret
endp setOnenessOfScore

;=============================================================================================================================================================

;מגדיר את ספרת העשרות של הניקוד ושם אותו בדי אל
proc setTensOfScore ;it uses the value in ax
	mov bl, 10
	div bl
	
	xor ah, ah

	mov bl, 10
	div bl 
	mov dl, ah 
	add dl, '0' 

ret
endp setTensOfScore

;=============================================================================================================================================================

;מגדיר את ספרת המאות של הניקוד ושם אותו בדי אל
proc setHundredsOfScore ;it uses the value in ax

	mov bl, 100
	div bl
	xor ah, ah


	mov bl, 10
	div bl 
	mov dl,ah 
	add dl, '0' 

ret
endp setHundredsOfScore

;=============================================================================================================================================================

;מגדיר את ספרת האלפים של הניקוד ושם אותו בדי אל
proc setThousandsOfScore ;it uses the value in ax

	mov bl, 100
	div bl
	xor ah, ah
	
	mov bl, 10
	div bl
	xor ah, ah

	mov bl, 10
	div bl 
	mov dl,ah 
	add dl, '0' 

ret
endp setThousandsOfScore

;=============================================================================================================================================================

proc UpdateInternalClock
		pushAll
		xor dx,dx
		
		mov ah, 2Ch				;taking time from computer's clock
		int 21h 				;in dl we have now the mili seconds
	
		cmp dl,[DLHolder] 		;checking if time has passed
		jne UpdatingTime
		jmp EndUpdatingTime
		
		UpdatingTime:
			inc [InternalClock]	;InternalClock's units are 1/18 of a seconed
			mov [DLHolder],dl
		EndUpdatingTime:
		popAll
		ret
endp UpdateInternalClock
	
;=============================================================================================================================================================

proc ScoreBoardClock
		pushAll
		
		;finding how much minutes and seconds have passed
		mov ax,[InternalClock] 
		mov bx,18 		;start by finding how much seconds have passed
		xor dx,dx	
		div bx  		;dx:ax/bx =bigest posibble situation=> 0000 7fff / 12 ([2^15 -1]/18 = 1820)
		mov bl,60		;minutes
		div bl
		mov [seconds],ah
		mov [minutes],al
		
		xor ax,ax
		mov al,[seconds]
		mov bl,10
		div bl
		add al,'0'  ;10s of seconds
		add ah,'0'	;left single seconds
		mov [clock+4],ah ;place of single seconds ##:#{#}
		mov [clock+3],al ;place of 10s seconds    ##:{#}#
		
		xor ax,ax
		mov al,[minutes]
		mov bl,10
		div bl
		add al,'0'  ;10s of minutes
		add ah,'0'	;left single minutes
		mov [clock+1],ah ;place of single minutes #{#}:##
		mov [clock],al	 ;place of 10s minutes    {#}#:##
		
		mov dh, 12 ;y
		mov dl, 27 ;x
		call setCursor ;Set cursor position
		mov dx, offset TimeMessage
		call printString
		
		
		push 12
		push 32
		push 5d
		push 0ffh
		push offset Clock
		call printTheString
		
	popAll
		ret
endp ScoreBoardClock
		
;=============================================================================================================================================================
	
X equ [bp+12]
Y equ [bp+10]
leng equ [bp+8]
Color equ [bp+6]
offsetString equ [bp+4]
;פרוצדורה שמקבלת מחרוזת ומיקום עם ערכי איקס וואי, וגם צבע ומדפיסה את המחרוזת
proc printTheString

	push bp
	mov bp,sp
	pushAll
		
	mov ax, ds ;write string
	mov es, ax     
	mov ah,13h
	mov al,01h          ; attrib in bl, move cursor
	mov bl,Color        ; attribute - white
	mov cx,leng	; length of string
	mov dh,X		; row to put string
	mov dl,Y 		; column to put string
	mov bp,offsetString	; string offset
	int 10h             ; call BIOS service
		
	popAll
	pop bp
		
	ret 10
endp printTheString

;=============================================================================================================================================================
	
;מאפס את השעון
proc initializeClock
	mov [clock],'0'	 ;place of 10s minutes   {#}#:##
	mov [clock+1],'0' ;place of single minutes #{#}:##
	mov [clock+3],'0' ;place of 10s seconds    ##:{#}#
	mov [clock+4],'0' ;place of single seconds ##:#{#}
	
	mov [DLHolder], 0
	mov [InternalClock], 0
	mov [seconds], 0
	mov [minutes], 0
	ret
endp initializeClock

;=============================================================================================================================================================
	
proc printMode

		mov dh, 15 ;y
		mov dl, 27 ;x
		call setCursor ;Set cursor position

		call setTheModeForPringting ; mov dx the offset of the mode's name
		call printString
endp printMode

;=============================================================================================================================================================

proc setTheModeForPringting

	cmp [mode], 1
	je Classic1
	cmp [mode], 2 
	je TurtleSpeed2
	cmp [mode], 3
	je SuperHard3
	cmp [mode], 4
	je SpiderMan4
	cmp [mode], 5
	je OneByOne5
	cmp [mode], 6 
	je CrazyBoard6
	cmp [mode], 7
	je NoRotations7
	cmp [mode], 8
	je Israel8
	cmp [mode], 9
	je TinyBoard9
	jmp YouAllreadySettedTheMode
	
	Classic1:
		call classic_Print
	jmp YouAllreadySettedTheMode
	
	TurtleSpeed2:
		call TurtleSpeed_Print
	jmp YouAllreadySettedTheMode
	
	SuperHard3:
		call SuperHard_Print
	jmp YouAllreadySettedTheMode
	
	SpiderMan4:
		call SpiderMan_Print
	jmp YouAllreadySettedTheMode
	
	OneByOne5:
		call OneByOne_Print
	jmp YouAllreadySettedTheMode
	
	CrazyBoard6:
		call CrazyBoard_Print
	jmp YouAllreadySettedTheMode
	
	NoRotations7:
		call NoRotations_Print
	jmp YouAllreadySettedTheMode
	
	Israel8:
		call Israel_Print
	jmp YouAllreadySettedTheMode
	
	TinyBoard9:
		call TinyBoard_Print
		
	jmp YouAllreadySettedTheMode
	
	
	YouAllreadySettedTheMode:
	ret
endp setTheModeForPringting

;=============================================================================================================================================================

proc classic_Print
	mov dx, offset classic_Message
	ret
endp classic_Print

;=============================================================================================================================================================

proc TurtleSpeed_Print
	mov dx, offset TurtleSpeed_Message
	ret
endp TurtleSpeed_Print

;=============================================================================================================================================================

proc SuperHard_Print
	mov dx, offset SuperHard_Message
	ret
endp SuperHard_Print

;=============================================================================================================================================================

proc SpiderMan_Print
	mov dx, offset SpiderMan_Message
	ret
endp SpiderMan_Print

;=============================================================================================================================================================

proc OneByOne_Print
	mov dx, offset OneByOne_Message
	ret
endp OneByOne_Print

;=============================================================================================================================================================

proc CrazyBoard_Print
	mov dx, offset CrazyBoard_Message
	ret
endp CrazyBoard_Print

;=============================================================================================================================================================

proc NoRotations_Print
	mov dx, offset NoRotations_Message
	ret
endp NoRotations_Print

;=============================================================================================================================================================

proc Israel_Print
	mov dx, offset Israel_Message
	ret
endp Israel_Print

;=============================================================================================================================================================

proc TinyBoard_Print
	mov dx, offset TinyBoard_Message
	ret
endp TinyBoard_Print

;=============================================================================================================================================================

; פעולה שמדפיסה את המילה טטריס באפור במוד הלוח הקטן
proc printTetrisTinyBoard
		push dx
		
		mov dh, 22 ;y
		mov dl, 11 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'T'
		mov bl, 0F7h;0Fh ;red
		call  printSmartTav;printTav
		
		
		mov dh, 22 ;y
		mov dl, 12 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'E'
		mov bl, 0F7h;03Ah ;green
		call  printSmartTav;printTav
		
		
		mov dh, 22 ;y
		mov dl, 13 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'T'
		mov bl, 0F7h;027h ;orange
		call  printSmartTav;printTav
		
		
		mov dh, 22 ;y
		mov dl, 14 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'R'
		mov bl, 0F7h;0CCh ;purple
		call  printSmartTav;printTav
		
		
		mov dh, 22 ;y
		mov dl, 15 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'I'
		mov bl, 0F7h;0F1h ;cyan
		call  printSmartTav;printTav
		
		
		mov dh, 22 ;y
		mov dl, 16 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'S'
		mov bl, 0F7h;0FBh ;yellow
		call  printSmartTav;printTav
		
		pop dx
		ret
endp printTetrisTinyBoard

;=============================================================================================================================================================	
				
; פעולה שמדפיסה את המילה טטריס מעל כל הניקוד ושיאי השחקן
proc printTetris
		push dx
		
		mov dh, 3 ;y
		mov dl, 29 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'T'
		mov bl, 0Fh ;red
		call  printSmartTav;printTav
		
		
		mov dh, 3 ;y
		mov dl, 30 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'E'
		mov bl, 03Ah ;green
		call  printSmartTav;printTav
		
		
		mov dh, 3 ;y
		mov dl, 31 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'T'
		mov bl, 027h ;orange
		call  printSmartTav;printTav
		
		
		mov dh, 3 ;y
		mov dl, 32 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'R'
		mov bl, 0CCh ;purple
		call  printSmartTav;printTav
		
		
		mov dh, 3 ;y
		mov dl, 33 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'I'
		mov bl, 0F1h ;cyan
		call  printSmartTav;printTav
		
		
		mov dh, 3 ;y
		mov dl, 34 ;x
		call setCursor ;Set cursor position
	
		mov dl, 'S'
		mov bl, 0FBh ;yellow
		call  printSmartTav;printTav
		
		pop dx
		ret
endp printTetris
