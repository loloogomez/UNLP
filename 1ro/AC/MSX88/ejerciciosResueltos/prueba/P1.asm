PA    EQU   30H
CA    EQU   32H
PB    EQU   31H
CB    EQU   33H

      ORG   1000H
PALABRA DB    "ORGANIZACION Y ARQUITECTURA"
FIN   DB    ?

      ORG   2000H
      MOV   CX, OFFSET FIN - OFFSET PALABRA
      MOV   BX, OFFSET PALABRA
      MOV   AL, 0FDH
      OUT   CA, AL
      MOV   AL, 0H
      OUT   CB, AL
      IN    AL, PA
      AND   AL, 0FDH
      OUT   PA, AL

REQUEST:  IN   AL, PA
          AND  AL, 1H
          JNZ  REQUEST

      MOV   AL, [BX]
      OUT   PB, AL
      IN    AL, PA
      OR    AL, 2H
      OUT   PA, AL
      IN    AL, PA
      AND   AL, 0FDH
      OUT   PA, AL
      INC   BX
      DEC   CX
      JNZ   REQUEST
      HLT
END
