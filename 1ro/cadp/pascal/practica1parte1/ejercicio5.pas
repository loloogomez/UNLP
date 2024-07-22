program ejercicio5;

var
	n1: real;
	n2:real;
	rep: integer;

BEGIN
	write ('ingrese el primer numero: ');
	readln (n1);
	while not(n2 = n1 * 2) and (rep < 10) do
		begin
			write ('ingrese el segundo numero: ');
			readln (n2);
			rep:= rep +1;	
		end;
			
END.

