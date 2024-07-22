program Repaso1;
type
	entrada = record
		Dia: integer;
		CO: integer;
		Asiento: integer;
		Monto: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: entrada;
		sig: lista;
	end;
	
	semana = array [1..7] of lista;
	
	COTotal = record
		CO: integer;
		cant: integer;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		elem: COTotal;
		sig: lista2;
	end;

procedure leer (var E: entrada);
begin
	writeln ('ingrese el dia de la obra: ');
	readln (E.Dia);
	writeln ('ingrese el codigo de la obra: ');
	readln (E.CO);
	if (E.CO <> 0) then
	begin
		writeln ('ingrese el numero de asiento: ');
		readln (E.Asiento);
		writeln ('ingrese el monto a pagar: ');
		readln (E.Monto);
		writeln ();
	end;
end;

procedure inicializarL (var S: semana);
var
	i: integer;
begin
	for i:= 1 to 7 do
	begin
		S[i]:= nil;
	end;
end;

procedure agregarO (E: entrada; var L: lista);
var
	nuevo, ant, aux: lista;
begin
	new (nuevo);
	nuevo^.elem := E;
	aux:= L;
	while (aux <> nil)and(aux^.elem.CO < nuevo^.elem.CO) do
	begin	
		ant:= aux;
		aux:= aux^.sig;
	end;
	if (aux = L) then
		L:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= aux;
end;

procedure cargarL (var S: semana);
var
	E: entrada;
begin
	leer (E);
	while (E.CO <> 0) do
	begin
		agregarO (E, S[E.Dia]);
		leer (E);
	end;
end;

procedure agregarA (act: integer; cant: integer; var ult: lista2; var L2: lista2);
var
	nuevo: lista2;
begin
	new (nuevo);
	nuevo^.elem.CO := act;
	nuevo^.elem.cant := cant;
	nuevo^.sig:= nil;
	if (L2 = nil) then
	begin
		L2:= nuevo;
		ult:= nuevo;
	end
	else
	begin
		ult^.sig:= nuevo;
		ult:= nuevo;
	end;
end;
		

procedure buscarMinimo (var S: semana; var lMin: integer);
var
	i: integer;
	eMin: integer;
begin
	lMin := 32767;
	for i:= 1 to 7 do
	begin
		if (S[i] <> nil) then
			if (S[i]^.elem.CO < lMin) then
			begin
				lMin:= S[i]^.elem.CO;
				eMin:= i;
			end;
	end;
	if (lMin <> 32767) then
		S[eMin]:= S[eMin]^.sig;
end;

procedure merge (S: semana; var L2: lista2);
var
	cant: integer;
	act: integer;
	ult: lista2;
	actual: integer;
begin
	ult:= nil;
	buscarMinimo (S, actual);
	while (actual <> 32767) do
	begin
		act:= actual;
		cant:= 0;
		while (actual = act) do
		begin
			cant:= cant + 1;
			buscarMinimo (S, actual);
		end;
		agregarA (act, cant, ult, L2);
	end;
end;

procedure imprimirS (S: semana);
var
	i: integer;
begin
	for i:= 1 to 7 do
	begin
		writeln ('dia ', i,': ');
		while (S[i] <> nil) do
		begin
			writeln (S[i]^.elem.CO);
			S[i]:= S[i]^.sig;
		end;
		writeln ();
	end;
end;

procedure imprimirL (L2: lista2);
begin
	if (L2 <> nil) then
	begin
		writeln (L2^.elem.CO);
		writeln (L2^.elem.cant);
		writeln ();
		L2:= L2^.sig;
		imprimirL (L2);
	end;
end;

var
	S: semana;
	L2: lista2;
begin
	L2:= nil;
	inicializarL (S);
	cargarL (S);
	imprimirS(S);
	merge (S, L2);
	imprimirL (L2);
end.
	
