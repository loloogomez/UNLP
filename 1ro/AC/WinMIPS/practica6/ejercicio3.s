  .data
control:  .word32 0x10000
data: .word32 0x10008
RES: .word  0

  .code
lwu $s0, control($0)
lwu $s1, data($0)
daddi $s2, $0, 8

jal    ingreso        # jump to ingreso and save position to $ra
nop
dadd $t0, $v0, $0

jal    ingreso        # jump to ingreso and save position to $ra
nop
dadd  $t1, $v0, $0

jal    sumar        # jump to sumar and save position to $ra
nop

sd  $v0, RES($0)
halt

ingreso: sd $s2, 0($s0)   # LEER UN NUMERO
         ld $v0, 0($s1)     # PASAR NUMERO LEIDO A $v0
         jr    $ra          # jump to $ra
         nop

sumar: dadd $v0, $t0, $t1
       jr    $ra          # jump to $ra
