org 1000h
cadena DB "aBcDe"
stop db 0h
ORIGINAL DB  "c"
REEMPLAZO DB "B"

org 3000H
CONTAR_CAR: MOV BX, SP
            ADD BX, 2h
            MOV CX, [BX]
            ADD BX, 2h
            mov DX, [BX]
            ADD BX, 2h
            MOV BX, [BX]
loop:       cmp byte ptr [BX], 0
            jz fin
            cmp byte ptr [BX], CL
            jnz  NO_ES
            mov byte ptr [BX], DL
NO_ES:      inc BX
            jmp loop
fin:        ret

ORG 2000H
MOV CL, ORIGINAL
MOV DX, REEMPLAZO
MOV BX, OFFSET cadena
push BX
push DX
push CX
CALL  CONTAR_CAR
HLT
END
