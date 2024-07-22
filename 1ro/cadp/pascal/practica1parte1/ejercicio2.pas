program ejercicio2;

var
	n: real;
	va: real;

BEGIN
	write ('ingrese el numero: ');
	readln (n);
	if (n < 0) then
		va:= n * -1
	else 
		va:= n;
	writeln ('el valor absoluto de ', n:1:2, ' es ', va:1:2);
	
END.

