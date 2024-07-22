  .data
NUM1: .word 10
NUM2: .word 5
RESULTADO: .word  0

  .code
ld  r3, NUM2 (r0)
ld  r1, NUM1 (r0)
ld  r2, NUM1 (r0)
daddi r3, r3, -1

loop: dadd  r1, r1, r2
      daddi r3, r3, -1
      bnez  r3, loop

sd    r1, RESULTADO (r0)
halt
