	
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
	;פרוצדורה סוגרת קובץ
	MOV AH,3Eh 
	MOV BX, [filehandle] 
	INT  21h 
	ret
endp CloseFile
	
;=============================================================================================================================================	
		
proc DrawTetrisTitle
	lea bx, [TetrisTitle]
	mov [filenamee],bx
	call Splash
ret
endp DrawTetrisTitle
	
;=============================================================================================================================================	
		
proc DrawKeyboardInfo
	lea bx, [KeyBoardInfo]
	mov [filenamee],bx
	call Splash
ret
endp  DrawKeyboardInfo
	
;=============================================================================================================================================	
		
proc DrawHowToPlay
	lea bx, [instructions]
	mov [filenamee],bx
	call Splash
ret
endp DrawHowToPlay
	
;=============================================================================================================================================	
		
proc DrawModesPage
	lea bx, [ModesPage]
	mov [filenamee],bx
	call Splash
ret
endp DrawModesPage
	
;=============================================================================================================================================	
		
proc DrawMenu
	lea bx, [Menu]
	mov [filenamee],bx
	call Splash
ret
endp DrawMenu
	
;=============================================================================================================================================	
		
proc DrawLoading1
push cx
	lea bx, [Loading1]
	mov [filenamee],bx
	call Splash
	pop cx
ret
endp DrawLoading1
	
;=============================================================================================================================================	
		
proc DrawLoading2
push cx
	lea bx, [Loading2]
	mov [filenamee],bx
	call Splash
pop cx
ret
endp DrawLoading2
	
;=============================================================================================================================================	
		
proc DrawLoading3
push cx
	lea bx, [Loading3]
	mov [filenamee],bx
	call Splash
pop cx
ret
endp DrawLoading3
	
;=============================================================================================================================================	
		
;פעולה שמציירת את מסך הטעינה
proc Loading 
	call TheNextPositionToPlay2 ;מגריל מספר אקראי בין 1 ל2
	cmp dl,2 ; לפעמים עושה טעינה קצרה ולפעמים ארוכה
	je ShortLoading
	call DrawLoading1 ; מצייר את מסך הטעינה הראשון
	call second ;מחכה שנייה
	call second ;מחכה שנייה
	ShortLoading:
		call DrawLoading2 ;מצייר את מסך הטעינה השני
		call second ;מחכה שנייה
		call second
		call DrawLoading3 ; מצייר את מסך הטעינה השלישי
		call second ;מחכה שנייה

call clearkeyboardbuffer
ret
endp Loading
	
;=============================================================================================================================================	