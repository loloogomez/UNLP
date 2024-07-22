program practicaFinal3;
type
	Lista = ^nodo;
	
	nodo = record
		elem: string;
		sig: lista;
	end;
	
procedure cargarL (var L: lista);
var
	nom: string;
	nuevo: lista;
begin
	writeln ('ingrese un nombre: ');
	readln (nom);
	while (nom <> 'zzz') do
	begin
		new (nuevo);
		nuevo^.elem := nom;
		nuevo^.sig:= L;
		L:= nuevo;
		writeln ('ingrese un nombre: ');
		readln (nom);
	end;
end;

procedure eliminar (var L: lista);
var
	nom: string;
	ant: lista;
	act: lista;
begin
	writeln ('ingrese el nombre a eliminar: ');
	readln (nom);
	act:= L;
	if (act^.elem = nom) then
			L:= act^.sig;
		ant:= act;
		act:= act^.sig;
	while (act <> nil) do
	begin
		if (act^.elem = nom) then
			ant^.sig := act^.sig;
		ant:= act;
		act:= act^.sig;
	end;
end;

procedure imprimir (L: lista);
begin
	while (L <> nil)do
	begin
		writeln (L^.elem);
		L:= L^.sig;
	end;
end;

var
	L: lista;
begin
	L:= nil;
	cargarL(L);
	eliminar (L);
	imprimir (L);
end.
