proc Graphics
	push ax
	mov al,13h
	mov ah,0
	int 10h
	pop ax
	ret
endp Graphics

proc Splash
 ;פרוצדורה מקבלת תמונה
 ;פרוצדורה מדפיסה תמונה
	call OpenFile 	; Process BMP file 
	call ReadHeader 
	call ReadPalette 
	call CopyPal 
	call CopyBitmap
	call CloseFile
ret 
endp Splash

proc GamePvp
call Delay  
call printPoints
call printPoints1
call printPoints2
add [clock],1
call addPoints
call boxesMove
call randomBoxs
ret
endp GamePvp



proc GameSur
call Delay  
call printPoints
add [clock],1
call addPointsSur
call boxesMoveSur
ret
endp Gamesur


proc PrintLOW
cmp [winSur],1
jne loseSur
	mov dx, offset youWin
	jmp printLW
loseSur:
	mov dx, offset youLose
	printLW:
	mov ah,9
	int 21h
ret
endp PrintLOW

proc instructionsPvp
lea bx, [filename3]
mov [filenamee],bx
call Splash     ;instructions
mov ah,8
int 21h       
ret
endp instructionsPvp


proc instructionsSur
lea bx, [filename4]
mov [filenamee],bx
call Splash     ;instructions
mov ah,8
int 21h       
ret
endp instructionsSur

proc update
mov [x1],30
mov [y1],50
mov [x2],290
mov [y2],170
mov [key1],'d'
mov [key2],'j'
mov [Points],0
mov [MinSecend],100
ret
endp update


proc endGameMode
cmp [key1],escape              ;if escape key is pressed,the program will shut off
je dontGivePoints
xor ah,ah
mov al,[lose1]
add [pointsP2],ax
mov al,[lose2]
add [pointsP1],ax
dontGivePoints:
mov [lose1],0
mov [lose2],0
call OpenSpeaker 
push 0cch
call PlayMusic
mov [delayMinSecend],300
call Delay  
call CloseSpeaker
lea bx, [filename2]
mov [filenamee],bx
call Splash
call printPoints1
call printPoints2
ret
endp endGameMode


proc endGameModeSur
mov [lose1],0
call OpenSpeaker 
push 0cch
call PlayMusic
mov [delayMinSecend],300
call Delay  
call CloseSpeaker
lea bx, [filename2]
mov [filenamee],bx
call Splash
call PrintLOW
mov [winSur],0
ret
endp endGameModeSur

proc boxesMove
mov [color1],50            
call box1
mov [color2],200 
call box2
call getKey                  ;checking which key was pressed
call keletMove
call keletMove2
call checkBox1
call checkBox2
mov [color1],8
call box1
mov [color2],8
call box2
ret
endp boxesMove

proc boxesMoveSur
mov [color1],50            
call box1
call getKey                  ;checking which key was pressed
call keletMove

call checkBox1
mov [color1],8
call box1
ret
endp boxesMoveSur
;----------------------
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
;--------------------
proc ReadHeader  
; Read BMP file header, 54 bytes 
 mov ah,3fh 
 mov bx, [filehandle] 
 mov  cx,54 
 mov  dx,offset Header 
 int  21h                      
 ret 
endp ReadHeader  
;--------------------
proc ReadPalette 
; Read BMP file color palette, 256 colors * 4 bytes (400h) 
 mov ah,3fh 
 mov  cx,400h                           
 mov  dx,offset Palette 
 int  21h                      
 ret 
endp ReadPalette 
;-------------------
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
 mov al,[si+2]             ; Get red value. 
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
;-------------------
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
;-----------------
proc CloseFile
	;פרוצדורה סוגרת קובץ
	MOV AH,3Eh 
	MOV BX, [filehandle] 
	INT  21h 
	ret
endp CloseFile
;-------------------
proc clock0
	push ax bx cx dx
	mov AH,2Ch
	int 21h
	mov [clock1],dx
	mov [clock2],dl
	pop dx cx bx ax
