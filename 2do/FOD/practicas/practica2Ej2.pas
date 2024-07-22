program ej2;
const
	numero_alto = 999;
type
	alumno = record
		cod: integer;
		nombre: string;
		ape: string;
		cursadas: integer;
		finales: integer;
	end;
	
	reporte = record
		cod: integer;
		finales: integer;
	end;
	
	arch_alumno = file of alumno;
	
	arch_reporte = file of reporte;
	
	arch_txt = text;

procedure leer (var arch: arch_reporte; var R: reporte);
begin
	if (not eof(arch)) then
		read (arch, R)
	else
		R.cod := numero_alto;
end;

procedure procesar (var maestro: arch_alumno; var detalle: arch_reporte);
var
	ant: integer;
	act: reporte;
	cursadas, finales: integer;
	A: alumno;
begin
	reset (maestro);
	reset (detalle);
	leer (detalle, act);
	while (act.cod <> numero_alto) do
	begin
		ant := act.cod;
		cursadas:= 0;
		finales:= 0;
		while (ant = act.cod) do
		begin
			if (act.finales = 1) then
				finales := finales + 1
			else
				cursadas := cursadas + 1;
			leer (detalle, act);
		end;
		read (maestro, A);
		while (A.cod <> ant) do
			read (maestro, A);
		seek(maestro, FilePos(maestro)-1);
		A.cursadas := A.cursadas + cursadas;
		A.finales := A.finales + finales;
		write(maestro, A);
	end;
	close(maestro);
	close(detalle);
end;

procedure listar4Cursadas (var arch1: arch_alumno; var arch2: arch_txt);
var
	A: alumno;
begin
	reset (arch1);
	rewrite (arch2);
	read (arch1, A);
	while (not eof(arch1)) do
	begin
		if (A.cursadas > 4) then
		begin
			writeln (arch2,'codigo: ',A.cod,', nombre: ',A.nombre, ', apellido: ',A.ape,', cursadas: ', A.cursadas, ', finales: ', A.finales);
		end;
		read (arch1, A);
	end;
	close(arch1);
	close(arch2);
end;

procedure cargarMaestro (var maestro: arch_alumno);
var
	A: alumno;
begin
	rewrite(maestro);
	writeln ('codigo: ');
	readln (A.cod);
	if (A.cod <> -1) then
	begin
		writeln ('nombre: ');
		readln (A.nombre);
		writeln ('apellido: ');
		readln (A.ape);
		writeln ('cursadas');
		readln (A.cursadas);
		writeln ('finales: ');
		readln (A.finales);
	end;
	while (A.cod <> -1) do
	begin
		write (maestro, A);
		writeln ('codigo: ');
		readln (A.cod);
		if (A.cod <> -1) then
		begin
			writeln ('nombre: ');
			readln (A.nombre);
			writeln ('apellido: ');
			readln (A.ape);
			writeln ('cursadas');
			readln (A.cursadas);
			writeln ('finales: ');
			readln (A.finales);
		end;
	end;
	close(maestro);
end;

procedure cargarDetalle (var detalle: arch_reporte);
var
	R: reporte;
begin
	rewrite (detalle);
	writeln ('codigo: ');
	readln (R.cod);
	if (R.cod <> -1) then
	begin
		writeln ('1 si aprobo final, 2 si solo cursada: ');
		readln (R.finales);
	end;
	while (R.cod <> -1) do
	begin
		write (detalle, R);
		writeln ('codigo: ');
		readln (R.cod);
		if (R.cod <> -1) then
		begin
			writeln ('1 si aprobo final, 2 si solo cursada: ');
			readln (R.finales);
		end;
	end;
	close(detalle);
end;

procedure imprimir (var maestro: arch_alumno);
var
	A: alumno;
begin
	reset (maestro);
	while (not eof(maestro)) do
	begin
		read(maestro, A);
		writeln ('codigo: ',A.cod,', nombre: ',A.nombre, ', apellido: ',A.ape,', cursadas: ', A.cursadas, ', finales: ', A.finales)
	end;
	close(maestro);
end;

var
	maestro: arch_alumno;
	detalle: arch_reporte;
	txt: arch_txt;
begin
	assign(maestro, 'maestro');
	assign(detalle, 'detalle');
	assign(txt, 'alumnos4Cursadas');
	//cargarMaestro(maestro);
	//cargarDetalle(detalle);
	procesar(maestro, detalle);
	listar4Cursadas(maestro, txt);
	imprimir (maestro);
end.
