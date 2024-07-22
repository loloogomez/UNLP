  .data
PESO: .double   68
ALT:  .double   1.80
IMC:  .double   0
estado: .word   0
infra: .double   18.5
norm: .double   25
sobre: .double   30

  .code
l.d   f2, ALT(r0)
l.d   f1, PESO(r0)
l.d   f3, infra(r0)
mul.d f2, f2, f2
l.d   f4, norm(r0)
l.d   f5, sobre(r0)
div.d f1, f1, f2
s.d   f1, IMC(r0)

c.lt.d  f1, f3
bc1t    INFRAP
c.lt.d  f1, f4
bc1t    NORMAL
c.lt.d  f1, f5
bc1t    SOBREPE
j       OBESIDAD

INFRAP: daddi r1, r0, 1
        j   fin
        nop

NORMAL: daddi r1, r0, 2
       j    fin
       nop

SOBREPE:  daddi r1, r0, 3
          j    fin
          nop

OBESIDAD: daddi r1, r0, 4

fin: sd r1, estado(r0)
halt
