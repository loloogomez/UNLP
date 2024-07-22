program practica2;
type
	persona = record
		nombre: string;
		edad: integer;
	end;
	
	lista =^nodo;
	
	nodo = record
		elem: persona;
		sig: lista;
	end;
	
procedure leer (var P: persona);
begin
	writeln ('nombre: ');
	readln (P.nombre);
	writeln ('edad: ');
	readln (P.edad);
end;

procedure cargar (var L: lista; P: persona);
var
	act, nue: lista;
begin
	leer (P);
	while (P.edad <> 0) do
	begin
		new (nue);
		nue^.elem:= P;
		nue^.sig:= nil;
		if (L <> nil) then
		begin
			act:= L;
			while (act^.sig <> nil) do
				act:= act^.sig;
			act^.sig := nue;
		end
		else
			L:= nue;
		leer (P);
	end;
end;

procedure imprimir (L: lista);
begin
	while (L <> nil)do
	begin
		writeln ('nombre: ', L^.elem.nombre);
		writeln ('edad: ', L^.elem.edad);
		L:= L^.sig;
	end;
end;

var
	L: lista;
	P: persona;
begin
	L:= nil;
	cargar (L,P);
	imprimir (L);
end.
