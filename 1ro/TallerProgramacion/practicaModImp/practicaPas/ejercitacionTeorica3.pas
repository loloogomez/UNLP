program ejercitacionTeorica3;
type
	lista= ^nodo;
	
	nodo = record
		elem: integer;
		sig: lista;
	end;

procedure cargar (var L: lista);
var
	i, num: integer;
	nuevo: lista;
begin
	for i:= 1 to 7 do 
	begin
		writeln ('ingrese un numero entero: ');
		readln (num);
		new (nuevo);
		nuevo^.elem := num;
		nuevo^. sig:= L;
		L:= nuevo;
	end;
end;

procedure imprimir(L: lista);
begin
	writeln (L^.elem);
	if (L^.sig <> nil) then
	begin
		L:= L^.sig;
		imprimir (L);
	end;
end;

var
	L: lista;
begin
	L:= nil;
	cargar(L);
	writeln ();
	imprimir (L);
end.
