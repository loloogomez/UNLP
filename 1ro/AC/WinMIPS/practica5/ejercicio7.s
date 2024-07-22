  .data
NUM:  .word   5
TABLA:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
RES:  .word   0

  .code
ld  $a0, NUM($0)
daddi $a1,$0, TABLA
daddi $a2,$0, 10
jal   subrutina
sd    $v0,  RES($0)

halt


subrutina: ld  $t0, 0($a1)
           beqz  $t0, fin
           daddi $a1, $a1, 8
           dsub  $t0, $t0, $a0
           daddi $a2, $a2, -1
           daddi $t0, $t0, -1
           andi  $t0, $t0, 0x8000
           beqz  $t0, sumar
           nop
           bnez  $a2, subrutina
           nop
           j     fin

sumar:     daddi $v0, $v0, 1
           bnez  $a2, subrutina
           nop

fin:       jr    $ra
