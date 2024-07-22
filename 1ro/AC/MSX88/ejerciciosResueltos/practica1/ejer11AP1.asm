          ORG 1000H
dividendo dw  5h
divisor   dw  2h
RES       dw  ?

          ORG 3000H
DIV:      MOV BX, SP
          ADD BX, 2
          MOV AX, word ptr [BX]
          ADD BX, 2
          MOV BX, word ptr [BX]
loop:     cmp BX, AX
          js  fin
          SUB BX, AX
          INC CX
          jmp loop
fin:      pop DX
          push  CX
          push  DX
          ret

          ORG 2000H
MOV AX, dividendo
MOV BX, divisor
push  AX
push  BX
call  DIV
pop   AX
MOV RES, AX
hlt
          END
