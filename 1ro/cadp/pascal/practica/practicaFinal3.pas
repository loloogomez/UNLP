program practicaFinal3;
type
	
	pelicula = record
		codigo: integer;
		titulo: string;
		codigoGen: 1..8;
		puntaje: real;
	end;
	
	lista= ^nodo;
	
	nodo = record
		elem: pelicula;
		sig: lista;
	end;
	
	critica = record
		dni: integer;
		apellido: string;
		nombre: string;
		codigo: integer;
		puntaje: real;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		elem: critica;
		sig: lista2;
	end;
	
procedure leer (var P: pelicula);
begin
	writeln ('codigo de la pelicula: ');
	readln (P.codigo);
	if (P.codigo <> -1) then
	begin
		writeln ('titulo de la pelicula: ');
		readln (P.titulo);
		writeln ('codigo de genero: ');
		readln (P.codigoGen);
		writeln ('puntaje de la critica: ');
		readln (P.puntaje);
	end;
end;

procedure cargar (var L: lista; var P: pelicula);
var 
	aux: lista;
begin
	leer (P);
	while (P.codigo <> -1) do
	begin
		new (aux);
		aux^.elem := P;
		aux^.sig := L;
		L:= aux;
		leer (P);
	end;
end;

procedure leer2 (var C: critica);
begin
	writeln ('codigo de la pelicula: ');
	readln (C.codigo);
	if (C.codigo <> -1) then
	begin	
		writeln ('dni: ');
		readln (C.dni);
		writeln ('apellido: ');
		readln (C.apellido);
		writeln ('nombre: ');
		readln (C.nombre);
		writeln ('puntaje: ');
		readln (C.puntaje);
	end;
end;

procedure moduloA (var C: critica; var L: lista; L2: lista2);
var
	aux: lista2;
	ant: integer;
	contador: integer;
	promedio: real;
	
begin
	leer2 (C);
	while (C.codigo <> -1) do
	begin
		new (aux);
		aux^.elem:= C;
		aux^sig := L2;
		L2 := aux;
	end;
	ant := L2^.elem.codigo;
	while (L2 <> nil) do
	begin
		if (L2^.elem.codigo := ant) then
			promedio := promedio + L2^.elem.puntaje
			contador := contador +1;
		else
		begin
			promedio := promedio / contador;
			while L^.elem.codigo <> L2^.elem.codigo do
				L := L^.sig;
			ant:= L2^.elem.codigo;
			L^.elem.puntaje := promedio;
			promedio := L2^.elem.puntaje;
			contador := 1;
		end;
	end;
end;

procedure moduloB (L: lista);
var
	i: integer;
	contador: integer;
	suma: real;
	maximo: real;
	codMaximo: integer;
begin
	for i:= 1 to 8 do
	begin
		while (L<> nil)do
		begin
			if (L^.elem.codigoGen := i)do
			begin
				suma:= suma + L^.elem.puntaje;
				contador:= contador +1;
			end
			L := L^.sig;
		end;
		suma:= suma / contador;
		if (suma > maximo) then
		begin
			maximo := suma;
			codMaximo := i;
		end;
	end;
	writeln ('el codigo de genero que mas puntaje obtuvo en promedio fue el : ', modMaximo);
end;

procedure moduloC (L2: lista2);
var
	igualPar: integer;
	par: integer;
	impar: integer
begin
	while (L2 <> nil) do
	begin
		if (L2^.elem.dni mod 2 = 0) then
			par:= par +1
		else
			impar := impar +1;
		end;
		if (par = impar) then
			igualPar := igualPar +1;
		L2:= L2^.sig;
	end;
	writeln ('el numero de criticos cuyo dni tiene igual cantidad de numeros pares que impares es: ', igualPar);
end;

procedure moduloD (L: lista);
var
	codigoEliminar: integer;
	ant: lista;
	sig: lista;
	act: lista;
	
		
