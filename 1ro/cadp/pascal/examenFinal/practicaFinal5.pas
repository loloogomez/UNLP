program practicaFinal5;
type
	venta = record
		CV: integer;
		CP: integer;
		CantidadV: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: venta;
		sig: lista;
	end;
	
procedure leer (var V: venta);
begin
	writeln ('ingrese codigo de venta: ');
	readln (V.CV);
	if (V.CV <> 999) then
	begin
		writeln ('ingrese el codigo del producto: ');
		readln (V.CP);
		writeln ('ingrese la cantidad vendida: ');
		readln (V.cantidadV);
	end;
end;

procedure cargarL (var L: lista; V: venta; var dimL: integer);
var
	nuevo, aux: lista;
begin
	dimL:= 0;
	leer (V);
	while (V.CV <> 999) do
	begin
		new (nuevo);
		nuevo^.elem := V;
		nuevo^.sig:= nil;
		dimL := dimL +1;
		if (L <> nil) then
		begin
			aux:= L;
			while (aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig := nuevo;
		end
		else
			L:= nuevo;
		leer (V);
	end;
end;

procedure ordenar (L: lista; var L2: lista; dimL: integer);
var
	i: integer;
	L
begin
	L2:= L;
	for i:= 1 to dimL -1 do
	begin
		
end;

procedure imprimir (L2: lista);
begin
	while (L2 <> nil) do
	begin
		writeln (L2^.elem.CP);
		writeln ();
	end;
end;

var
	L: lista;
	L2: lista;
	dimL: integer;
	V: venta;
begin
	L:= nil;
	L2:= nil;
	cargarL(L, V, dimL);	
	ordenar (L, L2, dimL);
	imprimir (L2);
end.	
