ORG      1000H
CADENA    DB       ?

          ORG      2000H
          MOV BX, OFFSET CADENA
          MOV CL, 0
LOOP:     INT 6
          CMP BYTE PTR [BX], 0DH
          JZ FIN
          INC CL
          INC BX
          JMP LOOP

FIN:      MOV AL, CL
          MOV BX, OFFSET CADENA
          INT 7
          HLT

END 
