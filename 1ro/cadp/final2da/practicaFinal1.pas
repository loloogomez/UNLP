program practicaFinal;
type
	codPoliza= 1..6;

	cliente = record
		cod: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		poliza: codPoliza;
		cuota: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: cliente;
		sig: lista;
	end; 
		
procedure leer (var elem: cliente);
begin
	writeln ('codigo: ');
	readln(elem.cod);
	if (elem.cod <> 0) then
	begin
		writeln ('apellido: ');
		readln(elem.apellido);
	end;
end;

procedure cargar (var L: lista);
var
	elem: cliente;
	aux, ant : lista;
	nuevo : lista;
begin
	new(L);
	L:= nil;
	leer(elem);
	while (elem.cod <> 0) do
	begin
		new(nuevo);
		nuevo^.elem := elem;
		nuevo^.sig:= nil;
		if (L <> nil) then
		begin
			ant:= L;
			aux := L;
			while (aux <> nil) and (aux^.elem.apellido < elem.apellido) do
			begin
				ant := aux;
				aux := aux^.sig;
			end;
			if (ant = aux) then
			begin
				nuevo^.sig := L;
				L:= nuevo;
			end
			else
			begin
				ant^.sig := nuevo;
				nuevo^.sig:= aux;
			end;
		end
		else
			L:= nuevo;
		leer(elem);
	end;
end;

procedure recorrer (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^.elem.apellido);
		L:= L^.sig;
	end;
end;

var
	L: lista;
begin
	cargar(L);
	recorrer(L);
end.
