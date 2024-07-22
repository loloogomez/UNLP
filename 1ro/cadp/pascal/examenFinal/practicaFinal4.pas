program practicaFinal4;
type

	lista = ^nodo;
	
	nodo = record
		elem: integer;
		sig: lista;
	end;
	
	numeroYRep = record
		num: integer;
		rep: integer;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		elem: numeroYRep;
		sig: lista2;
	end; 
	
procedure cargarL (var L: lista);
var
	aux, nuevo: lista;
	num: integer;
begin
	writeln ('ingrese un numero: ');
	readln (num);
	while (num <> -1) do
	begin
		new (nuevo);
		nuevo^.elem := num;
		nuevo^.sig:= nil;
		if (L <> nil) then
		begin
			aux := L;
			while (aux^.sig <> nil)do
				aux:= aux^.sig;
			aux^.sig := nuevo;
		end
		else
			L:= nuevo;
		writeln ('ingrese un numero: ');
		readln (num);
	end;
end;

procedure moduloF (L: lista; var L2: lista2);
var
	ant: lista;
	act: integer;
	nuevo, aux: lista2;
	suma: integer;
begin
	ant:= L;
	act:= L^.elem;
	suma:= 1;
	L:= L^.sig;
	while (L <> nil) do
	begin
		if (L^.elem = act) then
		begin
			suma:= suma + 1;
			ant:= ant^.sig;
			L:= L^.sig;
		end
		else
		begin
			new (nuevo);
			nuevo^.elem.num:= ant^.elem;
			nuevo^.elem.rep:= suma;
			nuevo^.sig:= nil;
			if (L2 <> nil) then
			begin
				aux:= L2;
				while (aux^.sig <> nil) do
					aux:= aux^.sig;
				aux^.sig:= nuevo;
			end
			else
				L2:= nuevo;
			suma:= 0;
			act:= L^.elem;
		end;
	end;
	new (nuevo);
			nuevo^.elem.num:= ant^.elem;
			nuevo^.elem.rep:= suma;
			nuevo^.sig:= nil;
			if (L2 <> nil) then
			begin
				aux:= L2;
				while (aux^.sig <> nil) do
					aux:= aux^.sig;
				aux^.sig:= nuevo;
			end
			else
				L2:= nuevo;
end;

procedure imprimir (L2: lista2);
begin
	while (L2 <> nil) do
	begin
		writeln (L2^.elem.num);
		writeln (L2^.elem.rep);
		writeln ();
		L2:= L2^.sig;
	end;
end;

var 
	L: lista;
	L2: lista2;
begin
	L:= nil;
	L2:= nil;
	cargarL(L);
	moduloF (L, L2);
	imprimir (L2);
end.