ret
endp clock0
;---------------------
proc GetRandomNumber
	push bp
	mov bp,sp
	push ax
	call clock0
	; generate random number
	mov ax, [clock1] ; read timer counter
	mov ah, [byte cs:bx] ; read one byte from memory
	xor al, ah ; xor memory and counter
	and al, 00000011b ; leave result between 0-15
	mov [randomNumber],al
	pop ax
	pop bp
ret
endp GetRandomNumber
;--------------------
proc OpenSpeaker 
; פרוצדורה פותחת רמקול
	push bp
	mov bp,sp
	push ax 
	;--------------- 
	in al, 61h
	or al, 00000011b
	out 61h, al
	;--------------- 
	pop ax
	pop bp
	ret
endp OpenSpeaker
;---------------------------
proc PlayMusic
;פרוצדורה מקבלת תדר
;פרוצדורה מנגנת את התדר
	push bp
	mov bp,sp
	push ax
	mov al, 0B6h
	out 43h, al
	mov ax, [bp+4]
	out 42h, al ; Sending lower byte
	mov al, ah
	out 42h, al ; Sending upper byte
	cmp bx,1
	pop ax
	pop bp
ret 2
endp PlayMusic
;--------------------
proc CloseSpeaker 
;פרוצדורה סוגרת רמקול
	push bp
	mov bp,sp
	push ax
	;--------------------
	 in  al, 61h    
	 and al, 11111100b  
	 out  61h, al 
	;---------------------
	pop ax
	pop bp
	ret
endp CloseSpeaker
;----------------------
proc Delay 
;פרוצדורה עושה דילאיי
		push AX
		push CX
		push DX
		push [delayMinSecend]
	loopDelay:
		mov ax,8600h
		mov cx,00
		mov dX,01	
		int 15h
		dec [delayMinSecend]
		cmp [delayMinSecend],0
		jne loopDelay
		pop [delayMinSecend]
		pop DX
		pop CX
		pop AX
	ret 
endp Delay
;------------------
proc checkDot1
push ax bx cx dx
		mov ah,0Dh
		mov cx,[x1]
		mov dx,[y1]
		int 10h
		
		cmp [box90],1
		je endCheking1
		cmp [box120],1
		je endCheking1
	
		cmp al,90
		jne endBox90num1
		mov [Box90],1
		jmp endCheking1
	endBox90num1:
	
		cmp al,120
		jne endBox120num1
		mov [Box120],1
	
		jmp endCheking1
	endBox120num1:
	
	
		cmp al,0
		je endCheking1
		mov [lose1],1
	endCheking1:
pop dx cx bx ax
ret
endp checkDot1
;----------------
proc checkLine1
	push cx 
	mov cx,3
		printLine0:
			call checkDot1
			inc [x1]
			loop printLine0            ;printing line
			sub[x1],3                 ;setting the x courage back
	pop cx
ret
endp checkline1
;-----------------
proc checkBox1
	push cx
	mov cx,3
		matrix0:
			call checkLine1
			inc [y1]                ;printing boxangle  3*3
			loop matrix0
			sub[y1],3              ;setting the y courage back
	pop cx
ret
endp checkBox1
;-----------------
proc Dot1
push ax bx cx dx
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]                   ;ptinting dot
	mov al,[color1]
	mov ah,0ch
	int 10h
pop dx cx bx ax
	ret
endp Dot1
;---------------
proc line1
	push cx 
	mov cx,3
		printLine1:
			call Dot1
			inc [x1]
			loop printLine1            ;printing line
			sub[x1],3                 ;setting the x courage back
	pop cx
	ret
endp line1
;------------------
proc box1
	push cx
	mov cx,3
		matrix1:
			call line1
			inc [y1]                ;printing boxangle  3*3
			loop matrix1
			sub[y1],3              ;setting the y courage back
	pop cx
	ret
