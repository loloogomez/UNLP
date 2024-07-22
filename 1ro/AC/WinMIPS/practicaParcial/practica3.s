.data
control:  .word32 0x10000
data: .word32 0x10008
incorrecto: .asciiz "Debe Ingresar un numero"
mensaje: .asciiz "cantidad de numeros 3 ingresados: "
RESULTADO:  .word 0
NUMEROS:  .word 0

.code
lwu $s0, control($0)  # control = $s0
lwu $s1, data($0)     # data  = $s1

daddi $s2, $0, 8      # $s2 = 8 = leer numero
daddi $s3, $0, 1      # $s3 = 1 = imprimir numero
daddi $s4, $0, 4      # $s4 = 4 = imprimir string
daddi $s5, $0, incorrecto # $s5 = dir de incorrecto

daddi $t1, $0, 0      # $t1 = desplazamiento
daddi $t2, $0, 0      # $t2 = suma
daddi $a0, $0, 0      # $a0 = contador

loop:
    jal    INGRESAR_NUMERO        # jump to INGRESAR_NUMERO and save position to $ra
    nop
    sd  $v0, NUMEROS($t1)
    daddi $a0, $a0, 1              # aumenta contador
    dadd $t2, $t2, $v0            # suma mas $v0
    daddi $t1, $t1, 8             # desplazamiento + 8
    slti   $t3, $t2, 22
    bnez  $t3, loop
    nop

daddi $a1, $0,  mensaje

jal    PROCESAR_NUMEROS        # jump to PROCESAR_NUMEROS and save position to $ra
nop

halt

INGRESAR_NUMERO:  daddi $t0, $0, 9      # $t0 comparador del 1 al 9
                sd  $s2, 0($s0)
                ld  $v0, 0($s1)
                nop
        loop2: beq $v0, $t0, es
                nop
                daddi $t0, $t0, -1
                bnez  $t0, loop2        # jump to loop
                nop
                sd  $s5, 0($s1)        # cargo direccion de string en data
                sd  $s4, 0($s0)        # cargo 4 para imprimir string en control
                daddi $v0, $0, 0
                jr    $ra          # jump to $ra
                nop

          es:   sd  $v0, 0($s1)       # cargo numero a imprimir en data
                sd  $s3, 0($s0)       # cargo instruccion para imprimir numero en control
                jr    $ra          # jump to $ra
                nop

PROCESAR_NUMEROS: daddi $t0, $0, 0        # $t0 = desplazamiento
                daddi $v0, $0, 0       # cantidad de numeros 3 = $v0
       repetir: beqz  $a0, fin          # cuando el contador llegue a 0 terminar
                ld  $t1, NUMEROS($t0)   # $t1 = numero de la tabla
                daddi $t0, $t0, 8
                daddi $a0, $a0, -1      # se le resta 1 al contador
                daddi $t2, $0, 3
                bne  $t2, $t1, repetir
                nop
                daddi $v0, $v0, 1       # $v0 = cantidad de numeros 3 +1
                j    repetir        # jump to repetir
                nop
          fin:  sd  $v0, RESULTADO($0)
                sd  $a1, 0($s1)
                sd  $s4, 0($s0)
                sd  $v0, 0($s1)
                sd  $s3, 0($s0)
                jr    $ra          # jump to $ra
                nop
