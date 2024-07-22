program ejercicio5;

const
	dimF = 100;

var
	dimL: integer;

type
	vector = array [1..dimF] of integer;
	
procedure mayormenor (V: vector; dimL: integer; var mayor: integer; var menor: integer; var posMayor: integer; var posMenor: integer);
begin
	if (V[dimL] > mayor) then
	begin
		mayor := V[dimL];
		posMayor:= dimL;
	end;
	if ((V[dimL] <> 0) and (V[dimL] < menor)) then
	begin
		menor := V[dimL];
		posMenor:= dimL;
	end;	
end;


procedure leer (V: vector; var dimL: integer; var mayor: integer; var menor: integer; var posMayor: integer; var posMenor: integer);
begin
	dimL := 1;
	writeln ('numero ', dimL,' : ');
	readln (V[dimL]);
	mayormenor (V, dimL, mayor, menor, posMayor, posMenor);
	while ((V[dimL] <> 0) and (dimL < 100)) do
	begin
		dimL :=dimL + 1;
		writeln ('numero ', dimL,' : ');
		readln (V[dimL]);
		mayormenor (V, dimL, mayor, menor, posMayor, posMenor);
	end;
end;

procedure escribir (mayor: integer; menor: integer; posMayor: integer; posMenor: integer);
begin
	writeln ('El elemento maximo: ', mayor, ' que se encontraba en la posicion: ',posMayor, ' fue intercambiado con el elemento minimo: ', menor, ' que se encontraba en la posicion: ', posMenor);
end;

var
	V : vector;
	mayor, menor, posMayor, posMenor: integer;
begin
	mayor:= 0;
	menor:= 32767;
	leer (V,dimL, mayor, menor, posMayor, posMenor);
	V[posMayor]:= menor;
	V[posMenor]:= mayor;
	escribir (mayor, menor, posMayor, posMenor);
end.
