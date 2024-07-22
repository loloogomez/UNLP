          ORG   1000H
NUM1      DB    10
NUM2      DB    2
IGUAL     DB    ?
RES       DB    ?

          ORG   2000H
          MOV AL, NUM1
          MOV BL, NUM2
          MOV CL, 0

BUCLE:    CMP AL, BL
          JS FIN
          INC CL
          SUB AL, BL
          JS FIN
          JMP BUCLE

FIN:      MOV IGUAL, CL
          MOV RES, AL
          HLT

END