endp box1
;------------------
proc checkDot2
push ax bx cx dx
	mov ah,0Dh
	mov cx,[x2]
	mov dx,[y2]
	int 10h
	
		cmp [box90],1
		je endCheking2
		cmp [box120],1
		je endCheking2
	
		cmp al,90
		jne endBox90num2
		mov [Box90],1
		jmp endCheking2
	endBox90num2:
	
		cmp al,120
		jne endBox120num2
		mov [Box120],1
		jmp endCheking2
	endBox120num2:
	
		cmp al,0
		je endCheking2
		mov [lose2],1
	endCheking2:
pop dx cx bx ax
ret
endp checkDot2
;----------------
proc checkLine2
	push cx 
	mov cx,3
		printLine2:
			call checkDot2
			inc [x2]
			loop printLine2            ;printing line
			sub[x2],3                 ;setting the x courage back
	pop cx
ret
endp checkline2
;-----------------
proc checkBox2
	push cx
	mov cx,3
		matrix2:
			call checkLine2
			inc [y2]                ;printing boxangle  3*3
			loop matrix2
			sub[y2],3              ;setting the y courage back
	pop cx
ret
endp checkBox2
;----------------
proc Dot2
push ax bx cx dx
	mov bh,0h
	mov cx,[x2]
	mov dx,[y2]                   ;ptinting dot
	mov al,[color2]
	mov ah,0ch
	int 10h
pop dx cx bx ax
	ret
endp Dot2
;--------------
proc line2
	push cx 
	mov cx,3
		printLine3:
			call Dot2
			inc [x2]
			loop printLine3            ;printing line
			sub[x2],3                 ;setting the x courage back
	pop cx
ret
endp line2
;-------------
proc box2
	push cx
	mov cx,3
		matrix3:
			call line2
			inc [y2]                ;printing boxangle  3*3
			loop matrix3
			sub[y2],3              ;setting the y courage back
	pop cx
ret
endp box2
;-------------
proc CheckKeyS
		cmp [key1],'w' ;check negetive key
		je sKey
		cmp al,'s'
		jne sKey
		mov [key1],al
	sKey:
ret
endp CheckKeyS
;---------------
proc CheckKeyW
		cmp [key1],'s' ;check negetive key
		je wKey
		cmp al,'w'
		jne wKey
		mov [key1],al
	wKey:
ret
endp CheckKeyW
;----------------
proc CheckKeyD
		cmp [key1],'a' ;check negetive key
		je dKey
		cmp al,'d'
		jne dKey
		mov [key1],al
	dKey:
ret
endp CheckKeyD
;---------------
proc CheckKeyA
		cmp [key1],'d' ;check negetive key
		je aKey
		cmp al,'a'
		jne aKey
		mov [key1],al
	aKey:
ret
endp CheckKeyA
;-----------------
proc CheckKeyUp
		cmp [key2],'k' ;check negetive key
		je upKey
		cmp al,'i'
		jne upKey
		mov [key2],al
	upKey:
ret
endp CheckKeyUp
;--------------------
proc CheckKeyDown
		cmp [key2],'i';check negetive key
		je downKey
		cmp al,'k'
		jne downKey
		mov [key2],al
	downKey:
ret
endp CheckKeyDown
;--------------------
proc CheckKeyRight
		cmp [key2],'l' ;check negetive key
		je rightKey
		cmp al,'j'
		jne rightKey
		mov [key2],al
	rightKey:
ret
endp CheckKeyRight
;-------------------
proc CheckKeyLeft
		cmp [key2],'j' ;check negetive key
		je leftKey
		cmp al,'l'
		jne leftKey
		mov [key2],al
	leftKey:
ret
endp CheckKeyLeft
;------------------
proc cleanBuffer
	push ax
	mov ah,0ch
	mov al,0
	int 21h
	pop ax 
	ret
