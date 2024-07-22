program ejercicio8;
uses crt;
const
	N = 3;

procedure leer (var precio: real; var codigo: integer; var tipo: string);
begin
	writeln ('precio: ');
	readln (precio);
	writeln ('codigo: ');
	readln (codigo);
	writeln ('tipo: ');
	readln (tipo);
end;

procedure menores (P: real; var PM: real; var PM2: real; var C: integer; var CM: integer; var CM2: integer);
begin
	if (P < PM) then
	begin
		PM2 := PM;
		PM := P;
		CM := C;
	end
	else
	begin
		if (P < PM2) then
		begin
			PM2 := P;
			CM2 := C;
		end;
	end;
end;

procedure PantalonMasCaro (T: string; P: real; C: integer;  var CPMC: integer; var PPMC: real);
begin
	if (T = 'pantalon') then
	begin
		if (P > PPMC) then
		begin
			PPMC := P;
			CPMC := C;
		end;
	end;
end;

procedure escribir (CM: integer; CM2: integer; CPMC: integer; PP: real);
begin
	writeln ('los dos productos mas baratos son: ', CM, ' y ', CM2);
	writeln ('el pantalon mas caro es: ', CPMC);
	writeln ('el promedio de los precios es: ', PP:1:2, '$');
end;

var
	P, PM, PM2, PP, PPMC: real;
	i, C, CM, CM2, CPMC: integer;
	T: string;

begin
	PM := 32767;
	PM2 := 32767;
	PPMC := 1;
	for i:= 1 to N do
	begin
		leer (P, C, T);
		menores (P,PM, PM2, C, CM, CM2);
		PantalonMasCaro (T, P, C, CPMC, PPMC);
		PP := PP + P;
	end;
	PP := PP/N;
	escribir (CM, CM2, CPMC, PP);
end.


