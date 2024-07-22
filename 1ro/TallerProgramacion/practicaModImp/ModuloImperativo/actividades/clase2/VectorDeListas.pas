program VectorDeListas;
type
	empleado = record
		num: integer;
		apeNom: string;
		antiguedad: integer;
		categoria: 1..4;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: empleado;
		sig: lista;
	end;
	
	vector = array [1..4] of empleado;
	
procedure leer (var E: empleado);
begin
	writeln ();
	writeln ('ingrese el numero del empleado: ');
	readln (E.num);
	if (E.num <> 0) then
	begin
		writeln ('ingrese el apellido y nombre del empleado: ');
		readln (E.apeNom);
		writeln ('ingrese la antiguedad de empleado: ');
		readln (E.antiguedad);
		writeln ('ingrese la categoria del empleado: ');
		readln (E.categoria);
	end;
end;

procedure cargarL (var L: lista; E: empleado);
var
	nuevo, ant, act: lista;
begin
	leer (E);
	while (E.num <> 0) do
	begin
		new (nuevo);
		nuevo^.elem := E;
		act:= L;
		while (act <> nil) and (act^.elem.categoria < E.categoria) do
		begin
			ant:= act;
			act:= act^.sig;
		end;
		while (act <> nil) and (act^.elem.categoria = E.categoria) and (act^.elem.apeNom < E.apeNom) do
		begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = L) then
			L:= nuevo
		else
			ant^.sig:= nuevo;
		nuevo^.sig:= act;
		leer (E);
	end;
end;

procedure imprimirE (var E: empleado);
begin
	writeln ();
	writeln (E.num);
	writeln (E.apeNom);
	writeln (E.antiguedad);
	writeln (E.categoria);
end;

procedure imprimirXCategoria (L: lista);
var
	i: integer;
begin
	for i:= 1 to 4 do
	begin
		writeln ();
		writeln ('epleados de categoria ', i, ': ');
		while (L <> nil) and (L^.elem.categoria = i) do
		begin
			writeln (L^.elem.apeNom);
			L:= L^.sig;
		end;
	end;
end;

procedure cargarV (L: lista; var V: vector);
var
	i: integer;
begin
	for i:= 1 to 4 do
	begin
		V[i] := L^.elem;
		L:= L^.sig;
		while (L <> nil) and (L^.elem.categoria = i) do
		begin
			if (L^.elem.antiguedad > V[i].antiguedad) then
				V[i] := L^.elem;
			L:= L^.sig;
		end;
	end;
end;

procedure imprimirV (V: vector);
var
	i: integer;
begin
	for i:= 1 to 4 do
		imprimirE(V[i]);
end;

procedure ordenarV (V: vector);
var
	i, j: integer;
	actual: empleado;
begin
	for i:= 2 to 4 do
	begin
		actual := V[i];
		j:= i -1;
		while (j > 0) and (V[j].antiguedad < actual.antiguedad) do
		begin
			V[j + 1]:= V[j];
			j:= j - 1;
		end;
		V[j + 1]:= actual;
	end;
	
	for i:= 1 to 4 do
		imprimirE(V[i]);
end;

var
	E: empleado;
	L: lista;
	V: vector;
begin
	L:= nil;
	cargarL (L, E);
	imprimirXCategoria (L);
	cargarV (L, V);
	ordenarV (V);
end.
			
			
		
		
