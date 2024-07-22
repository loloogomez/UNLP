program ej2;
type
	arch_numeros = file of integer;

function promedio (var arch: arch_numeros): real;
var
	total: real;
	num: integer;
begin
	reset (arch);
	total := 0;
	while not eof (arch) do
	begin
		read (arch, num);
		total := total + num;
	end;
	promedio := total / FileSize(arch);
	close(arch);
end;

function menores1500 (var arch: arch_numeros): integer;
var
	num: integer;
	cant: integer;
begin
	reset (arch);
	cant := 0;
	while not eof (arch) do
	begin
		read (arch, num);
		if (num < 1500) then
			cant := cant + 1;
	end;
	menores1500 := cant;
	close(arch);
end;

procedure imprimir (var arch: arch_numeros);
var
	num: integer;
begin
	reset (arch);
	while not eof (arch) do
	begin
		read (arch, num);
		writeln (num);
	end;
	close(arch);
end;

var
	arch: arch_numeros;
	arch_nombre: string;
begin
	writeln ('ingrese el nombre del archivo:');
	readln (arch_nombre);
	assign(arch, arch_nombre);
	writeln ('promedio: ',promedio(arch):2:1);
	writeln ('cantidad menores a 1500: ',menores1500(arch));
	writeln ('numeros:');
	imprimir (arch);
end.
