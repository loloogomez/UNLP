PA    EQU   30H
CA    EQU   32H
PB    EQU   31H
CB    EQU   33H

      ORG   1000H
LETRA DB    "A"

      ORG   2000H
      MOV   BL, LETRA
      MOV   AL, 0FDH
      OUT   CA, AL
      MOV   AL, 0H
      OUT   CB, AL
      IN    AL, PA
      AND   AL, 0FDH
      OUT   PA, AL

BUCLE:  IN   AL, PA
        AND  AL, 1H
        JNZ  BUCLE

      MOV   AL, BL
      OUT   PB, AL
      IN    AL, PA
      OR    AL, 2H
      OUT   PA, AL
      IN    AL, PA
      AND   AL, 0FDH
      OUT   PA, AL
      HLT
END
