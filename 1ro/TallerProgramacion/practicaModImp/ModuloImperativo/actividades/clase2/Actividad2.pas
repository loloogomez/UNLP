program actividad2;
type
	jugador = record
		dni: integer;
		nombre: string;
		altura: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: jugador;
		sig: lista;
	end;
	
	vector = array [1..20] of jugador;
	
procedure leer (var J: jugador);
begin
	writeln ('ingrese el dni del jugador: ');
	readln (J.dni);
	if (J.dni <> 0) then
	begin
		writeln ('ingrese el nombre del jugador: ');
		readln (J.nombre);
		writeln ('ingrese la altura del jugador: ');
		readln (J.altura);
	end;
end;

procedure cargar (var L: lista; J: jugador);
var
	nuevo, aux: lista;
begin
	leer (J);
	while (J.dni <> 0) do
	begin
		new (nuevo);
		nuevo^.elem:= J;
		nuevo^.sig:= nil;
		if (L = nil) then
			L:= nuevo
		else
		begin
			aux:= L;
			while (aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig := nuevo;
		end;
		leer (J);
	end;
end;

procedure imprimirLista (L: lista);
begin
	while (L <> nil) do
	begin
		writeln ();
		writeln (L^.elem.dni);
		writeln (L^.elem.nombre);
		writeln (L^.elem.altura :1:2);
		L:= L^.sig;
	end;
end;

procedure cargarVector (L: lista; var v: vector; var dimL: integer);
var
	promedio: real;
	i: integer;
	contador: real;
	aux: lista;
begin
	promedio:= 0;
	contador:= 0;
	aux:= L;
	i:= 1;
	dimL:= 0;
	while (aux <> nil) do
	begin
		promedio := promedio + aux^.elem.altura;
		contador:= contador + 1;
		aux:= aux^.sig;
	end;
	promedio:= promedio / contador;
	writeln ();
	writeln ('el promedio de altura es: ', promedio :2:1);
	aux:= L;
	while (aux <> nil) do
	begin
		if (aux^.elem.altura > promedio) then
		begin
			V[i]:= aux^.elem;
			i:= i + 1;
			dimL:= dimL + 1;
		end;
		aux := aux^.sig;
	end;
end;

procedure imprimirVector (V: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
	begin
		writeln ();
		writeln (V[i].dni);
		writeln (V[i].nombre);
		writeln (V[i].altura :1:2);
	end;
end;

procedure ordenarVector (var V: vector; dimL: integer);
var
	i, j, actual: integer;
	actualJ: jugador;
begin
	for i:= 2 to dimL do
	begin
		actual := V[i].dni;
		actualJ:= V[i];
		j:= i - 1;
		while (j > 0) and (V[j].dni > actual) do
		begin
			V[j + 1]:= V[j];
			j:= j - 1;
		end;
		V[j + 1]:= actualJ;
	end;
end;

procedure buscarJugador (V: vector; dimL: integer);
var
	dniIngresado: integer;
	pri, ult, mitad: integer;
begin
	writeln();
	writeln ('ingrese el dni del jugador a buscar: ');
	readln (dniIngresado);
	pri:= 1;
	ult:= dimL;
	mitad:= dimL div 2;
	while (pri <= ult) and (V[mitad].dni <> dniIngresado) do
	begin
		if (V[mitad].dni > dniIngresado) then
			ult := mitad - 1
		else
			pri := mitad + 1;
		mitad := (pri + ult) div 2;
	end;
	writeln ();
	writeln ('la altura del jugador con el dni ingresado es: ', V[mitad].altura :1:2);
end;

var
	J: jugador;
	L: lista;
	V: vector;
	dimL: integer;
begin
	L:= nil;
	cargar(L, J);
	imprimirLista(L);
	cargarVector (L, V, dimL);
	imprimirVector (V, dimL);
	ordenarVector (V, dimL);
	writeln ();
	writeln('vector ordenado: ');
	imprimirVector (V, dimL);
	buscarJugador (V, dimL);
end.
