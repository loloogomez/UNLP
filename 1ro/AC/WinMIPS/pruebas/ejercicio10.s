  .data
BUSCAR: .asciiz "g"
CANT: .word 0
CADENA: .asciiz "agbgdggfg"

  .code
dadd  r10, r0, r0
lbu   r1, BUSCAR(r0)
dadd  r2, r0, r0

loop: lbu r3, CADENA (r10)
      nop
      nop
      beqz  r3, fin
      daddi r10, r10, 1
      dsub  r3, r3, r1
      nop
      beqz  r3, sumar
      nop
      j loop
      nop

sumar: daddi  r2, r2, 1
       j  loop
       nop

fin: sd r2, CANT(r0)
     halt
