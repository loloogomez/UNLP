EOI  EQU  20h
IMR  EQU  21h
int_0  EQU 24h
N_F10 EQU 0

ORG 0
DW  dir_F10

org 3000h
dir_F10: inc DX
         mov AL, EOI
         out EOI, AL
         iret

org 2000h
CLI
mov AL, N_F10
out int_0, AL
MOV  AL, 0FEh
out IMR, AL
STI
mov DX, 0

loop: cmp DX, 10
      jnz loop

      hlt
      end
