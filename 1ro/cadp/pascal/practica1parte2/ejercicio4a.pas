program ejercicio4a;

var
	num: integer;
	min: integer;
	segundomin: integer;
	
BEGIN
	write ('ingrese un numero: ');
	readln (num);
	min:= num;
	if (not(num = 0)) then
	begin
		write ('ingrese un numero: ');
		readln (num);
		if (num > min) then
			segundomin:= num;
	end;
	if (not(num = 0)) then
	begin
		repeat
			write ('ingrese un numero: ');
			readln (num);
			if (num <= min)then
			begin
				segundomin:= min;
				min:= num;
			end;
			if ((num <= segundomin)and (num > min)) then
				segundomin:= num;
		until (num = 0);
	end;
	writeln ('el minimio numero fue: ', min, ', y el segundo minimo fue: ', segundomin);
	
END.
