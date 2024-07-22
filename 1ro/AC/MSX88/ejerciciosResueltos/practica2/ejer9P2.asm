ORG 1000H
clave db "hola"
correcto db "acceso permitido"
incorrecto db "acceso denegado"
ingresado db ?

ORG 2000H
mov BX, offset ingresado
mov CX, offset ingresado
mov AH, 4
loop: int 6
      dec AH
      inc CX
      mov BX, CX
      cmp AH, 0
      jnz loop

       mov cx, offset clave
       mov DX, offset ingresado
       mov BX, 4
       push BX
loop2: pop BX
       dec BX
       cmp BX, 0
       jz ES
       push BX
       mov BX, CX
       mov al, byte ptr [BX]
       mov BX, DX
       mov AH, byte ptr [BX]
       inc CX
       inc DX
       cmp AL, AH
       jz  loop2
       mov AL, offset ingresado - offset incorrecto
       mov BX, offset incorrecto
       int 7
       jmp fin


ES:    mov AL, offset incorrecto - offset correcto
       mov BX, offset correcto
       int 7

fin:   hlt
       end
