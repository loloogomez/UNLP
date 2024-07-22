program prueba;
type
	
	registro = record
		nombre: string;
		id: integer;
	end;
	
	arch_reg = file of registro;
	
	arch_txt = text;
	
procedure leer (var R: registro);
begin
	writeln ('ingrese un id que no sea 0:');
	readln (R.id);
	writeln ('ingrese el nombre:');
	readln (R.nombre);
end;

procedure cargar (var arch: arch_reg);
var
	R: registro;
begin
	assign (arch, 'archivo.prueba');
	rewrite (arch);
	leer (R);
	while (R.id <> 0) do
	begin
		write(arch, R);
		leer (R);
	end;
	close(arch);
end;

procedure exportar (var arch1: arch_reg; var arch2: arch_txt);
var
	R: registro;
begin
	assign (arch1, 'archivo.prueba');
	assign (arch2, 'archivo.txt');
	reset (arch1);
	rewrite (arch2);
	while not eof (arch1) do
	begin
		read(arch1, R);
		write(arch2, R.id, ', ', R.nombre,', ');
	end;
	close (arch1);
	close (arch2);
end;

var
	arch1: arch_reg;
	arch2: arch_txt;
begin
	cargar(arch1);
	exportar(arch1, arch2);
end.
