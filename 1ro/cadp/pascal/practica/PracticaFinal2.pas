program PracticaFinal2;
type
	
	parto = record
		anio: integer;
		codigoMadre: integer;
		crias: integer;
	end;
	
	lista =^nodo;
	
	nodo = record
		elem: parto;
		sig: lista;
	end;
	
	madre = record
		anioNacimiento: integer;
		raza: string;
	end;
	
	madres = array [1..3] of madre;

procedure leer (var P: parto);
begin
	writeln ('codigo de madre: ');
	readln (P.codigoMadre);
	if (P.codigoMadre <> -1) then
	begin
		writeln ('anio del parto: ');
		readln (P.anio);
		writeln ('cantidad de crias: ');
		readln (P.crias);
	end;
end;

procedure cargar (var L:lista; var P: parto);
var
	aux: lista;
begin
	leer (P);
	while (P.codigoMadre <> -1) do
	begin
		new (aux);
		aux^.elem := P;
		aux^.sig:= L;
		L:= aux;
		leer (P);
	end;
end;

procedure moduloA (var M: madres);
var
	i: integer;
	codigoMadre: integer;
begin
	for i:= 1 to 3 do
	begin
		writeln ('codigo de la madre: ');
		readln (codigoMadre);
		writeln ('anio de nacimiento de la madre: ');
		readln (M[codigoMadre].anioNacimiento);
		writeln ('raza de la madre: ');
		readln (M[codigoMadre].raza);
	end;
end;

procedure moduloB (L: lista; M: madres; var L2: lista);
var
	codigoMadre: integer;
	aux: lista;
begin
	writeln ('codigo de madre a analizar: ');
	readln (codigoMadre);
	while (L <> nil) do
	begin
		if (L^.elem.codigoMadre = codigoMadre) and ((L^.elem.anio - M[codigoMadre].anioNacimiento) > 1) then
		begin
			new (aux);
			aux^.elem := L^.elem;
			aux^.sig:= L2;
			L2:= aux;
		end;
		L:= L^.sig;
	end;
end;

procedure moduloC (L2: lista);
var
	alMenos4 : integer;
begin
	alMenos4:= 0;
	while (L2 <> nil) do
	begin
		if (L2^.elem.crias >= 4)then
			alMenos4 := alMenos4 +1;
		L2:= L2^.sig;
	end;
	writeln ('la catidad de partos en los que nacieron 4 crias o mas fue: ',alMenos4);
end;

var
	L: lista;
	L2: lista;
	P: parto;
	M: madres;
begin
	L:= nil;
	L2:= nil;
	cargar (L,P);
	moduloA (M);
	moduloB (L,M,L2);
	moduloC (L2);
end.
		

