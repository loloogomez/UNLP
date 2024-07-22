org 1000h
almacenado DB 80h
N          DB 2h

ORG 3000H
ROTARIZQ_N: cmp BL, 0
            jz fin
            add AL, AL
            jnc SIN_CARRY
            ADD AL, 1h
SIN_CARRY:  dec BL
            jmp ROTARIZQ_N
fin:        MOV almacenado, AL
            ret

ORG 2000H
mov AL, almacenado
mov BL, N
call ROTARIZQ_N
hlt
END
