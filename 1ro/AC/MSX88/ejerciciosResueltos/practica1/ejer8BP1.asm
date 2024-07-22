org 1000H
cadena DB "aBcDe"
stop DB 0h
RES  DW ?

org 3000H
MINUSCULA: cmp byte ptr [BX], 0h
           jz  fin
           cmp byte ptr [BX], 61h
           js  noES
           cmp byte ptr [BX], 7bh
           jns noES
           inc AX
noES:      inc BX
           jmp MINUSCULA
fin:       ret

ORG 2000H
MOV AX,0h
MOV BX, OFFSET cadena
CALL  MINUSCULA
MOV RES, AX
HLT
END
