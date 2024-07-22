program parcial;
type
	parto = record
		codP: integer;
		anio: integer;
		codM: 1..5;
		cantC: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: parto;
		sig: lista;
	end;
	
	madre = record
		codM : 1..5;
		raza: string;
	end;
	
	vector = array [1..5] of madre;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		codP: integer;
		sig: lista2;
	end;
	
procedure leer (var P: parto);
begin
	writeln ('codigo del parto: ');
	readln (P.codP);
	if (P.codP <> 0) then
	begin
		writeln ('anio: ');
		readln (P.anio);
		writeln ('codigo de madre: ');
		readln (P.codM);
		writeln ('cantidad de crias: ');
		readln (P.cantC);
	end;
	writeln ();
end;

procedure cargar (var L: lista; var P: parto);
var
	aux: lista;
begin
	leer (P);
	while (P.codP <> 0) do
	begin
		new (aux);
		aux^.elem := P;
		aux^.sig := L;
		L:= aux;
		leer (P);
	end;
end;

procedure moduloA (var V:vector);
var
	i: integer;
	codMadre: 1..5;
	razaMadre: string;
begin
	for i:= 1 to 5 do
	begin
		writeln ('codigo de madre: ');
		readln (codMadre);
		writeln ('raza de la madre: ');
		readln (razaMadre);
		writeln ();
		V[codMadre].codM:= codMadre;
		V[codMadre].raza:= razaMadre;
	end;
end;

procedure moduloB (V: vector; L: lista; var L2: lista2);
var
	aux: lista2;
begin
	while (L^.elem.anio < 2000) do
	begin
		if (V[L^.elem.codM].raza = 'doberman') then
		begin
			new (aux);
			aux^.codP := L^.elem.codP;
			aux^.sig:= L2;
			L2:= aux;
		end;
		L:= L^.sig;
	end;
end;

procedure escribir (L2: lista2);
begin
	while (L2 <> nil) do
	begin
		writeln ();
		writeln (L2^.codP);
		L2 := L2^.sig;
	end;
end;

var
	L: lista;
	V: vector;
	P: parto;
	L2: lista2;
begin
	L:= nil;
	L2:= nil;
	
	cargar (L,P);
	moduloA (V);
	moduloB (V, L, L2);
	escribir (L2);
end.
