program ejercicio5;

var
	num: integer;
	maximonum: integer;
	minimonum: integer;
	suma: integer;

BEGIN
	write ('ingresar numero: ');
	readln (num);
	suma:= num;
	minimonum:= num;
	maximonum:= num;
	if (not(num = 100)) then
	begin
		repeat
			write ('ingresar numero: ');
			readln (num);
			suma:= suma + num;
			if (num < minimonum) then
				minimonum:= num;
			if (num > maximonum) then
				maximonum:= num
		until (num = 100);
	end;
	writeln ('el maximo numero leido fue: ', maximonum);
	writeln ('el minimo numero leido fue: ', minimonum);
	writeln ('la suma de los numeros da como resultado: ', suma);
	
END.

