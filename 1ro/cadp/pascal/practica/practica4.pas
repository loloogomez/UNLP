program practica4;
type
	lista = ^nodo;
	
	nodo = record
		nom: string;
		sig: lista;
	end;
	
procedure leer (var nom: string);
begin
	writeln ('nombre: ');
	readln (nom);
end;

procedure cargar (var L: lista; nom: string);
var
	aux: lista;
begin
	leer (nom);
	while (nom <> 'low') do
	begin
		new (aux);
		aux^.nom:= nom;
		aux^.sig:= L;
		L:= aux;
		leer (nom);
	end;
end;

procedure insertar (var L: lista; nom: string);
var
	ant, act, nue: lista;
begin
	leer (nom);
	new (nue);
	nue^.nom:= nom;
	act:= L;
	ant:= L;
	while (act <> nil) and (act^.nom < nom)do
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		L:= nue
	else
	begin
		ant^.sig:= nue;
		nue^.sig:= act;
	end;
end;

procedure imprimir (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^.nom);
		L:= L^.sig;
	end;
end;

var
	L: lista;
	nom: string;
	
begin
	L:= nil;
	cargar (L, nom);
	insertar (L, nom);
	imprimir (L);
end.
	