endp cleanBuffer
;-----------------
proc getKey  ; הפעולה קולטת קלט בתנאי שנלחץ מקש חוקי ולא נגדי לכיוון
		push ax
		mov ah,1h
		int 16h
		jz endKelet1
		call CheckKeyS
		call CheckKeyA
		call CheckKeyD
		call CheckKeyW
		call CheckKeyDown
		call CheckKeyUp
		call CheckKeyLeft
		call CheckKeyRight
		
		cmp al,escape              ;if escape key is pressed,the program will shut off
		jne endKelet1
		mov [key1],al
	endKelet1:
		call cleanBuffer
	pop ax
ret
endp getKey
;-------------------
proc keletMove
		cmp [key1],'w'
		jne endUp1
		sub [y1],3 
	endUp1:

		cmp [key1],'s'
		jne endDown1
		add [y1],3 
	endDown1:

		cmp [key1],'a'
		jne endLeft1
		sub [x1],3 
	endLeft1:

		cmp [key1],'d'
		jne endRight1
		add [x1],3 
	endRight1:
ret
endp keletMove
;-------------------
proc keletMove2
		cmp [key2],'i'
		jne endUp2
		sub [y2],3 
	endUp2:

		cmp [key2],'k'
		jne endDown2
		add [y2],3 
	endDown2:

		cmp [key2],'l'
		jne endLeft2
		add [x2],3 
	endLeft2:


		cmp [key2],'j'
		jne endRight2
		sub [x2],3
	endRight2:
ret
endp keletMove2
;---------------------
proc addPointsSur
	push ax
	push bx
	push dx
	cmp [clock] ,10
	jne endPoints2
	sub [MinSecend],1
	cmp [MinSecend],2
	jne notWin
	mov [winSur],1
	notWin:	
	mov bx,[clock]
	mov [clock],0
	add [points],1d
	call OpenSpeaker 
push 11111000b
call PlayMusic
mov [delayMinSecend],5
call Delay
mov [clock],0
call CloseSpeaker
	endPoints2:
	pop dx
	pop bx
	pop ax
	ret 
endp addPointsSur
;--------------
proc addPoints
		push ax
		push bx
		push dx
		cmp [clock] ,10
		jne endPoints
		mov bx,[clock]
		mov [clock],0
		add [points],1d
		call OpenSpeaker 
		push 11111000b
		call PlayMusic
		mov [delayMinSecend],5
		call Delay
		call randomBox
		mov [clock],0
		call CloseSpeaker


	endPoints:
		pop dx
		pop bx
		pop ax
	ret 
endp addPoints
;------------------------
proc randomBox
		call clock0
		mov ax,[clock]
		cmp [clock2],5
		jne end1
		mov [x3],100
		mov [y3],100
		mov [color3],90
		call box3
		ret
	end1:

		cmp [clock2],10
		jne end2
		mov [x3],200
		mov [y3],200
		mov [color3],90
		call box3
		ret
	end2:

		cmp [clock2],15
		jne end3
		mov [x3],170
		mov [y3],30
		mov [color3],120
		call box3
		ret
	end3:

		cmp [clock2],25
		jne end4
		mov [x3],30
		mov [y3],170
		mov [color3],90
		call box3
		ret
	end4:

		cmp [clock2],30
		jne end5
		mov [x3],145
		mov [y3],90
		mov [color3],120
		call box3
		ret
	end5:

		cmp [clock2],35
		jne end6
		mov [x3],270
		mov [y3],100
		mov [color3],120
		call box3
		ret
	end6:


		cmp [clock2],40
		jne end7
		mov [x3],49
		mov [y3],111
		mov [color3],120
		call box3
		ret
	end7:


		cmp [clock2],45
		jne end8
		mov [x3],74
		mov [y3],40
		mov [color3],120
		call box3
		ret
	end8:

