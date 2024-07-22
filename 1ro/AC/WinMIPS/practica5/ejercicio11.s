  .data
NUMEROS:  .word 1,2,3,4,5,6,7,8,9,10, 11, 0
RES:  .word 0

  .code
daddi  $sp, $0, 0x400
daddi  $a0, $0, 0  # $a0 = desplazamiento
jal    SUBRUTINA        # jump to SUBRUTINA and save position to $ra
nop
sd  $v0, RES($0)
  halt

SUBRUTINA: daddi  $sp, $sp, -8     # push $ra
           sd     $ra, 0($sp)
           ld $t0, NUMEROS($a0)
           beqz   $t0, fin
           nop
           jal     es_impar        # jump to es_impar and save position to $ra
           nop
           beqz    $v1, salto
           nop
           daddi   $v0, $v0, 1
    salto: daddi   $a0, $a0, 8
           ld      $t0, NUMEROS($a0)
           beqz    $t0, fin
           nop
           j       es_impar        # jump to es_impar
           nop

    fin:   ld     $ra, 0($sp)   #pop $ra
           daddi  $sp, $sp, 8
           jr    $ra          # jump to $ra
           nop

es_impar:  andi $t1, $t0, 0x1
           beqz $t1, par
           nop
           daddi  $v1, $0, 1
           jr    $ra          # jump to $ra
           nop
      par: daddi  $v1, $0, 0
           jr    $ra          # jump to $ra
           nop
