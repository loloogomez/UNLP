      ORG 1000H
numero  DB  ?

      ORG 2000H
      MOV AL, 1
      MOV BX, offset numero
      int 6
      int 7
      hlt
      end
