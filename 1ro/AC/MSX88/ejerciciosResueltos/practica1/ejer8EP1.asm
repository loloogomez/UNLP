org 1000h
cadena DB "aBcDe"
stop db 0h
CAR  DB  "c"
RES  DW ?

org 3000H
CONTAR_CAR: MOV BX, SP
            ADD BX, 2h
            MOV CX, [BX]
            ADD BX, 2h
            MOV BX, [BX]
loop:       cmp byte ptr [BX], 0
            jz fin
            cmp byte ptr [BX], CL
            jnz  NO_ES
            inc AX
NO_ES:      inc BX
            jmp loop
fin:        ret

ORG 2000H
MOV AX,0h
MOV CL, CAR
MOV BX, OFFSET cadena
push BX
push CX
CALL  CONTAR_CAR
MOV RES, AX
HLT
END
