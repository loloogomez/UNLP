program ejercicio6a;

function parmasalto: integer;
	var 
		num: integer;
	begin
		parmasalto := 0;
		repeat
			write ('ingrese un numero: ');
			readln (num);
			if (num mod 2 = 0) and (num > parmasalto) then
				parmasalto := num;
		until (num < 0);
	end;
var
	par_mas_alto: integer;
BEGIN
	Par_mas_alto:= parmasalto;
	writeln ('el numero par mas alto es: ', par_mas_alto);
	
END.

