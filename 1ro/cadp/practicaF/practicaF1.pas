program practicaFinal1;
type
	venta = record
		numP: 1..5;
		cantidadV: integer;
		nombreP: string;
	end;
	
	precios = array [1..5] of real;
	
	vector = array [1..5] of venta;
	
procedure leer (var Ven: venta);
begin
	writeln ('ingrese el numero del producto');
	readln (Ven.numP);
	writeln ('ingrese la cantidad de unidades vendidas: ');
	readln (Ven. cantidadV);
	writeln ('ingrese el nombre del producto: ');
	readln (Ven.nombreP);
end;

procedure cargar (var V: vector; Ven: venta);
var 
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		leer (Ven);
		V[i]:= Ven;
	end;
end;

procedure cargarPrecios (var P: precios);
var
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		writeln ('ingrese el precio del priducto ', i, ': ');
		readln (P[i]);
	end;
end;

procedure minimo (V: vector; P: precios; var nombreMenor: string);
var
	i: integer;
	precioMenor: real;
begin
	precioMenor:= V[1].cantidadV * P[1];
	nombreMenor := V[1].nombreP;
	for i:= 2 to 5 do
	begin
		if (V[i].cantidadV * P[i] < precioMenor) then
		begin
			precioMenor := V[i].cantidadV * P[i];
			nombreMenor := V[i].nombreP;
		end;
	end;
end;

var
	V: vector;
	Ven: venta;
	P: precios;
	nombreMenor: string;
	
begin
	cargar (V, Ven);
	cargarPrecios (P);
	minimo (V, P, nombreMenor);
	writeln ('el producto que obtuvo menos ganacia fue el: ', nombreMenor);
end.
	
	
	
