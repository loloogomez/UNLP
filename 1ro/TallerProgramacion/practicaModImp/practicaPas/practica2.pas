program practica2;
type
	lista= ^nodo;
	
	nodo= record
		elem: integer;
		sig: lista;
	end;
	
procedure leer (var L: lista);
var
	aux: lista;
begin
	writeln ('ingrese un numero: ');
	new (aux);
	readln (aux^.elem);
	aux^.sig:= L;
	L:= aux;
	while (L^.elem <> 0) do
	begin
		new (aux);
		readln (aux^.elem);
		aux^.sig:= L;
		L:= aux;
	end;
end;

procedure imprimir (L: lista);
var

var
	L: lista;
begin
	leer (L);
	imprimir (L);
end. 
		
		
	

