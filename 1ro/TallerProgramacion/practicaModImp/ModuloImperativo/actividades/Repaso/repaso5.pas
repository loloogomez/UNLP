//parcial de turno maniana 13/6

program repaso5;

type
	impresion = record
		nombre: string;
		paginas: integer;
		tamanio: integer;
		nombreU: string;
	end;
	
	usuario = record
		nombreU: string;
		documentosT: integer;
		paginasT: integer;
		ultDoc: string;
	end;
	
	arbol =^nodo;
	
	nodo = record
		elem: usuario;
		hi: arbol;
		hd: arbol;
	end;
	
	usuario2 = record
		nombreU: string;
		ultDoc: string;
	end;
	
	ultimos20 = array [1..20] of usuario2;
	
	
procedure leer (var I: impresion);
begin
	writeln ('ingrese el nombre del documento: ');
	readln (I.nombre);
	writeln ('ingrese el tamanio del documento: ');
	readln (I.tamanio);
	if (I.tamanio <> 0) then
	begin
		writeln ('ingrese la cantidad de paginas: ');
		readln (I.paginas);
		writeln ('ingrese el nombre del usuario: ');
		readln (I.nombreU);
	end;
end;

procedure crearA (var A: arbol; I: impresion);
var
	nuevo: arbol;
begin
	if (A = nil) then
	begin
		new (nuevo);
		nuevo^.elem.nombreU := I.nombreU;
		nuevo^.elem.documentosT := 1;
		nuevo^.elem.paginasT := I.paginas;
		nuevo^.elem.ultDoc:= I.nombre;
		nuevo^.hi:= nil;
		nuevo^.hd:= nil;
		A:= nuevo;
	end
	else
		if (A^.elem.nombreU = I.nombreU) then
		begin
			A^.elem.documentosT := A^.elem.documentosT + 1;
			A^.elem.paginasT := A^.elem.paginasT + I.paginas;
			A^.elem.ultDoc:= I.nombre;
		end
		else
			if (I.nombreU < A^.elem.nombreU) then
				crearA (A^.hi, I)
			else
				crearA (A^.hd, I);
end;

procedure cargarA (var A: arbol);
var
	I: impresion;
begin
	leer (I);
	while (I.tamanio <> 0) do
	begin
		crearA (A, I);
		leer(I);
	end;
end;

procedure masDoc (A: arbol; var U: usuario);
begin
	if (A <> nil) then
	begin
		masDoc (A^.hi,U);
		if (A^.elem.documentosT > U.documentosT) then
		begin
			U.nombreU := A^.elem.nombreU;
			U.documentosT := A^.elem.documentosT;
			U.paginasT := A^.elem.paginasT;
			U.ultDoc := A^.elem.ultDoc;
		end;
		masDoc (A^.hd, U);
	end;
end;

procedure crearV (A: arbol; var U20: ultimos20; valor1: string; valor2: string; var i: integer);
begin
	if ((A <> nil) and (i < 20)) then
	begin
		crearV (A^.hi, U20, valor1, valor2, i);
		if ((A^.elem.nombreU > valor1) and (A^.elem.nombreU < valor2)) then
		begin
			i:= i + 1;
			U20[i]. nombreU:= A^.elem.nombreU;
			U20[i].ultDoc:= A^.elem.ultDoc;
		end;
		crearV (A^.hd, U20, valor1, valor2, i);
	end;
end;

procedure imprimirA(A: arbol);
begin
	if (A <> nil) then
	begin
		imprimirA (A^.hi);
		writeln (A^.elem.nombreU);
		writeln (A^.elem.documentosT);
		writeln (A^.elem.paginasT);
		writeln (A^.elem.ultDoc);
		writeln ();
		imprimirA (A^.hd);
	end;
end;

procedure imprimirV (U20: ultimos20; i: integer);
var
	j: integer;
begin
	for J:= 1 to i do
	begin
		writeln (U20[j].nombreU);
		writeln (U20[j].ultDoc);
		writeln ();
	end;
end;

var
	A: arbol;
	U: usuario;
	U20: ultimos20;
	valor1: string;
	valor2: string;
	i: integer;
begin
	i:= 0;
	A:= nil;
	cargarA(A);
	imprimirA (A);
	U.documentosT := -1;
	masDoc (A, U);
	writeln ('usuario con mas documentos impresos: ', U.nombreU);
	writeln ('ingrese el valor1: ');
	readln (valor1);
	writeln ('ingrese el valor2: ');
	readln (valor2);
	writeln ();
	crearV (A, U20, valor1, valor2, i);
	imprimirV (U20, i);
end.
