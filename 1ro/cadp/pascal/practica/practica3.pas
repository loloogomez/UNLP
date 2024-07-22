program ejercicio3;
type
	lista= ^nodo;
	
	nodo = record
		nombre: string;
		sig: lista;
	end;
	
procedure leer (var nom: string);
begin
	writeln ('nombre: ');
	readln (nom);
end;

procedure cargar (var L: lista; nombre: string);
var
	aux: lista;
begin
	leer (nombre);
	while (nombre <> 'low') do
	begin
		new (aux);
		aux^.nombre:= nombre;
		aux^.sig:= L;
		L:= aux;
		leer (nombre);
	end;
end;

procedure borrar (var L: lista; nom: string);
var
	actual, ant: lista;
begin
	writeln ('nombre a eliminar: ');
	readln (nom);
	actual:= L;
	while (actual <> nil) and (actual^.nombre <> nom) do
	begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then
		if (actual = L) then
		begin
			L:= L^.sig;
			dispose (actual);
		end
		else
		begin
			ant^.sig:= actual^.sig;
			dispose (actual);
			writeln ('ha sido eliminado');
		end;
end;

var
	L: lista;
	nom, nombre: string;
begin
	cargar (L, nombre);
	borrar (L, nom);
end.
	
	

