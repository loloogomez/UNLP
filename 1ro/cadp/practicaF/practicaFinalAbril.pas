program practicaFinal101020232;
type

	numeroCategoria=1..5;
	
	participante = record
		dni: integer;
		nomYApe: string;
		categoria: numeroCategoria;
		fecha:string;
	end;
	
	participantes = array [1..5000] of participante;
	
	contador = array [1..5] of integer;
	
	lista=^nodo;
	
	nodo = record
		elem:participante;
		sig: lista;
	end;
	
procedure leer (var P: participante);
begin
	writeln('ingrese el dni del competidor:');
	readln(P.dni);
	if (P.dni <> -1) then
	begin
		writeln('ingrese el nombre y apellido del competidor:');
		readln(P.nomYApe);
		writeln('ingrese la categoria (1..5):');
		readln(P.categoria);
		writeln('ingrese la fecha:');
		readln(P.fecha);
	end;
	writeln('');
end;

procedure cargarVector(var V: participantes; var dimL: integer);
var
	P: participante;
begin
	dimL := 0;
	leer(P);
	while (P.dni <> -1) and (dimL < 5000) do
	begin
		dimL := dimL + 1;
		V[dimL] := P;
		leer(P);
	end;
end;

procedure contar(dimL : integer ;V: participantes; var C: contador);
var
	i: integer;
begin
	for i:= 1 to dimL do
	begin
		C[V[i].categoria]:= C[V[i].categoria] + 1;
	end;
end;

procedure guardar50 (V:participantes; dimL: integer; C:contador; var L: lista);
var
	i: integer;
	nuevo, aux: lista;
begin
	for i:= 1 to dimL do
	begin
		if (C[V[i].categoria] > 1) then
		begin
			new (nuevo);
			nuevo^.elem:= V[i];
			nuevo^.sig:= nil;
			if (L = nil) then
				L:= nuevo
			else
			begin
				aux:= L;
				while (aux^.sig <> nil)do
					aux:= aux^.sig;
				aux^.sig:= nuevo;
			end;
		end;
	end;
end;

procedure imprimir (L:lista);
begin
	while (L<>nil)do
	begin
		writeln(L^.elem.dni);
		L:= L^.sig;
	end;
end;

var
	L:lista;
	dimL: integer;
	C:contador;
	V: participantes;
begin
	L:= nil;
	cargarVector(V, dimL);
	contar(dimL,V,C);
	guardar50(V,dimL,C,L);
	imprimir(L);
end.
