program ej1;
type
	numero = file of integer;

procedure cargarNumeros(var num: numero);
var
	i: integer;
begin
	writeln ('ingrese un numero distinto a 30000:');
	readln (i);
	while (i <> 30000) do
	begin
		write (num, i);
		writeln ('ingrese un numero distinto a 30000:');
		readln (i);
	end;
end;

var
	arch_logico: numero;
	arch_fisico: string;
begin
	writeln ('ingrese el nombre del archivo:');
	readln (arch_fisico);
	assign (arch_logico, arch_fisico);
	rewrite(arch_logico);
	cargarNumeros(arch_logico);
	close(arch_logico);
end.
	
