program PracticaFinal5;
type
	venta = record
		codigoV: integer;
		codigoP: 1..3;
		cantidadV: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: venta;
		sig: lista;
	end;
	
	precio = array [1..3]of real;
	
procedure leer (var V: venta);
begin
	writeln ('codigo de venta: ');
	readln (V.codigoV);
	if (V.codigoV <> -1) then
	begin	
		writeln ('codigo del producto: ');
		readln (V.codigoP);
		writeln ('cantidad de productos vendidos: ');
		readln (V.cantidadV);
	end;
end;

procedure cargarV (var L: lista; var V: venta);
var
	aux: lista;
begin
	leer (V);
	while (V.codigoV <> -1) do
	begin
		new (aux);
		aux^.elem := V;
		aux^.sig := L;
		L := aux;
		leer (V);
	end;
end;

procedure cargarP (var P: precio);
var
	i : integer;
begin
	for i:= 1 to 3 do
	begin
		writeln ('precio del producto ', i, ':');
		readln (P[i]);
	end;
end;

procedure moduloC (L: lista; P: precio);
var
	ant: integer;
	suma: real;
begin
	ant:= L^.elem.codigoP;
	suma:= 0;
	while (L <> nil) do 
	begin
		if (L^.elem.codigoP = ant) then
		begin
			suma:= suma + L^.elem.cantidadV;
			L:= L^.sig;
		end
		else
		begin
			suma := suma * P[ant];
			writeln ();
			writeln ('el producto ', ant, ' recaudo ', suma:2:1,' pesos.');
			ant:= L^.elem.codigoP;
			suma := 0;
		end;
	end;
	suma := suma * P[ant];
	writeln ();
	writeln ('el producto ', ant, ' recaudo ', suma:2:1,' pesos.');
end;

var
	P: precio;
	L: lista;
	V: venta;
begin
	L:= nil;
	cargarP (P);
	cargarV (L, V);
	moduloC (L, P);
end.
