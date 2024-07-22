program ejercicio3;
const
	UNESCO = 23.435;

type 
	escuela = record
	CUE : integer;
	Nombre : string;
	CA : integer;
	CD : integer;
	Localidad : string;
	end;

procedure leer (var E : escuela);
begin
	writeln ('CUE: ');
	readln (E.CUE);
	writeln ('nombre: ');
	readln (E.Nombre);
	writeln ('cantidad de alumnos: ');
	readln (E.CA);
	writeln ('cantidad de docentes: ');
	readln (E.CD);
	writeln ('localidad: ');
	readln (E.Localidad);
end;

procedure PRO (E: escuela; var promedio: real);
begin
	promedio:= E.CA / E.CD;
end;
	
procedure relacion (promedio : real; E: escuela; var RSP: integer);
begin
	if ((E.Localidad = 'La Plata') and (promedio >= UNESCO))then
		RSP := RSP + 1;
end;

procedure mejorRelacion (E: escuela; var MR: real; var MR2: real; var CMR: integer; var CMR2: integer; promedio : real; var NMR:string; var NMR2: string);
begin
	if (promedio < MR)then
	begin
		MR2 := MR;
		MR := promedio;
		CMR2 := CMR;
		CMR := E.CUE;
		NMR2 := NMR;
		NMR := E.Nombre;
	end
	else
	begin
		if (promedio < MR2) then;
		begin
			MR2 := promedio;
			CMR2 := E.CUE;
			NMR2 := E.Nombre;
		end;
	end;
end;

procedure escribir (RSP : integer; CMR: integer; CMR2: integer; NMR: string; NMR2: string);
begin
	writeln ('cantidad de escuelas de La Plata con una relacion superior: ', RSP);
	writeln ('las escuelas ', NMR, ' CUE: ', CMR, ' y ', NMR2, ' CUE: ', CMR2, ' tienen la mejor relacion');
end;

var
	E: escuela;
	promedio, MR, MR2: real;
	i, RSP, CMR, CMR2: integer;
	NMR, NMR2: string;
begin
	MR := 999;
	MR2 := 999;
	for i:= 1 to 3 do
	begin
		leer (E);
		PRO (E, promedio);
		relacion (promedio, E, RSP);
		mejorRelacion (E, MR, MR2, CMR, CMR2, promedio, NMR, NMR2);
	end;
	escribir (RSP,CMR,CMR2,NMR,NMR2);
end.
	
	
	
	
	
		
