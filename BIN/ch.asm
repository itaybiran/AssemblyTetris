IDEAL
MODEL small
STACK 100h
DATASEG
filename db 'testfile.txt',0
filehandle dw ?
Message db 'Hello world!'
ErrorMsg db 'Error', 10, 13,'$'
CODESEG
proc OpenFile
; Open file for reading and writing

mov ah, 3Dh
mov al, 2
mov dx, offset filename
int 21h
jc openerror
mov [filehandle], ax
ret
openerror:
mov dx, offset ErrorMsg
mov ah, 9h
int 21h
ret
endp OpenFile
proc WriteToFile

; Write message to file
mov ah,40h
mov bx, [filehandle]
mov cx,12
mov dx,offset Message
int 21h
ret
endp WriteToFile
proc CloseFile
; Close file
mov ah,3Eh

mov bx, [filehandle]
int 21h
ret
endp CloseFile
start:
mov ax, @data
mov ds, ax
; Process file
call OpenFile
call WriteToFile
call CloseFile
quit:
mov ax, 4c00h
int 21h
END start