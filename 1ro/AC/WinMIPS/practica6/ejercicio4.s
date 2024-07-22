  .data
control:  .word32 0x10000
data: .word32 0x10008
clave: .asciiz  "123"
bien: .asciiz "Bienvenido"
mal:  .asciiz "ERROR"
enter:  .word 0x0d
ingresado:  .asciiz ""

  .code
lwu $s0, control($0)    # CONTROL = $S0
lwu $s1, data($0)       # DATA = $S1
daddi $s2, $0, 9        # $S2 = 9 = LEER CHAR
daddi $s3, $0, 4        # $s3 = 4 = IMPRIMIR STRING
ld  $s4,  enter($0)     # $s4 = ENTER sino 13

inicio: daddi $t0, $0, 0        # $T0 = DESPLAZAMIENTO
      jal    char        # jump to char and save position to $ra
loop: nop
      beq   $v0, $s4, fin
      nop
      sb  $v0, ingresado($t0)
      daddi $t0, $t0, 1
      j     char        # jump to loop
      nop
fin:

       daddi  $a1, $0, bien   # direccion de Bienvenido = $a1
       daddi  $a2, $0, mal    # dirreccion de ERROR = $a2

       daddi $t0, $0, 0
loop2: ld $t1, clave($t0)
       ld $t2, ingresado($t0)
       bne $t1, $t2, no_es
       nop
       daddi  $t0, $t0, 1
       bnez   $t1, loop2
       nop
       daddi  $a0, $0, 1
       j    respuesta        # jump to respuesta and save position to $ra
       nop
no_es: daddi  $a0, $0, 0
       j    respuesta        # jump to respuesta and save position to $ra
       nop
end:
halt

char: sd  $s2, 0($s0)
      ld  $v0, 0($s1)
      j   loop       # jump to loop
      nop

respuesta:  beqz  $a0, incorrecta
            nop
            sd  $a1, 0($s1)
            sd $s3, 0($s0)
            j    end        # jump to end
            nop

incorrecta: sd  $a2, 0($s1)
            sd $s3, 0($s0)
            j    inicio        # jump to inicio
            nop
