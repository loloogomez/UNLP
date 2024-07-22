program untitled;

var
	n1: integer;
	n2: integer;

BEGIN
	write ('ingrese el primer numero: ');
	readln (n1);
	write ('ingrese el segundo numero: ');
	readln (n2);
	if (n1 > n2) then
		writeln (n1);
	if (n1 < n2) then
		writeln (n2);
	if (n1 = n2) then
		writeln ('los numeros leidos son iguales');
	
END.