ret 
endp randomBox
;---------------------
proc printPoints
	push ax
	push bx
	push dx
	mov dh, 1	;Set cursor position
	mov dl, 17
	mov bh, 0
	mov ah, 2
	int 10h 
	mov dx, offset pointsMess
	mov ah,9
	int 21h
	mov dh, 1	;Set cursor position
	mov dl, 22
	mov bh, 0
	mov ah, 2
	int 10h 
	xor ax,ax 
	mov ax, [points]; to take the mana i div the points in ten
	div [ten] ;to take the mana i div the points in ten
	mov dl,al; print mana
	add dl, '0'; print
    mov ah,2h ; print
    int 21h ; print
	xor ax,ax
	mov ax, [points] ;to take the she'erit i div the points in ten
	div [ten] ;to take the she'erit i div the points in ten
	mov dl,ah ;print mana
	add dl, '0' ;print
    mov ah,2h ;print
    int 21h ;print
	pop dx
	pop bx
	pop ax
	ret
endp printPoints	
;--------------------
proc printPoints1
	push ax
	push bx
	push dx
	mov dh, 1	;Set cursor position
	mov dl, 5
	mov bh, 0
	mov ah, 2
	int 10h 
	mov dx, offset pointsP1Mess
	mov ah,9
	int 21h
	mov dh, 1	;Set cursor position
	mov dl, 10
	mov bh, 1
	mov ah, 2
	int 10h 
	xor ax,ax 
	mov ax, [pointsP1]; to take the mana i div the points in ten
	div [ten] ;to take the mana i div the points in ten
	mov dl,al; print mana
	add dl, '0'; print
    mov ah,2h ; print
    int 21h ; print
	xor ax,ax
	mov ax, [pointsP1] ;to take the she'erit i div the points in ten
	div [ten] ;to take the she'erit i div the points in ten
	mov dl,ah ;print mana
	add dl, '0' ;print
    mov ah,2h ;print
    int 21h ;print
	pop dx
	pop bx
	pop ax
	ret
endp printPoints1	
;------------------------
proc printPoints2
	push ax
	push bx
	push dx
	mov dh, 1	;Set cursor position
	mov dl, 26
	mov bh, 0
	mov ah, 2
	int 10h 
	mov dx, offset pointsP2Mess
	mov ah,9
	int 21h
	mov dh, 1	;Set cursor position
	mov dl, 29
	mov bh, 1
	mov ah, 2
	int 10h 
	xor ax,ax 
	mov ax, [pointsP2]; to take the mana i div the points in ten
	div [ten] ;to take the mana i div the points in ten
	mov dl,al; print mana
	add dl, '0'; print
    mov ah,2h ; print
    int 21h ; print
	xor ax,ax
	mov ax, [pointsP2] ;to take the she'erit i div the points in ten
	div [ten] ;to take the she'erit i div the points in ten
	mov dl,ah ;print mana
	add dl, '0' ;print
    mov ah,2h ;print
    int 21h ;print
	pop dx
	pop bx
	pop ax
	ret
endp printPoints2
;----------------------
proc Dot3
push ax bx cx dx
	mov bh,0h
	mov cx,[x3]
	mov dx,[y3]                   ;ptinting dot
	mov al,[color3]
	mov ah,0ch
	int 10h
pop dx cx bx ax
	ret
endp Dot3
;-----------------------
proc line3
	push cx 
	mov cx,3
		printLine4:
			call Dot3
			inc [x3]
			loop printLine4            ;printing line
			sub[x3],3                 ;setting the x courage back
	pop cx
	ret
endp line3


proc box3
	push cx
	mov cx,3
		matrix4:
			call line3
			inc [y3]                ;printing boxangle  3*3
			loop matrix4
			sub[y3],3              ;setting the y courage back
	pop cx
	ret
endp box3
;---------------------
proc randomBoxs
cmp [box90],1
jne box90end
lea bx, [filename1]
mov [filenamee],bx
call Splash
mov [box90],0
box90end:


cmp [box120],1
jne box120end
sub [MinSecend],10
mov [box120],0
box120end:
ret
endp randomBoxs
;--------------------