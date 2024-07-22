PA EQU 30h
CA EQU 32h

org 1000h
msj1 db "llave prendida"
msj2 db "llave apagada"
stop db ?

ORG 2000H
in AL, CA
mov AL, BL
in AL, PA
mov BH, AL
and BH, BL
and BH, 80h
jnz ON
mov AL, offset stop - offset msj2
mov BX, offset msj2
int 7
jmp fin
ON: mov AL, offset msj2 - offset msj1
    mov BX, offset msj1
    int 7
fin: hlt
     END
