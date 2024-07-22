      ORG 1000H
min   DB  61h
may   DB  41h

      ORG 2000H
MOV AL, 1
loop: MOV BX, offset min
      int 7
      MOV BX, offset may
      int 7
      MOV AH, min
      inc AH
      mov min, AH
      MOV AH, may
      inc AH
      mov may, AH
      cmp AH, 5Bh
      jnz loop
      hlt
      END
