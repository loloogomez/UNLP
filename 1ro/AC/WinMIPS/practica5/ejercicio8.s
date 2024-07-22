  .data
STR1: .asciiz "abcdef"
STR2: .asciiz "abcdef"
POS:  .word   0

  .code
daddi $a0, $r0, STR1
daddi $a1, $r0, STR2
jal   subrutina
nop
sd    $v0, POS($0)
halt

subrutina: daddi  $v0, $0, 0
     loop: lbu    $t0, 0($a0)
           beqz   $t0, iguales
           nop
           lbu    $t1, 0($a1)
           daddi  $a0, $a0, 1
           daddi  $a1, $a1, 1
           daddi  $v0, $v0, 1
           dsub   $t0, $t0, $t1
           beqz   $t0, loop
           nop
           jr     $ra
           nop

  iguales: daddi  $v0, $0, -1
           jr     $ra
