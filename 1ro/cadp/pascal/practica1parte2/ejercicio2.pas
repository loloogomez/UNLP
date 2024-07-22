program ejercicio2;

var
	num: integer;
	mayornum: integer;
	i: integer;
	posicion: integer;

BEGIN
	for i:= 1 to 10 do
	begin
		write ('escribe un numero: ');
		readln (num);
		if (num > mayornum) then
		begin
			mayornum:= num;
			posicion:= i;
		end;
	end;
	writeln;
	writeln ('el mayor numero leido fue: ', mayornum, ', en la posicion: ', posicion);
	
END.

