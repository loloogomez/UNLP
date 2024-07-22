program practicaFinal2;
type
	precios = array [1..3] of real;
	
	ventas = record
		CV: integer;
		CP: integer;
		cantidadV: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: ventas;
		sig: lista;
	end;
	
procedure cargarP (var P: precios);
var
	i: integer;
begin
	for i:= 1 to 3 do
	begin
		writeln ('ingrese el precio del producto ', i);
		readln (P[i]);
	end;
end;

procedure leerV (var V: ventas);
begin
	writeln ('ingrese el codio de venta: ');
	readln (V.CV);
	if (V.CV <> -1) then
	begin
		writeln ('ingrese el codio del producto: ');
		readln (V.CP);
		writeln ('ingrese la cantidad vendida: ');
		readln (V. cantidadV);
	end;
end;

procedure cargarL (var L: lista; V: ventas);
var
	aux: lista;
	nuevo: lista;
begin
	leerV (V);
	while (V.CV <> -1) do
	begin
		new (nuevo);
		nuevo^.elem := V;
		nuevo^.sig := nil;
		if (L <> nil) then
		begin
			aux := L;
			while (aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig:= nuevo;
		end
		else
			L:= nuevo;
		leerV(V);
	end;
end;

procedure montoRecaudado (L: lista; P: precios);
var
	act: integer;
	ant: lista;
	suma: real;
begin
	ant:= L;
	act:= L^.elem.CP;
	suma:= L^.elem.cantidadV * P[L^.elem.CP];
	L:= L^.sig;
	while (L <> nil) do
	begin
		if (act = L^.elem.CP) then
		begin
			suma:= suma + L^.elem.cantidadV * P[L^.elem.CP];
			L:= L^.sig;
			ant:= ant^.sig;
		end
		else
		begin
			writeln ('recaudacion del producto ', ant^.elem.CP, ': ', suma:1:2);
			suma:= 0;
			act:= L^.elem.CP;
		end;
	end;
	writeln ('recaudacion del producto ', ant^.elem.CP, ': ', suma:1:2);
end;

var
	L: lista;
	V: ventas;
	P: precios;
begin
	L:= nil;
	cargarP (P);
	cargarL (L, V);
	montoRecaudado(L, P);
end.
			
	
