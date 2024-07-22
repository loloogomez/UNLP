program ejercicio6;
const
	max = 2500;
type
	nombre = string[50];
	puntero = ^nombre;
	arrpunteros = array [1..max] of puntero;

procedure leer (var punteros: arrpunteros);
var
	i: integer;
begin
	for i:= 1 to max do
	begin
		new (punteros[i]);
		writeln ('nombre de la ciudad: ');
		readln (punteros[i]^);
	end;
end;

procedure escribir (punteros: arrpunteros);
var
	i: integer;
begin
	for i:= 1 to max do 
	begin
		writeln ();
		writeln (punteros[i]^);
	end;
end;
	
var
	punteros : arrpunteros;
begin
	
	leer (punteros);
	escribir (punteros);
end.
