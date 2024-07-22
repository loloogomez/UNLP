program repaso2;

type
	cliente = record
		cod: integer;
		dni: real;
		fecha: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: cliente;
		sig: lista;
	end;
	
	puestos = array [1..3] of lista;
	
	cliente2 = record
		dni: real;
		montoT: real;
	end;
	
	arbol = ^nodo2;
	
	nodo2 = record
		elem: cliente2;
		hi: arbol;
		hd: arbol;
	end;

procedure leer (var C: cliente);
begin
	writeln ('ingrese el codigo del cliente ');
	readln (C.cod);
	if (C.cod <> -1) then
	begin
		writeln ('ingrese el dni del cliente: ');
		readln (C.dni);
		writeln ('ingrese la fecha de la compra: ');
		readln (C.fecha);
		writeln ('ingrese el monto de la compra: ');
		readln (C.monto);
	end;
end;

procedure inicializar (var P: puestos);
var
	i: integer;
begin
	for i:= 1 to 3 do
		P[i]:= nil;
end;

procedure compras (var P: puestos);
var
	C: cliente;
	nuevo,ant, aux: lista;
	i: integer;
begin
	for i:= 1 to 3 do
	begin
		leer(C);
		while (C.cod <> -1) do
		begin
			new (nuevo);
			nuevo^.elem := C;
			aux := P[i];
			while (aux <> nil)and(aux^.elem.cod < nuevo^.elem.cod) do
			begin
				ant:= aux;
				aux:= aux^.sig;
			end;
			if (aux = P[i]) then
				P[i]:= nuevo
			else
				ant^.sig:= nuevo;
			nuevo^.sig:= aux;
			leer(C);
		end;
	end;
end;

procedure arbolO (C2: cliente2; var A: arbol);
var
	nuevo: arbol;
begin
	if (A = nil)then
	begin
		new (nuevo);
		nuevo^.elem:= C2;
		nuevo^.hi:= nil;
		nuevo^.hd:= nil;
		A:= nuevo;
	end
	else
	begin
		if (C2.montoT < A^.elem.montoT) then
			arbolO(C2, A^.hi)
		else
			arbolO(C2, A^.hd);
	end;
end;

procedure buscarMinimo (var C: cliente; var P: puestos);
var
	i: integer;
	lMin: integer;
begin
	C.cod := 32767;
	for i:= 1 to 3 do
	begin
		if (P[i] <> nil) then
			if (P[i]^.elem.cod < C.cod) then
			begin
				C:= P[i]^.elem;
				lMin:= i;
			end;
	end;
	if (C.cod <> 32767) then
		P[lMin]:= P[lMin]^.sig;
end;

procedure mergeA (P: puestos; var A: arbol);
var
	act: integer;
	C2: cliente2;
	C: cliente;
begin
	buscarMinimo(C, P);
	while (C.cod <> 32767) do
	begin	
		act:= C.cod;
		C2.dni:= C.dni;
		C2.montoT:= 0;
		while (C.cod = act) do
		begin
			C2.montoT:= C2.montoT + C.monto;
			buscarMinimo(C, P);
		end;
		arbolO(C2, A);
	end;
end;

procedure analizarA (A: arbol; montoIngresado: real; var cant: integer);
begin
	if (A <> nil) then
	begin
		if (A^.elem.montoT <= montoIngresado) then
			analizarA(A^.hd, montoIngresado, cant)
		else 
		begin
			cant:= cant + 1;
			analizarA(A^.hi, montoIngresado, cant);
			analizarA (A^.hd, montoIngresado, cant);
		end;
	end;
end;

procedure imprimirL (P: puestos);
var
	i: integer;
begin
	for i:= 1 to 3 do
	begin
		while (P[i] <> nil) do
		begin
			writeln (P[i]^.elem.cod);
			P[i]:= P[i]^.sig;
		end;
	end;
end;

procedure imprimirA (A: arbol);
begin
	if (A <> nil) then
	begin
		imprimirA (A^.hi);
		imprimirA (A^.hd);
		writeln (A^.elem.dni);
	end;
end;

var
	P: puestos;
	A: arbol;
	montoIngresado: real;
	cant: integer;
begin
	inicializar(P);
	A:= nil;
	compras(P);
	imprimirL(P);
	mergeA(P, A);
	imprimirA (A);
	writeln ('ingrese un monto: ');
	readln (montoIngresado);
	cant:= 0;
	analizarA(A, montoIngresado, cant);
	writeln ();
	writeln ('el numero de montos totales superior al ingresado es: ', cant);
end.
				
	
			
