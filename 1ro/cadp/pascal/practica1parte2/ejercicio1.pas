program ejercicio1;

var
	num: integer;
	mayor5: integer;
	i: integer;
	suma: integer;
	

BEGIN
	for i:= 1 to 10 do
	begin
		write ('ingrese un numero: ');
		readln (num);
		suma:= suma + num;
		if (num > 5) then
			mayor5:= mayor5 + 1;
	end;
	writeln (suma);
	writeln (mayor5);
	
END.

