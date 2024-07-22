program PracticaFinal6;
type
	
	lista = ^nodo;
	
	nodo = record
		elem: integer;
		sig: lista;
	end;

procedure cargar (var L: lista);
var
	aux: lista;
	num: integer;
begin
	writeln ('ingrese numero: ');
	readln (num);
	while (num <> 0) do
	begin
		new (aux);
		aux^.elem := num;
		aux^. sig := L;
		L:= aux;
		writeln ('ingrese numero: ');
		readln (num);
	end;
end;

procedure moduloA (L: lista; var L2: lista);
var
	aux: lista;
	ant: integer;
	contador: integer;
	
begin
	contador := 0;
	ant:= L^.elem;
	while (L <> nil) do
	begin
		if (L^.elem = ant) then
		begin
			contador:= contador +1;
			L:= L^.sig;
		end
		else
		begin
			new (aux);
			aux^.elem:= contador;
			aux^.sig := L2;
			L2:= aux;
			ant:= L^.elem;
			contador:= 0;
		end;
	end;
	new (aux);
			aux^.elem:= contador;
			aux^.sig := L2;
			L2:= aux;
end;

procedure imprimir (L2: lista);
begin
	while (L2 <> nil) do
	begin
		writeln ();
		writeln (L2^.elem);
		L2:= L2^.sig;
	end;
end;

var
	L: lista;
	L2: lista;
begin
	L:= nil;
	L2:= nil;
	cargar (L);
	imprimir (L);
	moduloA (L,L2);
	imprimir (L2);
end.
