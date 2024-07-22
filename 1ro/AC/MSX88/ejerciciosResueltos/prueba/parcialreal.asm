cont EQU 10h
comp EQU 11h
EOI  EQU 20h
IMR  EQU 21h
INT_1 EQU 25h
PB  EQU   31h
CB  EQU   33h
dirINT EQU 10

org 40

dw int_T


org 1000h
msj1 db "ingrese un numero del 0 al 9 "
car  db ?
RES  dw ?
tabla db ?

ORG 3000H
LEER_NRO: push BX
          MOV AL, offset car - offset msj1
          mov BX, offset msj1
          int 7
          mov BX, offset car
loop:     int 6
          mov Cl, byte ptr [BX]
          cmp CL, 3Ah
          jns loop
          cmp CL, 30h
          js  loop
          pop BX
          ret

ENCENDER: cmp DL, 0
          jnz ENCENDER
          ret

int_T: cmp dl, 0
       jz fin
       mov DH, 0
       mov AL, byte ptr [BX]
       sub AL, 30h
       out PB, AL
       add DH, AL
       and DH, 1
       jnz impar
       inc CH
impar: inc BX
       dec DL
       mov AL, 0
       OUT cont, AL
       mov AL, 20h
       OUT EOI, AL
       iret
fin:   mov AL, 0FFh
       out IMR, AL
       iret

ORG 2000H
mov BX, offset tabla
call LEER_NRO
mov byte ptr [BX], CL
inc DL
loop2: cmp CL, 39h
       jz sig
       call LEER_NRO
       inc BX
       mov byte ptr [BX], CL
       INC DL
       jmp loop2

sig:  cli
      mov AL, 0FDh
      OUT IMR, AL
      mov AL, dirINT
      out INT_1, AL
      MOV AL, 1
      OUT comp, AL
      MOV AL, 0
      OUT CB, AL
      OUT PB, AL
      OUT cont, AL
      mov BX, offset tabla
      mov CH, 0
      STI

      call ENCENDER

      mov RES, CH

hlt
END
