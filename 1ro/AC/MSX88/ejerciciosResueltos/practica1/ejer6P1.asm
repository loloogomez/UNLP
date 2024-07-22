      org 1000H
NUM1  dw  2h
NUM2  dw  5h
RES   dw  ?

      org 2000H
mov   AX, 0
mov   BX, NUM2

loop:  ADD AX, NUM1
       DEC  BX
       JNZ  loop

mov  RES, AX
      HLT
END
