program ejercicio6;

var
	i: integer;
	cod: 1.. 200;
	precio: real;
	masbajo: real;
	segundobajo: real;
	menorcod: 1.. 200;
	segundocod: 1.. 200;
	mas16par: integer;

BEGIN
	masbajo:= 32767;
	segundobajo:= 32767;
	for i:= 1 to 5 do
	begin
		write ('ingrese el codigo del producto: ');
		readln (cod);
		write ('ingrese el precio del producto: ');
		readln (precio);
		writeln;
		if (precio < masbajo) then
		begin
			masbajo:= segundobajo;
			masbajo:= precio;
			segundocod:= menorcod;
			menorcod:= cod;
		end;
		if ((precio < segundobajo) and (precio > masbajo)) then
		begin
			segundobajo:= precio;
			segundocod:= cod;
		end;
		if ((precio > 16) and (cod mod 2 = 0)) then
			mas16par:= mas16par + 1;
	end;
	writeln ('el codigo del producto mas barato es: ', menorcod);
	writeln ('el codigo del segundo producto mas barato es: ', segundocod);
	writeln ('la cantidad de productos de mas de 16 pesos con codigo par son: ', mas16par);
	
END.

