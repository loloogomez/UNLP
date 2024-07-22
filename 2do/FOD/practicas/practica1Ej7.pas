program ej7;
type
	novela = record
		cod: integer;
		nom: string;
		genero: integer;
		precio: integer;
	end;
	
	arch_reg = file of novela;
	
	arch_txt = text;

procedure leer (var N:novela);
begin
	writeln('codigo');
	readln (N.cod);
	writeln('nombre');
	readln (N.nom);
	writeln('genero');
	readln (N.genero);
	writeln('precio');
	readln (N.precio);
end;	

procedure copiar (var arch1: arch_txt; var arch2: arch_reg);
var
	N: novela;
begin
	reset(arch1);
	rewrite(arch2);
	while not eof(arch1) do
	begin
		readln(arch1, N.cod, N.precio, N.genero);
		readln(arch1, N.nom);
		write(arch2, N);
	end;
	close(arch1);
	close(arch2);
end;

procedure agregar (var arch2: arch_reg);
var
	N: novela;
begin
	writeln('datos de la novela que desea agregar:');
	leer(N);
	reset(arch2);
	seek(arch2, FileSize(arch2));
	write(arch2, N);
	close(arch2);
end;

procedure modificar (var arch2: arch_reg);
var
	N: novela;
	N2: novela;
begin
	writeln('datos de la novela que desea modificar: ');
	leer(N);
	reset(arch2);
	read(arch2, N2);
	while (not eof (arch2)) and (N2.cod <> N.cod) do
	begin
		read(arch2, N2);
	end;
	if (not eof (arch2)) then
	begin
		seek(arch2, FilePos(arch2)-1);
		write(arch2, N);
	end
	else
		writeln ('esa novela no se encuentra cargada');
	close(arch2);
end;

procedure imprimir (var arch2: arch_reg);
var
	N: novela;
begin
	reset(arch2);
	while (not eof(arch2)) do
	begin
		read(arch2, N);
		writeln (N.cod,', ', N.nom,', ', N.genero,', ',N.precio);
	end;
	close(arch2);
end;

var
	arch1: arch_txt;
	arch2: arch_reg;
begin
	assign(arch1, 'novelas');
	assign(arch2, 'novelasCopia');
	copiar(arch1, arch2);
	agregar(arch2);
	modificar(arch2);
	imprimir(arch2);
end.
	
