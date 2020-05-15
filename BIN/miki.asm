IDEAL
MODEL small
STACK 100h
DATASEG


CODESEG

include "mm.asm"

start:
	mov ax, @data
	mov ds, ax
	call GraphMode
	call DrawOpeningScreen
	call WaitforSpace
	call outline
	call aliens
	call spaceship
	
	MoveSpaceShip:
		call buffercleaner
		call MoveSS
	jmp MoveSpaceShip
	
exit:
	mov ax, 4c00h
	int 21h
END start