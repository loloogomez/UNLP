  .data
control:  .word32 0x10000
data: .word32 0x10008
nombres:  .asciiz "cero"
uno:  .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
cuatro: .asciiz "cuatro"
cinco: .asciiz "cinco"
seis: .asciiz "seis"
siete: .asciiz "siete"
ocho: .asciiz "ocho"
nueve: .asciiz "nueve"

  .code
lwu $s0, control($0)      #   CONTROL = $s0
lwu $s1, data($0)         # DATA = $s1

daddi $s2, $0, 8          # $s2 = 8 = LEER UN NUMERO
daddi $s3, $0, 4          # $s3 = 4 = IMPRIMIR UN string

jal    ingreso        # jump to ingreso and save position to $ra
nop

jal    muestra        # jump to muestra and save position to $ra
nop
  halt

ingreso: sd $s2, 0($s0)   # LEER UN NUMERO
         ld $v0, 0($s1)     # PASAR NUMERO LEIDO A $v0
         jr    $ra          # jump to $ra
         nop

muestra: dadd  $t2, $0, $v0
         daddi  $t0, $0, 0

   loop: beqz $t2, imprimir # se encuentra el nombre del numero
         nop
         daddi  $t0, $t0, 8
         daddi  $t2, $t2, -1
         j    loop        # jump to loop
         nop
imprimir: daddi $t1, $t0, nombres
          nop
          sd $t1, 0($s1)
          sd $s3, 0($s0)
          jr    $ra          # jump to $ra
          nop
