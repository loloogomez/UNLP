EOI  EQU 20h
IMR  EQU 21h
INT_0 EQU 24h
INT_F10 EQU 10

org 40
dw  dirINT

org 3000h
dirINT: inc CL
        mov BX, DX
        MOV AL, 1
        int 7
        mov AL, EOI
        out EOI, AL
        iret

org 2000h
cli
mov AL, INT_F10
out INT_0, AL
MOV AL, 0FEh
out IMR, AL
STI

loop: mov DL, 61h
loop2: inc DL
      cmp CL, 1
      jz fin
      cmp DL, 7Ah
      jz loop
      jmp loop2

fin: hlt
END
