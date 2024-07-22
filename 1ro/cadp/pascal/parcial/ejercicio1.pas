program ejercicio1;
type
	entradas = record
		numP: integer;
		nacionalidad: string;
	end;	
	
	lista = ^nodo;
	
	nodo = record
		elem: entradas;
		sig: lista;
	end;
	
	partido = record
		ventas: integer;
		numP: integer;
		estadio: string;
		equipo1: string;
		equipo2: string;
	end;
	
	vector = array [1..52]of partido
	
	
		
procedure leer (var P: partido);
begin
	writeln ('numero de partido: ');
	readln (E2.numP);
	writeln ('nombre del estadio:');
	readln (E2.estadio);
	writeln ('equipo 1: ');
	readln (E2.equipo1);
	writeln ('equipo 2: ');
	readln (E2.equipo2);
end;

procedure cargar (var P: partido;var V:vector);
var
	i: integer;
begin
	for i:= 1 to 52 do
	begin
		leer (P);
		V[i]:= P;
	end;
end;

procedure calcular (var mas30: integer; V: vector);
var
	i: integer;
begin
	for i:= 1 to 52 do
	begin
		if (V[i].ventas > 30000) then
			mas30:= mas30 + 1;
	end;
end;
	
procedure (var V: vector; L: entradas; var mas30: integer; var paisMasEntradas: string);
var
	paisactual, paismax: string;
	entradaspaisactual, entradaspaismax: integer;
begin
	ant:=L;
	paisactual:= L^.elem.nacionalidad;
	entradaspaismax:= -1;
	
	while (L <> nil) do
	begin
		V[L^.elem.numP].ventas := V[L^.elem.numP].ventas +1;
		
		
		if (L^.elem.nacionalidad = paisactual)then
		begin	
			if (L^.elem.nacionalidad = V[L^.elem.numP].equipo1) or (L^.elem.nacionalidad = V[L^.elem.P].equipo2)then
					entradaspaisactual := entradaspaisactual +1		
		end
		else
		begin
			if (entradaspaisactual > entradaspaismax)then
			begin
				entradaspaismax := entradaspaisactual;
				paismax:= paisactual;
			end;
		
			paisactual:= L^.elem.nacionalidad;
			entradaspaisactual:= 1;
		end;	
		L:= L^.sig
	end;
	
	calcular (mas30, V);



var
	partido: lista;
	: lista;

begin
	cargar (L);
	
