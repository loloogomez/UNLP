          ORG     1000H
TABLA     DB      1, 2, 3, 4
FINAL     DB      ?

          ORG     2000H
          MOV     BX, OFFSET TABLA
          MOV     DL, OFFSET FINAL - OFFSET TABLA
BUCLE:    MOV     AL, [BX]
          AND     AL, 1
          JZ      PAR
          INC     CL
PAR:      INC     BX
          DEC     DL
          JNZ     BUCLE
          HLT
END
