program ejercicio1;
type
	
	vector = array [1..5]of integer;
	
	elem = record
		dni: longInt;
		nombre: string;
		edad: integer;
		cod_gen: vector;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elemento: elem;
		sig : lista;
	end;

procedure leer (var E: elem);
var
	cod: integer;
begin
	writeln ('dni: ');
	readln (E.dni);
	writeln ('nombre y apellido: ');
	readln (E.nombre);
	writeln ('edad: ');
	readln (E.edad);
	writeln('codigo de genero: ');
	readln (cod);
	E.cod_gen[cod]:= E.cod_gen[cod] +1;
end;

procedure ParesImpares (E: elem; var masPQI: integer);
var
	par, impar: integer;
begin
	while (E.dni div 10  <> 0)do
	begin
		if (E.dni mod 2 = 0) then
			par:= par + 1
		else
			impar:= impar +1;
		E.dni:= E.dni div 10;
	end;
	if(par > 4) then
		masPQI:= masPQI +1;
	par:= 0;
	impar:= 0;
end;

procedure cargar (var L: lista; var E:elem; var masPQI : integer);
var
	aux: lista;
	fin: longInt;
begin
	fin:= 33555444;
	leer (E);
	paresImpares (E, masPQI);
	new (aux);
	aux^.elemento := E;
	aux^.sig:= L;
	L:= aux;
	while (E.dni <> fin) do
	begin
		leer (E);
		paresImpares (E, masPQI);
		new (aux);
		aux^.elemento := E;
		aux^.sig:= L;
		L:= aux;
	end;
end;


procedure genMasE (E: elem; max, max2: integer; var maxn, maxn2: integer);
var
	i:integer;
	
begin
	for i:= 1 to 5 do
	begin
		if (E.cod_gen[i] > max) then
		begin
			max2:= max;
			maxn2 := maxn;
			max := E.cod_gen[i];
			maxn := i
		end
		else
		begin
			if (E.cod_gen[i] > max2) then
			begin
				max2:= E.cod_gen[i];
				maxn2 := i;
			end;
		end;
	end;
end;

procedure eliminar (L: lista);
var
	act, ant: lista;
	num: longInt;
begin
	writeln ('dni a eliminar: ');
	readln (num);
	act:= L;
	while (act <> nil) and (act^.elemento.dni <> num) do
	begin
		ant := act;
		act:= act^.sig;
	end;
	if (act <> nil) then
	begin
		if (act = L) then
		begin
			L:= L^.sig;
			dispose (act);
		end
		else
		begin
			ant^.sig:= act^.sig;
			dispose (act);
		end;
		writeln ('el dni ha sido eliminado');
	end
	else
		writeln ('el dni no esta en la lista');
end;

procedure imprimir ( masPQI: integer ; maxn, maxn2: integer);
begin
	writeln ();
	writeln ('hay ', masPQI,' personas con mas numero pares que impares el el dni');
	
	writeln ();
	case maxn of
		1: writeln ('el codigo de genero mas elegido fue el drama');
		2: writeln ('el codigo de genero mas elegido fue el romantico');
		3: writeln ('el codigo de genero mas elegido fue accion');
		4: writeln ('el codigo de genero mas elegido fue suspenso');
		5: writeln ('el codigo de genero mas elegido fue el terror');
	end;	
	case maxn2 of 
		1: writeln ('el segundo codigo de genero mas elegido fue el drama');
		2: writeln ('el segundo codigo de genero mas elegido fue el romantico');
		3: writeln ('el segundo codigo de genero mas elegido fue accion');
		4: writeln ('el segundo codigo de genero mas elegido fue el suspenso');
		5: writeln ('el segundo codigo de genero mas elegido fue el terror');
	end;
end;

var 
	max, max2, maxn, maxn2, masPQI: integer;
	L: lista;
	E: elem;
begin
	L:= nil;
	max:= 0;
	max2:= 0;
	
	cargar (L, E, masPQI);
	genMasE (E, max, max2, maxn, maxn2);
	imprimir (masPQI, maxn, maxn2);
	eliminar (L);
end.


