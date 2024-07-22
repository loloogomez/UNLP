  .data
numeros:  .asciiz "012345"
cero: .byte   1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 2, 1, 2, 8, 3, 1, 3, 8, 4, 1, 4, 8, 5, 2, 5, 3, 5, 4, 5, 5, 5, 6, 5, 7, 0, 0, 0, 0, 0, 0
uno:  .byte   1, 6, 2, 7, 3, 1, 3, 2, 3, 3, 3, 4, 3, 5, 3, 6, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
dos:  .byte   1, 1, 1, 2, 1, 3, 1, 4, 1, 7, 2, 1, 2, 4, 2, 7, 3, 1, 3, 4, 3, 7, 4, 1, 4, 4, 4, 7, 5, 1, 5, 4, 5, 5, 5, 6, 5, 7, 0, 0, 0, 0
tres: .byte   1, 1, 1, 4, 1, 7, 2, 1, 2, 4, 2, 7, 3, 1, 3, 4, 3, 7, 4, 1, 4, 4, 4, 7, 5, 1, 5, 2, 5, 3, 5, 4, 5, 5, 5, 6, 5, 7, 0, 0, 0, 0
cuatro: .byte 1, 5, 1, 6, 1, 7, 1, 8, 2, 5, 3, 5, 4, 5, 5, 1, 5, 2, 5, 3, 5, 4, 5, 5, 5, 6, 5, 7, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
cinco:  .byte 1, 1, 1, 4, 1, 5, 1, 6, 1, 7, 2, 1, 2, 4, 2, 7, 3, 1, 3, 4, 3, 7, 4, 1, 4, 4, 4, 7, 5, 1, 5, 2, 5, 3, 5, 4, 5, 7, 0, 0, 0, 0
control:  .word32 0x10000
data: .word32 0x10008
color:  .byte 255, 255, 255, 255

  .code
lwu $s0, control($0)  # $S0 = CONTROL
lwu $s1, data ($0)    # $S1 = DATA

daddi $s2, $0, 9      # $s2 = 9 = leer un char
daddi $s3, $0, 7      # $s3 = 7 = limpia pantalla grafica
daddi $s4, $0, 5      # $s4 = 5 = cambia color de pixel
lwu   $s6, color($0)   # $s6 = color de pixel

sd  $s2, 0($s0)
ld  $s5, 0($s1)     # numero en $s5

daddi $t0, $0, 0      # $t0 = desplazamiento  / contador

loop: lbu $t1, numeros($t0)
      beq  $t1, $s5, salto
      nop
      daddi $t0, $t0, 1
      j    loop        # jump to loop
      nop

salto: daddi  $t1, $0, 0    # $t1 = desplazamiento 2
loop2: beqz   $t0, sig
       nop
       daddi  $t1, $t1, 48
       daddi  $t0 ,$t0, -1
       j    loop2        # jump to loop2
       nop

sig: ld     $s3, 0($s0)
imprimir: lbu $t0, cero($t1)    # $t0 = x
          beqz $t0, fin         # si es el ultimo pixel terminar
          nop
          sb $t0, 5($s1)        # se guarda X en data
          daddi $t1, $t1, 1
          lbu $t2, cero ($t1)   # $t2 = y
          sb  $t2, 4($s1)       # se guarda Y en data
          daddi $t1, $t1, 1
          sw  $s6, 0($s1)
          sd  $s4, 0($s0)
          j    imprimir        # jump to imprimir
          nop
fin:
halt
