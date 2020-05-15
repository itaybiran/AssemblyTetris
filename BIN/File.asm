
;פותח קובץ לקריאה וכתיבה
proc OpenFile
	mov ah, 3Dh
	mov al, 2
	lea dx, [filename]
	int 21h
	jc openError
	mov [filehandle], ax
	ret
	openError:
	mov dx, offset ErrorMsg
	call printString
	ret
endp OpenFile



;=============================================================================================================================================================



numOfChars equ [byte ptr bp + 4]

;כותב לקובץ
proc WriteToFile
	
	mov ah, 40h
	mov bx, [filehandle]
	mov cl, numOfChars
	mov dx, offset Message
	int 21h
	ret 2
endp WriteToFile ; יש לדחוף למחסנית את מספר התווים בהודעה ולשמור אותה במשתנה הודעה לפני הקריאה לפעולה



;=============================================================================================================================================================



numOfChars equ [byte ptr bp + 4]

;קורא מקובץ
proc ReadFile
	mov ah,3Fh
	mov bx, [filehandle]
	mov cl, numOfChars
	mov dx, offset Buffer
	int 21h
	ret 2
endp readFile ;יש לדחוף למחסנית את כמות התווים שרוצים לקרוא



;=============================================================================================================================================================


;סוגר קובץ
proc CloseFile
	mov ah,3Eh
;	mov bx, [filehandle]
	int 21h
	ret
endp CloseFile



;=============================================================================================================================================================
