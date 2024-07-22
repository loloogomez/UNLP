program corteControl1;
type
	ciudad = record
		provincia : string;
		nombreCiudad : string;
		visitantes : integer;
	end;
	
procedure leer (var C:ciudad);
begin
	writeln ('ingrese el nombre de la provincia: ');
	readln (C.provincia);
	if (C.provincia <> 'fin') then
	begin
		writeln ('ingrese el nombre de la ciudad: ');
		readln (C.nombreCiudad);
		writeln ('ingrese la cantidad de visitantes: ');
		readln (C.visitantes);
	end;
end;

procedure masVisitantes();
var
	C: ciudad;
	provMax, provAct: string;
	max, act: integer;
begin
	leer(C);
	max := 0;
	while (C.provincia <> 'fin') do
	begin
		act := 0;
		provAct:= C.provincia;
		while (C.provincia = provAct) do
		begin
			act := act + C.visitantes;
			leer(C);
		end;
		if (act > max) then
		begin
			max := act;
			provMax := provAct;
		end;
	end;
	writeln (provMax);
end;

begin
	masVisitantes();
end.

