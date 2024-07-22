program ejercicio4;

var
	i: integer;
	num: integer;
	min: integer;
	segundomin: integer;
	
BEGIN
	write ('ingrese un numero: ');
	readln (num);
	min:= num;
	write ('ingrese un numero: ');
	readln (num);
	if (num > min) then
		segundomin:= num;
	for i:= 1 to 998 do
	begin
		write ('ingrese un numero: ');
		readln (num);
		if (num <= min)then
		begin
			segundomin:= min;
			min:= num;
		end;
		if ((num <= segundomin)and (num > min)) then
			segundomin:= num;
	end;
	writeln ('el minimio numero fue: ', min, ', y el segundo minimo fue: ', segundomin);
	
END.

