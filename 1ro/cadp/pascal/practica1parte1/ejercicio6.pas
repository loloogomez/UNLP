program ejercicio6;

var
	a: integer;
	p: real;
	ca: integer;
	pm: integer;
	pa: integer;
	pad: real;
	

BEGIN
	while not(a = -1) do
		begin
			write ('numero de legajo: ');
			readln (a);
			if not(a = -1) then
				begin
					ca:= ca +1;
					write ('promedio: ');
					readln (p);
					if (p > 6.5) then
						pm:= pm +1;
					if ((a < 2500) and (p > 8.5)) then
						pa:= pa +1;
				end;
		end;
	pad:= (100 / ca) * pa;
	writeln ('cantidad de alumnos: ',ca);
	writeln ('cantidad de alumnos con promedio superior a 6.5: ',pm);
	writeln ('porcentaje de alumnos con legajo menor a 2500 y promedio mayor a 8.5: ',pad:1:2,'%');
				
END.

