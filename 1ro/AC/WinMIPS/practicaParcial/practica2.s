  .data
control:  .word32 0x10000
data: .word32 0x10008
cero: .ascii "0"
cadena: .asciiz ""

  .code
lwu $s0, control($0)
lwu $s1, data($0)

daddi $s2, $0, 9
daddi $s3, $0, 4
lbu $s5, cero($0)

daddi $t0, $0, 0        #contador
daddi $t1, $0, 0        #  desplazamiento
daddi $t3, $0, cadena   # direccion de cadena

loop: sd  $s2, 0($s0)
      lbu  $t2, 0($s1)
      nop
      beq  $t2, $s5, imprimir
      sb  $t2, cadena($t1)
      daddi $t0, $t0, 1
      daddi $t1, $t1, 1
      j    loop        # jump to loop
      nop

imprimir: sd $t3, 0($s1)
          sd $s3, 0($s0)

            daddi $t1, $t1, 2
            daddi $s4, $t1, cadena       #direccion de string inverso
            daddi $t0, $t0, -1
     loop2: lbu $t4, cadena($t0)
            sb  $t4, cadena($t1)
            beqz  $t0, fin
            daddi $t1, $t1, 1
            daddi $t0, $t0, -1
            nop
            j    loop2        # jump to loop2
            nop
      fin: sd $s4, 0($s1)
           sd $s3, 0($s0)

  halt
