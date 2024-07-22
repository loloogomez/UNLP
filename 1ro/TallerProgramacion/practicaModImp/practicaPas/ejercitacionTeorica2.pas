program ejercitacionTeorica2;
type
	participante = record
		cod: integer;
		edad: integer;
	end;
	
	participantes = array [1..20] of participante;
	
	lista= ^nodo;
	
	nodo = record
		elem: participante;
		sig: lista;
	end;
	
procedure leer (var P: participante);
begin
	writeln ('ingrese codigo del participante: ');
	readln (P.cod);
	if (P.cod <> -1) then
	begin
		writeln('ingrese la edad del participante: ');
		readln (P.edad);
	end;
end;

procedure cargar (var PS: participantes; var dimL: integer);
var
	P: participante;
begin
	leer (P);
	dimL:= 0;
	while (P.cod <> -1) do
	begin
		dimL:= dimL +1;
		PS[dimL] := P;
		leer (P);
	end;
end;

procedure imprimir (PS: participantes; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
	begin
		writeln (PS[i].cod);
		writeln (PS[i]. edad);
		writeln ();
	end;
end;

procedure ordenar (var PS: participantes; dimL: integer);
var
	i, pos, comp: integer;
	item: participante;
begin
	for i:= 1 to dimL-1 do 
	begin
		pos:= i;
		for comp:= i+1 to dimL do
		begin
			if (PS[comp].edad< PS[pos].edad) then
			begin
				item:= ps[comp];
				ps[comp]:= ps[pos];
				ps[pos]:= item
			end;
		end;
	end;
end;

procedure eliminar (var PS: participantes; var dimL: integer);
var
	i, i2: integer;
begin
	i:= 1;
	while (PS[i]. edad < 20) do
		i:= i +1;
	while (PS[i]. edad < 23) do
	begin
		for i2:= i + 1 to dimL do 
			PS[i2-1]:= PS[i2];
		dimL:= dimL -1;
	end;
end;

procedure listaOR (PS: participantes; dimL: integer; var L: lista );
var
	i: integer;
	nuevo: lista;
begin
	for i:=dimL downto 1 do
	begin
		new (nuevo);
		nuevo^.elem := PS[i];
		nuevo^.sig := L;
		L:= nuevo;
	end;
end;

procedure imprimirL (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^.elem. cod);
		writeln (L^.elem. edad);
		writeln ();
		L:= L^.sig;
	end;
end;

var
	PS: participantes;
	L: lista;
	dimL: integer;
begin
	L:= nil;
	cargar (PS, dimL);
	writeln ('informacion almacenada: ');
	imprimir (PS, dimL);
	ordenar (PS, dimL);
	writeln ('informacion ordenada por edad: ');
	imprimir (PS, dimL);
	eliminar (PS, dimL);
	writeln ('informacion despues de eliminar con edades entre 20 y 22');
	imprimir (PS, dimL);
	listaOR (PS, dimL, L);
	writeln ('lista final: ');
	imprimirL (L);
end.
