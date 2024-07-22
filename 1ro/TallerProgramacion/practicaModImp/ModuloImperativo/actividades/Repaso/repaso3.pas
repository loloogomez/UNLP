program repaso3;

type
	paquete = record
		tipoP: 1..4;
		codP: integer;
		codL: integer;
		peso: real;
		precio: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: paquete;
		sig: lista;
	end;
	
	tipos = array [1..4] of lista;
	
	paquete2 = record
		codL: integer;
		pesoT: real;
	end;
	
	arbol = ^nodo2;
	
	nodo2 = record
		elem: paquete2;
		hi: arbol;
		hd: arbol;
	end;

procedure leer (var P: paquete);
begin
	writeln ('ingrese el codigo del paquete: ');
	readln (P.codP);
	if (P.codP <> -1) then
	begin
		writeln ('ingrese el tipo de paquete de 1 a 4: ');
		readln (P.tipoP);
		writeln ('ingrese el codigo de la localidad: ');
		readln (P.codL);
		writeln ('ingrese el peso del paquete'); 
		readln (P.peso);
		writeln ('ingrese el precio del paquete: ');
		readln (P.precio);
	end;
end;

procedure inicializarL (var T: tipos);
var
	i: integer;
begin
	for i:= 1 to 4 do
		T[i]:= nil;
end;

procedure agregarO (P: paquete; var L: lista);
var
	nuevo, ant, aux: lista;
begin
	new (nuevo);
	nuevo^.elem:= P;
	aux:= L;
	while (aux <> nil) and (aux^.elem.codL < nuevo^.elem.codL) do
	begin
		ant:= aux;
		aux:= aux^.sig;
	end;
	if (aux = L) then
		L := nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= aux;
end;

procedure envios (var T: tipos);
var
	P: paquete;
begin
	leer (P);
	while (P.codP <> -1) do
	begin
		agregarO (P, T[P.tipoP]);
		leer (P);
	end;
end;

procedure buscarMinimo (var P: paquete; var T: tipos);
var
	tMin: integer;
	i: integer;
begin
	P.codL := 32767;
	for i:= 1 to 4 do
	begin
		if (T[i] <> nil) then
			if (T[i]^.elem.codL < P.codL)then
			begin
				P:= T[i]^.elem;
				tMin:= i;
			end;
	end;
	if (P.codL <> 32767) then
		T[tMin]:= T[tMin]^.sig;
end;

procedure crearA (P2: paquete2; var A: arbol);
var
	nuevo: arbol;
begin
	if (A = nil) then
	begin
		new (nuevo);
		nuevo^.elem:= P2;
		nuevo^.hi:= nil;
		nuevo^.hd:= nil;
		A:= nuevo;
	end
	else
		if (P2.pesoT < A^.elem.pesoT) then
			crearA (P2, A^.hi)
		else
			crearA (P2, A^.hd);
end;

procedure mergeA (T: tipos; var A: arbol);
var
	P: paquete;
	P2: paquete2;
begin
	buscarMinimo(P, T);
	while (P.codL <> 32767) do
	begin
		P2.pesoT:= 0;
		P2.codL := P.codL;
		while (P.codL = P2.codL) do
		begin
			P2.pesoT := p2.pesoT + P.peso;
			buscarMinimo (P, T);
		end;
		crearA (P2, A);
	end;
end;

procedure analizarA (A: arbol; unPeso: real; var cant: integer);
begin
	if (A <> nil) then
		if (A^.elem.pesoT < unPeso) then
		begin
			cant:= cant + 1;
			analizarA (A^.hi, unPeso, cant);
			analizarA (A^.hd, unPeso, cant);
		end
		else
			analizarA (A^.hi, unPeso, cant);
end;

procedure imprimirL (T: tipos);
var
	i: integer;
begin
	for i:= 1 to 3 do
	begin
		while (T[i] <> nil) do
		begin
			writeln (T[i]^.elem.codL);
			T[i]:= T[i]^.sig;
		end;
	end;
end;

procedure imprimirA (A: arbol);
begin
	if (A <> nil) then
	begin
		imprimirA (A^.hi);
		imprimirA (A^.hd);
		writeln (A^.elem.codL);
	end;
end;

var
	unPeso: real;
	cant: integer;
	T: tipos;
	A: arbol;
begin
	A:= nil;
	inicializarL (T);
	envios (T);
	imprimirL (T);
	mergeA (T, A);
	imprimirA (A);
	writeln ();
	writeln ('ingres un peso: ');
	readln (unPeso);
	cant:= 0;
	analizarA (A, unPeso, cant);
	writeln ();
	writeln ('la cantidad de localidades con peso total menor al ingresado son: ', cant);
end.
		
