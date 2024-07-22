program ejercicio5b;

procedure proceso(numA, numB : integer; var condicion : boolean);
begin
	if (numA * 2 = numB) then
		condicion := true
	else 
		condicion := false;
end;
var
	numA, numB, paresLeidos, dobles: integer;
	condicion: boolean;
begin
	numA := 999;
	numB := 999;
	while (numA <> 0) and (numB <> 0) do
	begin
		writeln ('ingrese el primer numero');
		read (numA);
		writeln ('ingrese el segundo numero');
		read (numB);
		proceso(numA, numB, condicion);
		if (condicion = true) then
		begin
			writeln ('el segundo numero es el doble del primero');
			writeln ();
			dobles := dobles +1;
		end
		else
			writeln ('el segundo numero no es el doble del primero');
		paresLeidos := paresLeidos + 1; 
	end;
	writeln ('la catidad de pares leidos fue: ', paresLeidos);
	writeln ('la cantidad de pares donde el segundo numero es el doble del primero fue: ', dobles);
end.
