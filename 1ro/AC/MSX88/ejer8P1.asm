org 1000H
cadena DB "abcd"
stop DB 0

org 3000H
LONGITUD: cmp byte ptr [BX], 0h
          jz  FIN
          INC AX
          INC BX
          jmp LONGITUD
FIN:      RET

ORG 2000H
MOV AX,0h
MOV BX, OFFSET cadena
CALL  LONGITUD
HLT
END
