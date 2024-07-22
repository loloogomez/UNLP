program practicaFinal2;
type
	T = 1..12;

	publicacion = record
		titulo: string;
		nombre: string;
		dni: integer;
		tipo : T;
	end;
	
	publicaciones = array [1..12] of integer;
	
procedure leer (var P: publicacion);
begin
	writeln ('titulo: ');
	readln (P.titulo);
	writeln ('nombre: ');
	readln (P.nombre);
	writeln ('dni: ');
	readln (P.dni);
	writeln ('tipo: ');
	readln (P.tipo);
end;

procedure cargar ();
var
	P: publicacion;
	Ps: publicaciones;
	i,act,dniAct,max, maxI: integer;
begin
	max:= 0;
	leer(P);
	act := 0;
	dniAct := P.dni;
	while (P.dni <> 0) do
	begin
		if (P.dni <> dniAct) then
		begin
			writeln();
			writeln (dniAct);
			writeln (act);
		end;
		act:= 0;
		dniAct := P.dni;
		while (P.dni = dniAct) do
		begin
			act := act + 1;
			Ps[P.tipo] := Ps[P.tipo] + 1;
			leer(P);
		end;
	end;
	writeln();
	writeln(dniAct);
	writeln(act);
	writeln();
	for i:= 0 to 11 do
	begin
		if (Ps[i] > max) then
		begin
			max := Ps[i];
			maxI := i;
		end;
	end;
	writeln (maxI + 1);
end;

begin
	cargar();
end.
