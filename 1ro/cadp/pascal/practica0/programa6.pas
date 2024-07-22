program programa6;

var
	md: real;
	vd: real;
	vp: real;
	c: real;
	total: real;
	
BEGIN
	write ('monto en dolares: ');
	readln (md);
	write ('valor del dolar: ');
	readln (vd);
	write ('comision: ');
	readln (c);
	vp:= md * vd;
	c:= vp / 100 * c;
	total:= vp + c;
	writeln ('la transaccion sera de ', total:1:2, ' pesos argentinos');
	
END.

