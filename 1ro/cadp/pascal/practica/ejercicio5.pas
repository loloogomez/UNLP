program ejercicio5;
type
	
	producto = record
		cod: integer;
		tipo: string;
		marca: string;
		fechaDeV: integer;
	end;
	
	lista= ^nodo;
	
	nodo = record
		prod: producto;
		sig: lista;
	end;
	
procedure leer (var P: producto);
begin
	writeln ('codigo: ');
	readln (P.cod);
	if (P.cod <> -1) do
	begin
		writeln ('tipo: ');
		readln (P.tipo);
		writeln ('marca: ');
		readln (P.marca);
		writeln ('fecha de vencimiento: ');
		readln (P.fechaDeV);
	end;
end;

procedure cargar (var L: lista; P: producto);
var
	aux: lista;
begin
	leer (P);
	while (P.cod <> -1) do
	begin
		new (aux);
		aux^.Prod := P;
		aux^.sig := L;
		L:= aux;
		leer (P);
	end;
end;

procedure recorrer (L: lista; var PV: integer; var MT: real)

