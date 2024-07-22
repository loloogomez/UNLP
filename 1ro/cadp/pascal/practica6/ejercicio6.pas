program ejercicio6;
type
	
	sonda = record
		nombre: string;
		meses: integer;
		costoF: real;
		costoM: real;
		rango: 1..7;	
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem: sonda;
		sig: lista;
	end;
	
procedure masC (L: lista; var sondamasC: string; PsondamasC: real);
var
	aux: real;
begin
	aux:= (L^.elem.meses * L^.elem.costoM)+ L^.elem.costoF;
	if (aux > PsondamasC) then
	begin
		PsondamasC:= aux;
		sondamasC:= L^.elem.nombre;
	end;
end;

procedure sondaxR (L: lista; var R1,R2,R3,R4,R5,R6,R7: integer);
begin
	if (L^.elem.rango = 1) then
		R1:= R1 + 1;
	if (L^.elem.rango = 2) then
		R2 := R2 +1;
	if (L^.elem.rango = 3) then
		R3:= R3 +1;
	if (L^.elem.rango = 4) then
		R4:= R4 +1;
	if (L^.elem.rango = 5) then
		R5:= R5 +1;
	if (L^.elem.rango = 6) then
		R6:= R6 +1; 
	if (L^.elem.rango = 7) then
		R7:= R7 +1;	
end;
	
procedure recorrer (L: lista; var sondamasC: string; var PsondamasC: real; var R1,R2,R3,R4,R5,R6,R7: integer; var rep: integer; var duracionP: real; var duracionS: integer);
var
	aux: lista;
begin
	aux:= L;
	while (aux^.sig <> nil) do
	begin
		rep:= 1;
		masC (L, SondamasC, PsondamasC);
		sondaxR (L, R1,R2,R3,R4,R5,R6,R7)
		duracionPromedio (L, duracionS, rep, duracionP)
		
		aux:= aux^.sig;
	end;
end;
	
var
	L: lista;
	S: sonda
begin
	recorrer;
	informar;

	
		
