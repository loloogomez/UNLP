  .data
string: .asciiz "abcdefghijklmnopqrstuvwxyz"
vocal:  .asciiz  "aeiou"
RES:  .word  0

  .code
daddi $s0, $0, vocal
daddi $a0, $0, string
daddi $sp, $0, 0x400
jal    CONTAR_VOC
nop
sd    $v0, RES($0)
halt

CONTAR_VOC: daddi $sp, $sp, -8
            sd  $ra, 0($sp)
            lbu $a1, 0($a0)
            beqz  $a1, fin
            nop
            jal   ES_VOCAL
            nop
            daddi $a0, $a0, 1
            beqz  $v1, salto
            nop
            daddi $v0, $v0, 1
     salto: lbu $a1, 0($a0)
            beqz  $a1, fin
            nop
            j   ES_VOCAL
            nop

      fin:  ld  $ra, 0($sp)
            daddi $sp, $sp, -8
            jr  $ra


ES_VOCAL: dadd $t0, $0, $s0
    loop: lbu  $t1, 0($t0)
          nop
          beqz  $t1, no_es
          nop
          dsub  $t2, $t1, $a1
          beqz  $t2, es
          nop
          daddi $t0, $t0, 1
          j    loop
          nop

  no_es: dadd  $v1, $0, $0
         jr    $ra          # jump to
         nop

  es:    daddi  $v1, $0, 1
         jr    $ra          # jump to
         nop
