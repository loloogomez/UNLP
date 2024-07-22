ORG 1000H
cero  DB  "cero   "
uno   DB  "uno    "
dos   DB  "dos    "
tres  DB  "tres   "
cuatro DB  "cuatro "
cinco DB  "cinco  "
seis  DB  "seis   "
siete DB  "siete  "
ocho  DB  "ocho   "
nueve DB  "nueve  "
num   DB  ?
numant db 0

ORG 2000H
loop: mov BX, offset num
      int 6
      mov CL, byte ptr [BX]
      cmp CL, 30h
      jz  salto
sigue: mov numant, Cl
      MOV CH, 30h
      mov BX, offset cero

loop2:  cmp CL, CH
      jz imprimir
      add BX, 7h
      inc CH
      jmp loop2

imprimir: mov AL, 7h
          int 7
          jmp loop

salto: cmp CL, numant 
       jz  fin
       jmp sigue

fin: hlt
END
