          org    40
          dw     3000h

          org    3000h
          push   ax
          mov    al, [bx]
          out    40h, al
          inc    bx
          dec    cl
          jnz    final
          mov    al, 0ffh
          out    21, al
final:    mov    al, 20h
          out    20h, al
          pop    ax
          iret

          org    1000h
palabra   db     "pibe chorro"
fin       db     ?

          org    2000h
          mov    bx, offset palabra
          mov    cl, offset fin - offset palabra
          cli
          mov    al, 0fbh
          out    21h, al
          mov    al, 10
          out    26h, al
          mov    al, 80h
          out    41h, al
          sti
bucle:    cmp    cl, 0
          jnz    bucle
          in     al, 41h
          and    al, 7fh
          out    41h, al
          hlt
end
