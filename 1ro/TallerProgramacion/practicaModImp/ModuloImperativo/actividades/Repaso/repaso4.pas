program repaso4;

type
	gasto = record
		tipo: integer;
		monto: real;
	end;
	
	lista =^nodo;
	
	nodo = record
		elem: gasto;
		sig: lista;
	end;
	
	familia = array [1..4] of lista;
	
	gastoT = record
		tipo: integer;
		montoT: real;
	end;
	
	arbol = ^nodo2;
	
	nodo2 = record
		elem: gastoT;
		hi: arbol;
		hd: arbol;
	end;
	
procedure leer (var G: gasto);
begin
	writeln ('ingrese el tipo de gasto: ');
	readln (G.tipo);
	if (G.tipo <> 0) then
	begin
		writeln ('ingrese el monto gastado: ');
		readln (G.monto);
	end;
end;

procedure agregarO (var L: lista; G: gasto);
var
	nuevo, ant, aux: lista;
begin
	new (nuevo);
	nuevo^.elem := G;
	aux := L;
	while (aux <> nil) and (aux^.elem.tipo < G.tipo) do
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

procedure inicializarF (var F: familia);
var
	i: integer;
begin
	for i:= 1 to 4 do
		F[i]:= nil;
end;

procedure cargarF (var F: familia);
var
	G:gasto;
	i: integer;
begin
	for i:= 1 to 4 do
	begin
		leer(G);
		while (G.tipo <> 0) do
		begin
			agregarO (F[i], G);
			leer(G);
		end;
	end;
end;

procedure imprimirL (F: familia);
var
	i: integer;
begin
	writeln ();
	for i:= 1 to 4 do
	begin
		while (F[i] <> nil) do
		begin
			writeln (F[i]^.elem.tipo);
			writeln (F[i]^.elem.monto:2:1);
			writeln ();
			F[i]:= F[i]^.sig;
		end;
	end;
end;

procedure buscarMinimo (var F: familia; var G: gasto);
var
	lMin: integer;
	i: integer;
begin
	G.tipo := 32767;
	for i:= 1 to 4 do
	begin
		if (F[i] <> nil) then
			if (F[i]^.elem.tipo < G.tipo) then
			begin
				G:= F[i]^.elem;
				lMin:= i;
			end;
	end;
	if (G.tipo <> 32767) then
			F[lMin]:= F[lMin]^.sig;
end;

procedure crearA (GT: gastoT; var A: arbol);
var
	nuevo: arbol;
begin
	if (A = nil) then
	begin
		new (nuevo);
		nuevo^.elem:= GT;
		nuevo^.hi:= nil;
		nuevo^.hd:= nil;
		A:= nuevo;
	end
	else
		if (GT.montoT < A^.elem.montoT) then
			crearA (GT, A^.hi)
		else
			crearA (GT, A^.hd);
end;

procedure mergeA (F: familia; var A: arbol);
var
	G: gasto;
	GT: gastoT;
begin
	buscarMinimo (F, G);
	while (G.tipo <> 32767) do
	begin
		GT.tipo:= G.tipo;
		GT.montoT:= 0;
		while (G.tipo = GT.tipo) do
		begin
			GT.montoT := GT.montoT + G.monto;
			buscarMinimo (F, G);
		end;
		crearA (GT, A);
	end;
end;

procedure buscarMayor (A: arbol);
begin
	while (A^.hd <> nil) do
		A:= A^.hd;
	writeln();
	writeln (A^.elem.tipo);
	writeln (A^.elem.montoT:2:1);
end;

var
	F: familia;
	A: arbol;
begin
	inicializarF (F);
	A:= nil;
	cargarF (F);
	imprimirL (F);
	mergeA (F, A);
	buscarMayor (A);
end.
		

