program ejercicio5;

procedure proceso(numA, numB : integer; var condicion : boolean);
begin
	if (numA * 2 = numB) then
		condicion := true
	else 
		condicion := false;
end;
var
	numA, numB : integer;
	condicion: boolean;
begin
	writeln ('ingrese el primer numero');
	read (numA);
	writeln ('ingrese el segundo numero');
	read (numB);
	proceso(numA, numB, condicion);
	if (condicion = true) then
		writeln ('el segundo numero es el doble del primero')
	else
		writeln ('el segundo numero no es el doble del primero');
end.
