IDEAL
MODEL small
STACK 100h
DATASEG


CODESEG

include "jzxncL.asm"

start:
	mov ax, @data
	mov ds, ax
	call GraphMode
	
	call DrawOpeningScreen
	
	call clickHereButton
	call DrawMenu	
	
	call playbutton
	;call DrawGameBackground
	;call aliens
	;call spaceship
	
	MoveSpaceShip:
		;call buffercleaner
		;call MoveSS
	jmp MoveSpaceShip
	
exit:
	mov ax, 4c00h
	int 21h
END start