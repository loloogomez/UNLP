org 1000h
num1  db ?
num2  db ?
RES   db ?
stop  db ?

ORG 2000H
MOV BX, offset num1
int 6
MOV BX, offset num2
int 6
MOV CL, num1
sub CL, 30h
MOV CH, num2
sub CH, 30h
add CL, CH
cmp CL, 0Ah
js SIN_CARRY
sub cl, 0Ah
add cl, 30h
mov RES, 31h
mov BX ,offset RES + 1
mov byte ptr [BX], cl
mov AL, 2
jmp imprimir
SIN_CARRY: add CL, 30h
           mov RES, CL
           MOV AL, 1
imprimir: mov BX, offset RES
          int 7
          hlt
          end
