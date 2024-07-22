  .data
control:  .word32 0x10000
data: .word32 0x10008
mensaje1: .asciiz "ingrese el caracter a substituir en la cadena: "
mensaje2: .asciiz "ingrese el nuevo caracter para la cadena: "
mensaje3: .asciiz "cadena resultado: "
RESULTADO:  .word 0
cadena: .asciiz "abca"

  .code
lwu $s0, control($0)
lwu $s1, data($0)

daddi $s2, $0, 9    # lee caracter = 9
daddi $s3, $0, 4     # imprime un string = 4

daddi $t0, $0, mensaje1
daddi $t1, $0, mensaje2
daddi $t2, $0, mensaje3

sd  $t0, 0($s1)
sd  $s3, 0($s0)

sd  $s2, 0($s0)
lbu $a0, 0($s1)

sd  $t1, 0($s1)
sd  $s3, 0($s0)

sd  $s2, 0($s0)
lbu $a1, 0($s1)

daddi $s4, $0, cadena

jal    SUBSTITUIR        # jump to SUBSTITUIR and save position to $ra
nop

sd  $v0, RESULTADO($0)

sd  $t2, 0($s1)
sd  $s3, 0($s0)

sd  $s4, 0($s1)
sd  $s3, 0($s0)

  halt

SUBSTITUIR: daddi $t3, $0, 0    # desplazamiento
      loop: lbu  $t4,  cadena($t3)
            beqz  $t4, fin
            nop
            bne   $t4, $a0, no_es
            nop
            daddi $v0, $v0, 1
            sb $a1, cadena($t3)
            daddi $t3, $t3, 1
            j    loop        # jump to loop
            nop
    no_es: daddi  $t3, $t3, 1
            j    loop        # jump to loop
            nop
      fin: jr    $ra          # jump to $ra
           nop
