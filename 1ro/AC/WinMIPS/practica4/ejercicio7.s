  .data
TABLA:  .word 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
X: .word 10
CANT: .word 0
RES: .word 0

  .code
ld  r2, X(r0)
daddi r3, r3, 10
ld  r4, CANT(r0)
dadd  r6, r6, r0

loop: ld r1, TABLA(r6)
      dsub  r7, r1, r2
      beqz  r7, sig
      slt   r7, r1, r2
      bnez  r7, sig
      daddi r4, r4, 1
      sd    r4, CANT(r0)
      ld    r5, RES(r6)
      daddi r5, r5, 1
      sd    r5, RES(r6)
      daddi r6, r6, 8
      daddi r3, r3, -1
      bnez  r3, loop
      j     fin

sig:  daddi r6, r6, 8
      daddi r3, r3, -1
      bnez  r3, loop
      j     fin

fin: halt
