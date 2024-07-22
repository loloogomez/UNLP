program practicaVidClas3Ejer2;
type
	gasto= record
		nombre: string;
		precio: real;
	end;
	
	lista = ^nodo;
	
	nodo= record
		elem: gasto;
		sig: lista;
	end;
	
	vector = array [1..4] of lista;
	
	arbol = ^nodo2;
	
	nodo2= record
		elem: gasto;
		hi: arbol;
		hd: arbol;
	end;

procedure agregarA (var L: lista; nom: string; prec: real);
var
	act, nuevo: lista;
begin
	new (nuevo);
	nuevo^.elem.nombre:=  nom;
	nuevo^.elem.precio:= prec;
	nuevo^.sig:= nil;
	if (L <> nil) then
	begin
		act:= L;
		while (act^.sig <> nil) do
			act:= act^.sig;
		act^.sig:= nuevo;
	end
	else
		L:= nuevo;
end;

procedure cargar (var V: vector);
var
	i: integer;
	nom: string;
	prec: real;
begin
	for i:= 1 to 4 do
	begin
		V[i]:= nil;
		writeln ('ingrese el nombre de un gasto de la persona ',i,':');
		readln (nom);
			if (nom <> 'zz') then
			begin
				writeln ('ingrese el precio del gasto: ');
				readln (prec);
			end;
		while (nom <> 'zz') do
		begin
			agregarA (V[i], nom, prec);
			writeln ('ingrese el nombre de un gasto de la persona ',i,':');
			readln (nom);
			if (nom <> 'zz') then
			begin
				writeln ('ingrese el precio del gasto: ');
				readln (prec);
			end;
		end;
		writeln ();
	end;
end;

procedure imprimir (V: vector);
var
	i: integer;
begin
	for i:= 1 to 4 do
	begin
		while (V[i] <> nil) do
		begin
			writeln ('persona ',i,':');
			writeln (V[i]^.elem.nombre);
			writeln (V[i]^.elem.precio:1:2);
			writeln ();
			V[i]:= V[i]^.sig;
		end;
	end;
end;

procedure minimo (var V: vector; var min: string; var Pmin: real);
var
	aux, i: integer;
begin
	min:= 'zz';
	aux:= -1;
	for i:= 1 to 4 do
	begin
		if (V[i] <> nil) and (V[i]^.elem.nombre <= min) then
		begin
			min:= V[i]^.elem.nombre;
			aux:= i;
		end;
	end;
	
	if (aux <> -1) then
	begin
		min:= V[aux]^.elem.nombre;
		Pmin:= V[aux]^.elem.precio;
		V[aux]:= V[aux]^.sig;
	end;
end;

procedure merge (V: vector; var L: lista);
var
	actual, min: string;
	total, Pmin: real;
begin
	L:= nil;
	minimo (V, min, Pmin);
	while (min <> 'zz') do
	begin
		actual:= min;
		total:= 0;
		while ((min <> 'zz') and (min = actual)) do
		begin
			total:= total + Pmin;
			minimo (V, min, Pmin);
		end;
		agregarA (L, actual, total);
	end;
end;

procedure crear (var ABB: arbol; G: gasto);
begin
	if (ABB = nil) then
	begin
		new (ABB);
		ABB^.elem:= G;
		ABB^.hi:= nil;
		ABB^.hd:= nil;
	end
	else
	begin
		if (G.precio < ABB^.elem. precio) then
			crear (ABB^.hi, G)
		else
			crear (ABB^.hd, G);
	end;
end;

procedure cargarABB (L: lista; var ABB: arbol);
var
	G: gasto;
begin
	ABB:= nil;
	while (L <> nil) do
	begin
		G:= L^.elem;
		crear (ABB, G);
		L:= L^.sig;
	end;
end;

procedure imprimirL (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^.elem.nombre);
		writeln (L^.elem.precio:1:2);
		writeln ();
		L:= L^.sig;
	end;
end;

procedure imprimirMenor (ABB: arbol);
begin
	while (ABB^.hi <> nil) do
		ABB:= ABB^.hi;
	writeln (ABB^.elem. nombre);
end;

var
	L: lista;
	V: vector;
	ABB: arbol;
begin
	cargar (V);
	imprimir (V);
	merge (V, L);
	imprimirL (L);
	cargarABB (L, ABB);
	imprimirMenor (ABB);
end.
