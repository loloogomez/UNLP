PB   EQU  31h
CB   EQU  33h

ORG 2000H
mov AL, 00h
out CB, AL
mov AL, 0c3h
out PB, AL

hlt
END
