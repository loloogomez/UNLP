  .data
BASE: .double 5.85
ALT:  .double 13.47
SUP:  .word 0
VAL2: .double 2

  .code
l.d   f1, BASE(r0)
l.d   f2, ALT(r0)
l.d   f3, VAL2(r0)
mul.d f1, f1, f2
div.d f1, f1, f3
cvt.l.d f1, f1
s.d   f1, SUP(r0)
halt
