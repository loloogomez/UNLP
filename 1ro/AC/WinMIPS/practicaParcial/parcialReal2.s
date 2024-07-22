  .data
pos_x: .byte 24
pos_y: .byte 24
color_rojo:  .byte 255,0,0,0
color_azul:  .byte 0,0,255,0
control:  .word32 0x10000
data: .word32 0x10008

  .code
lwu $s6, control($0)
lwu $s7, data ($0)
lbu $s0, pos_y($0)
lbu $s1, pos_x($0)
lwu $s2, color_rojo($0)
lwu $s3, color_azul($0)

daddi $t0, $0, 0
daddi $t8, $0, 1

seguir: sb $s0, 4($s7)
        sb $s1, 5($s7)
        beqz  $t8, azul
        nop
        daddi $t4, $s2, 0
        j     salto
        nop
  azul: daddi $t4, $s3, 0
 salto: sw    $t4, 0($s7)
        xori  $t8, $t8, 1
        daddi $t1, $0, 5
        sd  $t1, 0($s6)
        daddi $s0, $s0, 1
        daddi $s1, $s1, 1
        daddi $t0, $t0, 1
        daddi $t9, $t0, -25
        bnez  $t9, seguir
        nop
        halt
