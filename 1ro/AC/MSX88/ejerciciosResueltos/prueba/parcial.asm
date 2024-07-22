PA     EQU    30H
CA     EQU    32H
PB     EQU    31H
CB     EQU    33H

       ORG    1000H
LETRA  DB     ?
ENCENDER DB   "ENCIENDA EL PRIMER INTERRUPTOR PARA COMENZAR"
FIN     DB    ?
MAYUS   DB    "ESCRIBA UNA LETRA MAYUSCULA"
FIN2    DB    ?

       ORG    3000H
DELAY: DEC    DL
       JNZ    DELAY
       RET

IMP:   MOV   AL, 0FDH
       OUT   CA, AL
       IN    AL, PA
       AND   AL, 0FDH
       OUT   PA, AL

REQUEST:  IN   AL, PA
       AND   AL, 1H
       JNZ   REQUEST

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
       RET

SUBRUTINA: MOV BX, SP
        ADD BX, 2
        MOV AX, [BX]
        CMP AX, 47H
        JS  A-F
        MOV   AL, 0H
        OUT   CB, AL
        MOV   AL, 55H
        OUT   PB, AL
A-F:    MOV   AL, 0H
        OUT   CB, AL
        MOV   AL, AA
        OUT   PB, AL
        RET

       ORG     2000H
       MOV     DL, 5H
       MOV     AL, 0FFH
       OUT     PB, AL
       MOV     AL, 0H
       OUT     CB, AL
       CALL    DELAY
       OUT     PB, AL
       MOV     CX, OFFSET FIN - OFFSET ENCENDER
       MOV     BX, OFFSET ENCENDER
       CALL    IMP

       IN     AL, PA
       MOV   DH, AL
       IN    AL, CA
       AND   AL, DH
       JNZ   SIG
SIG:   MOV   BX, OFFSET MAYUS
       MOV   CX, OFFSET FIN2 - OFFSET MAYUS
       CALL IMP
      MOV BX, OFFSET LETRA
      INT6
      MOV   AL, [BX]
      CMP   AL, 41H
      JS    SIG
      CMP   AL, 5B
      JNS   SIG
      PUSH  AL
      CALL SUBRUTINA
      HLT
END
