program practicaFinal3;
type
	caracteres = array [1..100] of char;
	
	registro = record
		caracter : char;
		cant: integer;
	end;
	
	repetidos = array [1..100] of registro;
	
	
procedure cargar (var C1: caracteres);
var
	i: integer;
begin
	for i:= 1 to 20 do
		readln(C1[i]);
end;

procedure repes (C1: caracteres; var C2: repetidos; var j: integer);
var
	i, cant: integer;
	charAct: char;
begin
	cant := 0;
	j:= 1;
	charAct := C1[i];
	for i:= 1 to 20 do
	begin
		if (charAct = C1[i]) then
			cant := cant + 1
		else
		begin
			C2[j].caracter := charAct;
			C2[j].cant := cant;
			j:= j + 1;
			charAct:= C1[i];
			cant:= 1;
		end
	end;
end;

procedure imprimir (C: repetidos; dimL : integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
	begin
		writeln();
		writeln (C[i].caracter);
		writeln(C[i].cant);
	end;
end;

var
	C1: caracteres;
	C2: repetidos;
	dimL: integer;
begin
	cargar(C1);
	repes(C1, C2, dimL);
	imprimir(C2, dimL);
end.
