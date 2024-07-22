program punto3;
type
	producto = record
		cod: integer;
		codR: 1..8;
		precio: real;
	end;
	
	lista= ^nodo;
	
	nodo = record
		elem: producto;
		sig: lista;
	end;
	
	vector = array [1..30] of producto;
	
procedure leer (var P: producto);
begin
	writeln ('ingrese el codigo del producto: ');
	readln (P.cod);
	writeln ('ingrese el codigo de rubro (de 1 a 8): ');
	readln (P.codR);
	writeln ('ingresar el precio del prosucto: ');
	readln (P.precio);
end;

procedure cargar (var L: lista; P: producto);
var
	nuevo, act, siguiente: lista;
begin
	leer (P)
	while (P.precio <> 0) do
	begin
		new (nuevo);
		nuevo^.elem := P;
		act:= L;
		siguiente:= act^.sig;
		while (act^.elem.codR <> nuevo^.elem.codR) do
		begin	
			act:= act^.sig;
			siguiente:= siguiente^.sig;
		end;
		while (act^.elem.cod < nuevo^.elem.cod) and (act^.elem. codR = nuevo^.elem. codR) do
		begin	
			act:= act^.sig;
			siguiente:= siguiente^.sig;
		end;
		act^.sig:= nuevo;
		nuevo^.sig:= siguiente;
		leer (P);
	end;
end;

procedure imprimir (L: lista);
var
	i: integer;
begin
	for i:= 1 to 8 do
	begin
		writeln ('rubro', i);
		while (L^.elem.codR = i) do
		begin
			writeln (L^.elem. cod);
			L:= L^.sig;
		end;
	end;
end;

procedure guardar (L: lista; var V: vector; var dimL: integer);
var
	i: integer;
begin
	dimL := 0;
	while (L^.elem.codR <> 3) do
		L:= L^.sig;
	for i:= 1 to 30 do
	begin
		if (L^.elem.codR = 3) then
		begin
			dimL:= dimL + 1;
			V[i]:= L;
			L:= L^.sig;
		end;
	end;
end;

procedure ordenar (var V: vector; dimL: integer);
var
	i, j: integer
	aux: P;
begin
