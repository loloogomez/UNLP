      org 1000h
A     dw   10
B     dw   5
C     dw   6
RES   dw   ?

      org 3000h
operacion: add   AX, BX
           sub   AX, CX
           RET

      org 2000h
mov   AX, A
mov   BX, B
mov   CX, C
call operacion
mov RES, AX
      HLT
END
