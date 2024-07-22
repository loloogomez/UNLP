program practicaFinal4;
type
	numero = 1..300;

	venta = record
		num: numero;
		cant: integer;
		nombre: string;
	end;
	
	precios = array [1..300] of real;
	
	lista = ^nodo;
	
	nodo = record
		elem: venta;
		sig: lista;
	end;

procedure leer (var V: venta);
begin
	readln (V.num);
	if (V.num <> 300) then
	begin	
		readln (V.cant);
		readln (V.nombre);
	end;
end;

procedure cargar (var L: lista; var P:precios);
var
	V:venta;
	nuevo, ult: lista;
	i: integer;
begin
	leer(V);
	new (L);
	L := nil;
	while (V.num <> 300) do
	begin
		new(nuevo);
		nuevo^.elem := V;
		nuevo^.sig := nil;
		if (L = nil) then
			L := nuevo
		else
			ult^.sig := nuevo;
		ult := nuevo;
		leer(V);
	end;
	for i:= 1 to 3 do
		readln (P[i]);
		
end;


var
	L: lista;
	P: precios;
begin
	cargar(L, P);

end.
	
			
