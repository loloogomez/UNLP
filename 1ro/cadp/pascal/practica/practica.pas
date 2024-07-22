program practica;
type

	elemento = record
		codigo : integer;
		nombre : string;
		marca : string;
		precio : real;
		fechaDeVencimiento: integer;
	end;

	lista =^nodo;
	
	nodo = record
		elem: elemento;
		sig: lista;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		cod: integer;
		sig: lista2;
	end;
	
procedure leer (var E: elemento);
begin
	writeln ('codigo: ');
	readln (E.codigo);
	if (E.codigo <> -1) then
	begin
		writeln ('nombre: ');
		readln (E.nombre);
		writeln ('marca: ');
		readln (E.marca);
		writeln ('precio: ');
		readln (E.precio);
		writeln ('fecha de vencimiento: ');
		readln (E.fechaDeVencimiento);
	end;
end;

procedure cargar (var L: lista; E: elemento);
var
	aux: lista;
begin
	leer (E);
	while (E.codigo <> -1) do
	begin
		new (aux);
		aux^.elem:= E;
		aux^.sig := L;
		L:= aux;
		leer (E);
	end;
end;

procedure cargar2 (var L2: lista2; cod: integer);
var
	aux: lista2;
begin
	new (aux);
	aux^.cod:= cod;
	aux^.sig:= L2;
	L2:= aux;
end;

procedure sancor(L: lista; var L2 : lista2 );
begin
	while (L <> nil) do
	begin
		if (L^.elem.marca = 'SanCor') then
			cargar2 (L2,L^.elem.codigo);
		L:= L^.sig;
	end;
end;

procedure imprimir (L2: lista2);
begin
	while (L2 <> nil) do
	begin
		writeln (L2^.cod);
		L2:= L2^.sig;
	end;
end;

var
	L: lista;
	L2: lista2;
	E: elemento;
begin
	L:= nil;
	L2:= nil;
	cargar (L,E);
	sancor (L,L2);
	writeln ();
	imprimir (L2);
end.
