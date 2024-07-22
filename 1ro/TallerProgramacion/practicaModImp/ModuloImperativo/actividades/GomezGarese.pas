program GomezGarese;

type
	mensaje = record
		id: integer;
		floresJ: integer;
		papelesJ: integer;
		calle: integer;
		avenida: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: mensaje;
		sig: lista;
	end;
	
	mensajes = array [1..5] of lista;
	
	calle = record
		num: integer;
		cantF: integer;
		papeles0: integer;
		avMax: integer;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		elem: calle;
		sig: lista2;
	end;
	
	avMax = record
		numAv: integer;
		cantF: integer;
		papeles0: integer;
	end;
	
	arbol = ^nodo3;
	
	nodo3 = record
		elem: avMax;
		hi: arbol;
		hd: arbol;
	end;
	
procedure leer (var M: mensaje);
begin
	M.id:= random (5) + 1;
	M.floresJ:= random (11);
	M.papelesJ:= random (11);
	M.calle:= random (100) + 1;
	M.avenida:= random (100) + 1;
end;

procedure inicializarL (var MS: mensajes);
var
	i: integer;
begin
	for i:= 1 to 5 do
		MS[i] := nil;
end;

procedure agregarO (var L: lista; M: mensaje);
var
	nuevo, ant, aux: lista;
begin
	new (nuevo);
	nuevo^.elem := M;
	aux:= L;
	while (aux <> nil) and (aux^.elem.calle < nuevo^.elem.calle) do
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

procedure cargar (var MS: mensajes);
var
	M: mensaje;
	j: integer;
begin
	for j:= 1 to 100 do
	begin
		leer (M);
		agregarO (MS[M.id], M);
	end;
end;

procedure buscarMinimo (var MS: mensajes; var M: mensaje);
var
	idMin: integer;
	i: integer;
begin
	M.calle:= 32767;
	for i:= 1 to 5 do
	begin
		if (MS[i] <> nil) then
			if (MS[i]^.elem.calle < M.calle) then
			begin
				M:= MS[i]^.elem;
				idMin:= i;
			end;
	end;
	if (M.calle <> 32767) then
		MS[idMin]:=MS[idMin]^.sig;
end;

procedure agregarA (C: calle; var L2: lista2; var ult:lista2);
var
	nuevo: lista2;
begin
	new (nuevo);
	nuevo^.elem:= C;
	nuevo^.sig:= nil;
	if (L2 = nil) then
	begin
		L2:= nuevo;
		ult:= L2;
	end
	else
	begin
		ult^.sig:= nuevo;
		ult:= nuevo;
	end;
end;
		

procedure mergeA (MS: mensajes; var L2: lista2);
var
	ult: lista2;
	M: mensaje;
	C: calle;
begin
	ult:= nil;
	buscarMinimo (MS, M);
	while (M.calle <> 32767) do
	begin
		C.cantF:= 0;
		C.num:= M.calle;
		C.avMax:= M.avenida;
		C.papeles0:= 0;
		while (M.calle = C.num) do
		begin
			C.cantF:= C.cantF + M.floresJ;
			if (M.papelesJ = 0) then
				C.papeles0 := C.papeles0 + 1;
			if (M.avenida > C.avMax) then	
				C.avMax:= M.avenida;
			buscarMinimo (MS, M);
		end;
		agregarA (C, L2, ult);
	end;
end;

procedure crearA (L2: lista2; var A: arbol);
var
	nuevo: arbol;
begin
	if (A = nil) then
	begin
		new (nuevo);
		nuevo^.elem.numAv:= L2^.elem.avMax;
		nuevo^.elem.cantF:= L2^.elem.cantF;
		nuevo^.elem.papeles0 := L2^.elem.papeles0;
		nuevo^.hi:= nil;
		nuevo^.hd:= nil;
		A:= nuevo;
	end
	else
		if (L2^.elem.avMax < A^.elem.numAv) then
			crearA (L2, A^.hi)
		else
			crearA (L2, A^.hd);
end;

procedure cargarA (L2: lista2; var A: arbol);
begin
	while (L2 <> nil) do
	begin
		crearA (L2, A);
		L2:= L2^.sig;
	end;
end;

procedure imprimirA (A: arbol);
begin
	if (A <> nil) then
	begin
		imprimirA (A^.hi);
		if (A^.elem.cantF > 10) and (A^.elem.cantF < 30) and (A^.elem.papeles0 > 1) then
		begin
			writeln ('avenida: ', A^.elem.numAv);
			writeln ('flores juntadas: ', A^.elem.cantF);
			writeln ('esquinas con 0 papeles: ', A^.elem.papeles0);
			writeln ();
		end;
		imprimirA (A^.hd);
	end;
end;

var
	A: arbol;
	MS: mensajes;
	L2: lista2;
begin
	randomize;
	A:= nil;
	L2:= nil;
	inicializarL (MS);
	cargar(MS);
	mergeA (MS, L2);
	cargarA (L2, A);
	imprimirA (A);
end.
