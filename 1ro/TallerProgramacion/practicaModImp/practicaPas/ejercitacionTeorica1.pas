program ejercitacionTeorica1;
type
	lista= ^nodo;
	
	nodo= record
		elem: integer;
		sig: lista;
	end;
	
procedure modulo (var L:lista);
var
	act, nuevo: lista;
	r: integer;
begin
	randomize;
	r:= random (16);
	while (r <> 15) do 
	begin
		new (nuevo);
		nuevo^.elem:= r;
		nuevo^. sig:= nil;
		if (L <> nil) then
		begin
			act:= L;
			while (act^.sig <> nil) do
				act:= act^.sig;
			act^.sig:= nuevo;
		end
		else
			L:= nuevo;
		r:= random (16);
	end;
end;

procedure imprimir (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^. elem);
		L:= L^.sig;
	end;
end;

var
	L: lista;
begin
	modulo (L);
	imprimir (L);
end.
