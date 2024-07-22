program ejercicio3;

var
	alumno: string;
	nota: integer;
	aprobados: integer;
	nota7: integer;

BEGIN
	repeat
		write ('nombre del alumno: ');
		readln (alumno);
		write ('nota: ');
		readln (nota);
		if (nota >= 8) then
			aprobados:= aprobados + 1;
		if (nota = 7) then
			nota7:= nota7 + 1;
	until (alumno = 'zidane zinedine');
	writeln;
	writeln ('aprovaron ', aprobados, ' alumnos');
	writeln ('obtuvieron 7: ', nota7, ' alumnos');
	
END.

