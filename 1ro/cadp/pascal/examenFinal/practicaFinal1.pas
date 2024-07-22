program programaFinal1;
type
	venta= record
		producto: -1..5;
		cantidadV: integer;
		nombreP: string;
	end;
	
	precio= array [1..5] of real;
	
	lista= ^vector;
	
	vector= record
		elem: venta;
		sig: lista;
	end;
	
procedure cargarP (var P: precio);
var
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		writeln ('inrese el precio del producto: ');
		readln (P[i]);
	end;
end;

procedure leerV (var V: venta);
begin
	writeln ('ingrese el numero del producto: ');
	readln (V.producto);
	if (V.producto <> -1) then
	begin
		writeln ('ingrese la cantidad vendida: ');
		readln (V.cantidadV);
		writeln ('ingrese el nombre del producto: ');
		readln (V.nombreP);
	end;
end;

procedure cargarL (V: venta; var L: lista);
var
	aux: lista;
	act: lista;
begin
	leerV (V);
	while (V.producto <> -1) do
	begin
		new (aux);
		aux^.elem:= V;
		aux^.sig:= nil;
		if (L <> nil) then
		begin
			act:= L;
			while (act^.sig <> nil) do
				act:= act^.sig;
			act^.sig := aux;
		end
		else
			L:= aux;
		leerV (V);
	end;
end;

procedure menorG (L: lista; P: precio);
var
	ant: lista;
	act: integer;
	productoNom: string;
	productoPre: real;
	suma: real;
begin
	productoPre := 9999;
	new (ant);
	ant:= L;
	act:= L^.elem.producto;
	suma:= L^.elem.cantidadV * P[L^.elem.producto];
	L:= L^.sig; 
	while (L <> nil) do
	begin
		if (act = L^.elem.producto) then
		begin
			suma:= suma + L^.elem.cantidadV * P[L^.elem.producto];
			L:= L^.sig;
			ant:= ant^.sig;
		end
		else
		begin
			if (suma < productoPre)then
			begin
				productoPre:= suma;
				productoNom:= ant^.elem.nombreP;
			end;
			suma:= 0;
			L:= L^.sig;
			ant:= ant^.sig;
		end;
	end;
	writeln ('el producto que genero menos ganancias: ', productoNom);
end;

var
	L: lista;
	P: precio;
	V: venta;
begin
	L:= nil;
	cargarP(P);
	cargarL (V, L);
	menorG (L, P);
end.
		
