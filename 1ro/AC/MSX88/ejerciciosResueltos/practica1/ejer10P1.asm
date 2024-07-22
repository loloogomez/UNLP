        org 1000h
dato1   dw  0FFFFh
dato2   dw  1001h

        org 3000h
SWAP:   MOV BX, SP
        ADD BX, 2
        MOV AX, word ptr [BX]
        ADD BX, 2
        MOV CX, word ptr [BX]
        MOV dato1, AX
        MOV dato2, CX
        ret

        ORG 2000H
MOV AX, dato1
MOV BX, dato2
push  AX
push  BX
call SWAP
hlt
END
