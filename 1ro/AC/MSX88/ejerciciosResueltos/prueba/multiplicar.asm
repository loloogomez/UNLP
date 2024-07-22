        ORG     1000H
A       DB      10
B       DB      5
RES     DB      ?

        ORG     2000H
        MOV     AL, A
        MOV     BL, B
        MOV     CL, 0
        CMP     BL, 0
        JZ      FIN
BUCLE:  ADD     CL, AL
        DEC     BL
        JNZ     BUCLE

FIN:    MOV     RES, CL

        HLT
END
