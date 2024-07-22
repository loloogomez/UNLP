  .data
control:  .word32 0x10000
data: .word32 0x10008
cero: .double 0
uno:  .double 1

  .code
lwu $s0, control($0)  # $S0 = CONTROL
lwu $s1, data($0)     # $S1 = DATA

daddi $s2, $0, 8      # $S2 = 8 = LEER NUMERO
daddi $s3, $0, 3      # $S3 = 3 = IMPRIME PUNTO FLOTANTE

l.d f3, uno($0)       # f3 = 1
l.d f4, cero($0)      # f4 = 0

sd  $s2, 0($s0)
l.d f1, 0($s1)

sd  $s2, 0($s0)
l.d f2, 0($s1)

jal    a_la_potencia        # jump to a_la_potencia and save position to $ra
nop

s.d f1, 0($s1)
sd  $s3, 0($s0)

halt

a_la_potencia: sub.d f2, f2, f3
               c.eq.d f2, f4
               bc1t salto
               nop
         loop: mul.d  f1, f1, f1
               sub.d  f2, f2, f3
               c.eq.d f2, f4
               bc1f loop
               nop
               jr    $ra          # jump to $ra
               nop

        salto: add.d f1, f4, f3
               jr    $ra          # jump to $ra
               nop
