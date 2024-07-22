program ej1;
type
	empleado = record
		cod: integer;
		nombre: string;
		comision: integer;
	end;
	
	arch_reg = file of empleado;

procedure leer (var arch: arch_reg; var E: empleado);
begin
	if (not eof(arch)) then
		read (arch, E)
	else
		E.cod := 999;
end;

procedure cargar (var arch: arch_reg);
var
	E: empleado;
begin
	rewrite (arch);
	writeln('ingrese el codigo del empleado:');
	readln (E.cod);
	if (E.cod <> -1) then
	begin
		writeln ('ingrese el nombre:');
		readln (E.nombre);
		writeln ('ingrese la comision:');
		readln (E.comision);
	end;
	while (E.cod <> -1) do
	begin
		write (arch, E);
		writeln('ingrese el codigo del empleado:');
		readln (E.cod);
		if (E.cod <> -1) then
		begin
			writeln ('ingrese el nombre:');
			readln (E.nombre);
			writeln ('ingrese la comision:');
			readln (E.comision);
		end;
	end;
end;

procedure compactar (var arch1: arch_reg; var arch2: arch_reg);
var
	total: integer;
	act, ant: empleado;
begin
	reset (arch1);
	rewrite (arch2);
	leer (arch1, act);
	while (act.cod <> 999) do
	begin
		ant := act;
		total := 0;
		while (ant.cod = act.cod) do
		begin
			total:= total + act.comision;
			leer(arch1, act);
		end;
		ant.comision := total;
		write(arch2, ant);	
	end;
	close(arch1);
	close(arch2);
end;

procedure imprimir (var arch: arch_reg);
var
	E: empleado;
begin
	reset(arch);
	while (not eof(arch)) do
	begin
		read(arch, E);
		writeln (E.cod,', ', E.nombre,', ', E.comision);
	end;
	close(arch);
end;

var
	arch1, arch2: arch_reg;
begin
	assign(arch1, 'comisiones');
	assign(arch2, 'comisionesCompactadas');
	//cargar(arch1);
	compactar(arch1, arch2);
	imprimir(arch2);
end.
	

