program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
procedure armarNodo(var PI, PU: lista; v: integer);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.num := V;
	nuevo^. sig:= nil;
	if (PI = nil) then
	begin
		PI:= nuevo;
		PU:= nuevo;
	end
	else
	begin
		PU^.sig:= nuevo;
		PU:= nuevo;
	end;
end;

procedure imprimir (L: lista; V: integer);
var
	aux: lista;
begin
	aux:= L;
	while (aux^.sig <> nil) do
	begin
		writeln (aux^.num);
		aux:= aux^.sig;
	end;
	writeln (aux^. num);
end;

var
	pri, UL : lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do 
	begin
		armarNodo(pri, UL, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
		
	imprimir (pri, valor);
end.
