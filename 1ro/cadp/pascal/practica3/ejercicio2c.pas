program practica2c;

type
	dias = 1..31;
	meses = 1..12;
	anios = 2019..2020;
	
	fecha = record
	dia : dias;
	mes : meses;
	anio : anios;
	end;
	
procedure leer (var F: fecha);
begin
	write ('fecha: ');
	read (F.dia);
	write ('mes: ');
	read (F.mes);
	write ('anio: ');
	read (F.anio);
end;

var 
	F : fecha;
begin
	while (F.anio <> 2020) do
		leer (F);	
end.
		
		

	
