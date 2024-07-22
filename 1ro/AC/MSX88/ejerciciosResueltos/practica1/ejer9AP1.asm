org 1000h
almacenado DB 80h

ORG 3000H
ROTARIZQ: add AL, AL
          jnc SIN_CARRY
          ADD AL, 1h
SIN_CARRY: MOV almacenado, AL
          ret

ORG 2000H
mov AL, almacenado
call ROTARIZQ
hlt
END
