program practicaFinal3;
type
	lista = ^nodo;
	
	nodo = record
		elem: string;
		sig: lista;
	end;

procedure cargarL (var L: lista);
var
	nom: string;
	aux: lista;
begin
	writeln ('ingrese un nombre: ');
	readln (nom);
	while (nom <> 'ZZZ') do
	begin
		new (aux);
		aux^.elem:= nom;
		if (L <> nil) then
		begin
			aux^.sig:= L;
			L:= aux;
		end
		else
		L:= aux;;
		writeln ('ingrese un nombre: ');
		readln (nom);
	end;
end;

procedure eliminar (var L: lista);
var
	nom: string;
	ant: lista;
	act: lista;
	sig: lista;
begin
	ant:= L;
	act:= L;
	writeln ('ingrese un nombre para eliminar: ');
	readln (nom);
	if (act^.elem = nom) then
		L:= act^.sig;
	act:= act^.sig;
	while (act <> nil) do
	begin
		if (act^.elem = nom) then
		begin	
			ant^.sig := act^.sig;
			act:= act^.sig;
		end
		else
			act:= act^.sig;
			ant:= ant^.sig;
		end;
end;

procedure imprimir (L: lista);
begin
	while (L <> nil) do
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
			
			
