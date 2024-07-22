      ORG 1000h
NUM1  DB 10
NUM2  DB 15
RES   DB ?

      org 2000h
      MOV AL, NUM1
      MOV BL, NUM2
      ADD AL, BL
      MOV RES, AL
      HLT

END
