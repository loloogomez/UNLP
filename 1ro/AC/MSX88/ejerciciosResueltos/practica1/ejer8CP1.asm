org 1000h
cadena DB "aBcDe"
stop db 0h
RES  DW ?

org 3000H
ES_VOCAL: cmp byte ptr [BX], 0
          jz fin
          cmp byte ptr [BX], 61h
          jz  ES
          cmp byte ptr [BX], 65h
          jz ES
          cmp byte ptr [BX], 69h
          jz  ES
          cmp byte ptr [BX], 6fh
          jz ES
          cmp byte ptr [BX], 75h
          jz  ES
          cmp byte ptr [BX], 41h
          jz ES
          cmp byte ptr [BX], 45h
          jz  ES
          cmp byte ptr [BX], 49h
          jz ES
          cmp byte ptr [BX], 4fh
          jz  ES
          cmp byte ptr [BX], 55h
          jnz NO_ES
ES:       inc AX
NO_ES:    inc BX
          jmp ES_VOCAL
fin:       ret

ORG 2000H
MOV AX,0h
MOV BX, OFFSET cadena
CALL  ES_VOCAL
MOV RES, AX
HLT
END
