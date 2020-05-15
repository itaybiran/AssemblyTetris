call Graphics    ;set graphic mode
start00:
mov [pointsP1],0
mov [pointsP2],0   ; calibration points
lea bx, [filename]
mov [filenamee],bx
call Splash          ;opening
start0:
mov ah,8
int 21h                  ;checking the key
cmp al,'1'                ;if 1 key is pressed, you enter surviveMode
je OpenSurvival
cmp al,'2'                ;if 2 key is pressed, you enter pvpMode
je Openpvp
cmp al,escape              ;if escape key is pressed,the program will shut off
je GameEnd1
jmp start0                    ;if you pressed iligel tav you wiil try again





Openpvp:
call instructionsPvp
start11:                            
lea bx, [filename1]
mov [filenamee],bx
call Splash     ;misgert
call update    ; calibration the pvpMode
start1:   ;loop until the snakes dont each other or the misgert or you pressed escape             
pop ax
mov ax,[MinSecend]
mov [delayMinSecend],ax
push ax
call GamePvp
cmp [lose1],1
je endGame
cmp [lose2],1
je endGame
cmp [key1],escape              ;if escape key is pressed,the program will shut off
je yon
jmp start1
endGame:
call endGameMode

yon:
mov ah,8
int 21h                  ;checking the key
cmp al,'y'
je start11
cmp al, 'n'
je start00
jmp yon



jmp start123
start01:
jmp start00
GameEnd1:
jmp  GameEnd
start123:




OpenSurvival:
call instructionsSur
start22:                            
lea bx, [filename1]
mov [filenamee],bx
call Splash     ;misgert
call update    ; calibration
start2:   ;loop until the snake dont toch himself or the misgert or you pressed escape             
pop ax
mov ax,[MinSecend]
mov [delayMinSecend],ax
push ax
call GameSur
cmp [lose1],1
je endGame2
cmp [winSur],1
je endGame2
cmp [key1],escape              ;if escape key is pressed,the program will shut off
je yon2
jmp start2
endGame2:


call endGameModeSur


yon2:
mov ah,8
int 21h                  ;checking the key
cmp al,'y'
je start22
cmp al, 'n'
je start01
jmp yon2




GameEnd:
call CloseSpeaker
call CloseFile
MOV AL, 3H
MOV AH, 0
INT 10H