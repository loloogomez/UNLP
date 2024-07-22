EOI    EQU 20h
IMR    EQU 21h
INT_0  EQU 24h
dir_F10 EQU 10

org 40
dw  INT_F10

org 1000h
msj1 db "ingrese un numero del 1 al 9"
car  db ?

ORG 3000H
INT_F10:

ORG 2000H
MOV AL, offset car - offset msj1
mov BX, offset msj1
int 7
mov BX, offset car
loop: int 6
      mov Cl, byte ptr [BX]
      cmp CL, 3Ah
      jns loop
      cmp CL, 31h
      js  loop

      mov CL, 0
loop2: cmp CL, 0
       jz loop2

hlt

;seguir despues parical 1 fecha 1
