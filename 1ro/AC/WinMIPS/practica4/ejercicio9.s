  .data
A:  .word 3
X:  .word 2
Y:  .word 1

  .code
ld  r1, A(r0)
ld  r2, X(r0)
ld  r3, Y(r0)

loop: beqz  r1, fin
      dadd  r2, r2, r3
      daddi r1, r1, -1
      nop
      j     loop
      nop

fin: halt
