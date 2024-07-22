  .data
coorX:  .byte 0
coorY:  .byte 0
color:  .byte 0, 0, 0, 0
control: .word32  0x10000
data: .word32 0x10008

  .code
ld  $s0, control($0)    # CONTROL = $S0
ld  $s1, data($0)       # DATA = $S1

daddi $s2, $0, 8        # $S2 = 8 = LEER NUMERO
daddi $s3, $0, 5        # $S3 = 5 = MODIFICA PIXEL
daddi $s4, $0, 7        # $S4 = 7 = LIMPIA PANTALLA GRAFICA

sd  $s4, 0($s0)

daddi $t0, $0, 0        # $T0 = DESPLAZAMIENTO
daddi $t2, $0, 4        # $t2 = contador

sd  $s2, 0($s0)
lbu $t1, 0($s1)
sb  $t1, coorX($0)
sd  $s2, 0($s0)
lbu  $t1, 0($s1)
sb  $t1, coorY($0)
loop: sd  $s2, 0($s0)
      lbu  $t1, 0($s1)
      sb  $t1, color($t0)
      daddi $t2, $t2, -1
      daddi $t0, $t0, 1
      bnez  $t2, loop
      nop

lbu  $t1, coorX($0)
sb  $t1, 5($s1)
lbu  $t1, coorY($0)
sb  $t1, 4($s1)
lwu $t1, color($0)
sw  $t1, 0($s1)

sd    $s3, 0($s0)

halt
