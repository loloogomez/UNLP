  .data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cero: .asciiz "0"
texto: .asciiz ""

  .text
lwu $s0, DATA($0)        # $s0 = dirección de DATA
lwu $s1, CONTROL($0)     # $s1 = dirección de CONTROL

daddi $s2, $0, 9         #  $s2 = 9 leer un caracter
daddi $s4, $0, 4         #  $s4 = 4 función 4: salida de una cadena ASCIIZ
lbu   $s5, cero($0)         # $s5 = 0
daddi  $s3, $0, texto                # guardo direccion de texto en registro

      dadd  $t0, $0, $0          # desplazamiento $t0
loop: sd    $s2, 0($s1)          #  cargar $s2 9 = leer caracter en control
      lbu   $t1, 0($s0)          # cargar en $t1, el caracter desde data
      nop
      beq   $t1, $s5, fin
      nop
      sb    $t1, texto ($t0)     # guardo el caracter en texto
      daddi $t0, $t0, 1          # incrementar desplazamiento 1 byte
      j     loop                 #siguiente caracter
      nop

fin: sd  $s3, 0($s0)                    #guardo direccion de texto en data

sd $s4, 0($s1)              # CONTROL recibe 4 y produce la salida del mensaje
halt
