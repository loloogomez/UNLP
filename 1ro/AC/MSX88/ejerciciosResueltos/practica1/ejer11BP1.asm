ORG 1000H
dividendo dw  29h
divisor   dw  20h
RES       dw  ?

ORG 3000H
DIV:   cmp  BX, AX
       js   fin
       SUB  BX, AX
       jmp  DIV
fin:   MOV CX, BX
       ret

ORG 2000H
MOV BX, dividendo
MOV AX, divisor
MOV CX, 0h
call  DIV
MOV RES, CX
hlt
END
