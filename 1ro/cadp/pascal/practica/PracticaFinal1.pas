program PracticaFinal1;
type
	cria = array [1..10] of integer;
	
	fecha = record
		dia: 1..31;
		mes: 1..12;
		anio: integer;
	end;
	
	coneja = record
		codigo: integer;
		nacimiento: fecha;
		nombre: string;
		partos: integer;
		crias: cria;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: coneja;
		sig: lista;
	end;	
	
	coneja2 = record
		codigo: integer;
		nombre: string;
		anio: integer;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		elem: coneja2;
		sig: lista2;
	end;
	
procedure leer (var C: coneja);
var
	i: integer;
begin
	writeln ('codigo de la coneja: ');
	readln (C.codigo);
	if (C.codigo <> -1) then
	begin
		writeln ('fecha de nacimiento');
		writeln ('dia: ');
		readln (C.nacimiento.dia);
		writeln ('mes: ');
		readln (C.nacimiento.mes);
		writeln ('anio: ');
		readln (C.nacimiento.anio);
		writeln ('nombre: ');
		readln (C.nombre);
		writeln ('cantidad de partos: ');
		readln (C.partos);
		for i:= 1 to C.partos do
		begin
			writeln ('cantidad de crias en el parto numero ', i, ': ');
			readln (C.crias[i]);
		end;
	end;
end;

procedure cargar (var L: lista; var C: coneja);
var
	aux: lista;
begin
	leer (C);
	while (C.codigo <> -1 ) do
	begin
		new (aux);
		aux^.elem:= C;
		aux^.sig := L;
		L:= aux;
		leer (C);
	end;
end;

procedure moduloA (L: lista; var L2: lista2);
var
	aux: lista2;
	i: integer;
	promedio: integer;
begin
	while (L <> nil) do
	begin
		for i:= 1 to L^.elem. partos do
			promedio := promedio + L^.elem.crias[i];
		promedio := promedio div L^.elem.partos;
		if promedio > 5 then
		begin
			new (aux);
			aux^.elem. codigo := L^.elem. codigo;
			aux^.elem.nombre:= L^.elem.nombre;
			aux^.elem.anio := L^.elem.nacimiento.anio;
			aux^.sig:= L2;
			L2:= aux;
		end;
		promedio := 0;
		L:= L^.sig;
	end;
end;

procedure moduloB (L2: lista2);
begin
	while (L2 <> nil) do
	begin
		if (L2^.elem.codigo mod 2 = 0) and (L2^.elem.anio < 2016) then
			writeln (L2^.elem.nombre);
		L2 := L2^.sig;
	end;
end;	
		
function cantidadMax(L:lista; codigo: integer): integer;
var
	i: integer;
begin
	cantidadMax := -1;
	writeln ('codigo de coneja: ');
	readln (codigo);
	while (L <> nil) and (L^.elem.codigo <> codigo) do
		L:= L^.sig;
	if (L <> nil) then
		for i:= 1 to L^.elem.partos do
		begin
			if L^.elem.crias[i] > cantidadMax then
				cantidadMax := L^.elem.crias[i];
		end
	else
		cantidadMax := -1;
	writeln (cantidadMax);
end;

var
	L: lista;
	L2: lista2;
	C: coneja;
	codigo: integer;
begin
	L:= nil;
	L2 := nil;
	cargar (L, C);
	moduloA (L, L2);
	moduloB (L2);
	cantidadMax (L, codigo);
end.
			
	
		
		
