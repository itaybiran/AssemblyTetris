IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
include "myData.asm"
; --------------------------
CODESEG
escape equ 1bh

include "myProc.asm"


		start:
       mov ax,@data
	   mov ds,ax
; --------------------------
include "myCode.asm"
; --------------------------

exit:
	mov ax, 4c00h
	int 21h
END start