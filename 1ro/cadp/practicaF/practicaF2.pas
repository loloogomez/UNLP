program practicaFinal2;
type
	venta = record
		codigoV: integer;
		codigoP: integer;
		cantidadV: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: Venta;
		sig: lista;
	end;
	
	precios = array [1..5] of real;
	
procedure leer (var V: venta);
begin
	writeln ('ingrese codigo de venta: ');
	readln (V.codigoV);
	if (V.codigoV <> -1) then
	begin
		writeln ('ingrese codigo del producto: ');
		readln (V. codigoP);
		writeln ('ingrese la cantidad vendida: ');
		readln (V. cantidadV);
	end;
end;

procedure cargarL (var L: lista; V: venta);
var
	nuevo: lista;
	aux: lista;
begin
	leer (V);
	while (V.codigoV <> -1) do
	begin
		new (nuevo);
		nuevo^.elem := V;
		nuevo^. sig := nil;
		if (L <> nil) then
		begin
			aux:= L;
			while (aux^.sig <> nil) do
				aux:= aux^. sig;
			aux^.sig := nuevo;
		end
		else
			L:= nuevo;
		leer(V);
	end;
end;

procedure cargarP (var P: Precios);
var
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		writeln ('ingrese el precio del producto ', i, ': ');
		readln (P[i]);
	end;
end;

procedure montoTotal (P: precios; L: lista);
var
	ant: integer;
	total: real;
begin
	while (L<> nil) do
	begin
		total:= 0;
		ant:= L^.elem.codigoP;
		while  (L <> nil) and (L^.elem.codigoP = ant) do
		begin
			total:= total + L^.elem.cantidadV * P[L^.elem.codigoP];
			L:= L^.sig;
			if (L <> nil) and (L^.elem.codigoP <> ant) then
				writeln ('el producto ', ant, ' recaudo: ', total:1:2);
		end;
	end;
	writeln ('el producto ', ant, ' recaudo: ', total:1:2);
end;

var
	P: precios;
	L: lista;
	V: venta;
begin
	L := nil;
	cargarL(L, V);
	cargarP (P);
	montoTotal(P, L);
end.
