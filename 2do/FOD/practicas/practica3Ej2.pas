program p3ej2;
type
	asistente = record
		nro: integer;
		apeNom: string;
		mail: string;
		tel: integer;
	end;
	
	archivo = file of asistente;

procedure leer (var A: asistente);
begin
	writeln ('ingrese el numero del asistente: ');
	readln (A.nro);
	if (A.nro <> -1) then
	begin
		writeln ('ingrese el apellido y el nombre del asistente: ');
		readln (A.apeNom);
		writeln ('ingrese el mail del asistente: ');
		readln (A.mail);
		writeln ('ingrese el telefono del asistente: ');
		readln (A.tel);
	end;
end;

procedure cargar (var arch: archivo);
var
	A: asistente;
begin
	rewrite(arch);
	leer(A);
	while (A.nro <> -1) do
	begin
		write(arch, A);
		leer(A);
	end;
	close(arch);
end;

procedure eliminar (var arch: archivo);
var
	A: asistente;
begin
	reset(arch);
	while (not eof(arch)) do
	begin
		read(arch, A);
		if (A.nro < 1000) then
		begin
			A.apeNom := '@' + A.apeNom;
			seek (arch, filepos(arch)-1);
			write (arch, A);
		end;
	end;
	close(arch);
end;

procedure imprimir (var arch: archivo);
var
	A: asistente;
begin
	reset(arch);
	writeln('imprimir:');
	writeln();
	while (not eof(arch)) do
	begin
		read(arch, A);
		if (A.apeNom[1] <> '@') then
		begin
			writeln (A.nro);
			writeln(A.apeNom);
			writeln(A.mail);
			writeln(A.tel);
		end;
	end;
	close(arch);
end;

var
	arch: archivo;
begin
	assign(arch, 'asistentesP3Ej2');
	cargar(arch);
	imprimir(arch);
	eliminar(arch);
	imprimir(arch);
end.
