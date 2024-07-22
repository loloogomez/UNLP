program ejercitacionTeorica4;
type
	lista= ^nodo;
	
	nodo= record
		elem: integer;
		sig: lista
	end;
	
procedure cargar (var L: lista);
var
	nuevo, act: lista;
	num: integer;
begin
	writeln ('ingrese un numero entero: ');
	readln (num);
	while (num <> 0) do
	begin
		new (nuevo);
		nuevo^.elem := num;
		nuevo^.sig:= nil;
		if (L <> nil) then
		begin
			act:= L;
			while (act^.sig <> nil ) do
				act:= act^.sig;
			act^.sig:= nuevo;
		end
		else
			L:= nuevo;
		writeln ('igrese un numero entero: ');
		readln (num);
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
	cargar (L);
	writeln ();
	imprimir (L);
end.
	

