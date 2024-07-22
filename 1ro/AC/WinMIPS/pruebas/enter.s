.data
control:  .word32 0x10000
data: .word32 0x10008

.code
lwu $s0, control($0)    # CONTROL = $S0
lwu $s1, data($0)       # DATA = $S1

daddi $s2, $0, 9        # $S2 = 9 = LEER CHAR
daddi $s3, $0, 4        # $s3 = 4 = IMPRIMIR STRING

sd  $s2, 0($s0)
nop
ld  $t0, 0($s1)
nop
sd  $t0, 0($s1)
sd  $s3, 0($s0)

halt
