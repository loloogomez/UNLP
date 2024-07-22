program practica1;
type
	lista= ^nodo;
	
	nodo= record
		elem: integer;
		sig: lista;
	end;

procedure leer (var L: lista);
var
	i: integer;
	aux: lista;
begin
	for i:= 1 to 7 do
	begin
		writeln ('escriba un numero: ');
		new (aux);
		readln (aux^.elem);
		aux^.sig := L;
		L:= aux;
	end;
end;

procedure imprimir (L: lista);
begin
	if (L <> nil) then
	begin	
		writeln (L^.elem);
		L:= L^.sig;
		imprimir (L);
	end;
end;

var
	L: lista;
begin
	leer (L);
	imprimir (L);
end.
	
	
