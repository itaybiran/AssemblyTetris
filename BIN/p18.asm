IDEAL
MODEL small
STACK 100h

DATASEG

	filename db 'Mydetail.txt',0
	filehandle dw ?
	errorMessage db "Error!$"
	my_adress db 'adolam 11$'  ; 9 bytes
	my_name db 'Itay Biran$' ; 10 bytes
	buffer db 15 dup('')

CODESEG

	;פותח רמקול
	proc openSpeaker
		in al, 61h
		or al, 00000011b
		out 61h, al
		ret
	endp openSpeaker

	;סוגר רמקול
	proc closeSpeaker
		in al, 61h
		and al, 11111100b
		out 61h, al
		ret
	endp closeSpeaker

	;מנגן את התו דו
	proc playDo
		mov al, 0dbh
		out 42h, al
		mov al, 11h
		out 42h, al
		ret
	endp playDo

	proc OpenFile
		; Open file
		mov ah, 3Dh
		mov al, 2
		lea dx, [filename]
		int 21h
		jc openerror
		mov [filehandle], ax
		ret
		openerror:
		mov dx, offset  errorMessage
		mov ah, 9h
		int 21h
		ret
	endp OpenFile

	proc WriteName
	;print the name
		mov ah,40h
		mov bx, [filehandle]
		mov cx,15
		mov dx,offset My_name
		int 21h
		ret
	endp WriteName

	proc WriteAdress
		;print the adress
		mov ah,40h
		mov bx, [filehandle]
		mov cx,9
		mov dx, offset My_adress
		int 21h
	ret 
	endp WriteAdress

	proc ReadFile
	; Read file
		mov ah,3Fh
		mov bx, [filehandle]
		mov cx, 10
		mov dx,offset Buffer
		int 21h
	ret
	endp ReadFile

	proc CloseFile ; close the file
		mov ah,3Eh
		mov bx, [filehandle]
		int 21h
		ret
	endp CloseFile

	;dx -מדפיס מחרוזת שנגמרת ב$ והאופסט שלה ב 
	proc printString
		mov ah, 9h
		int 21h
		ret
	endp printString
	
	;קליטת תו מהמשתמש
	proc inputTav
		mov ah, 1h
		int 21h
		ret
	endp inputTav ; al = ASCII of the tav


start:
    mov ax, @data
    mov ds, ax
	; כותב לקובץ את השם והכתובת
	call OpenFile
	call WriteName
	call WriteAdress
    call CloseFile
	
	; קורא מהקובץ את השם ומדפיס אותו
	call OpenFile
	call ReadFile
	mov dx, offset buffer
	call printString
	
	; מנגן את התו דו
	call openSpeaker
	call playDo
	
	; סוגר את הקובץ
	call CloseFile
	
    ; מחכה לקלט של תו
	loop1:
	call inputTav
	
	; מפסיק את השמעת הצליל
	call closeSpeaker
	
exit:
    mov ax, 4c00h
    int 21h
END start
