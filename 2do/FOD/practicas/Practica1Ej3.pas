program ej3;
type
	empleado = record
		num: integer;
		ape: string;
		nombre: string;
		edad: integer;
		dni: integer;
	end;
	
	arch_reg = file of empleado;
	
	arch_txt = text;
	
procedure leer (var E: empleado);
begin
	writeln ('numero de empleado:');
	readln (E.num);
	writeln ('apelldo: ');
	readln (E.ape);
	if (E.ape <> 'fin') then
	begin
		writeln ('nombre:');
		readln (E.nombre);
		writeln ('edad:');
		readln (E.edad);
		writeln ('dni:');
		readln (E.dni);
	end;
end;

procedure cargar (var arch : arch_reg);
var
	E: empleado;
begin
	rewrite (arch);
	leer (E);
	while (E.ape <> 'fin') do
	begin
		write (arch, E);
		leer (E);
	end;
	close (arch);
end;

procedure buscar (var arch : arch_reg);
var
	buscado: string;
	apellido : boolean;
	switch : integer;
	E: empleado;
begin
	writeln ('ingrese 1 si desea buscar por apellido, cualquier numero si desea buscar por nombre:');
	readln (switch);
	if (switch = 1) then
	begin
		apellido := true;
		writeln ('ingrese el apellido que desea buscar:');
		readln (buscado);
	end
	else
	begin
		apellido := false;
		writeln ('ingrese el nombre que desea buscar:');
		readln (buscado);
	end;
	reset(arch);
	while not eof (arch) do
	begin
		read(arch, E);
		if (apellido = true) then
			if (E.ape = buscado) then
				writeln (E.num,', ', E.ape,', ', E.nombre,', ',E.edad,', ',E.dni)
		else
			if (E.nombre = buscado) then
				writeln (E.num,', ', E.ape,', ', E.nombre,', ',E.edad,', ',E.dni);
	end;
	close (arch);
end;

procedure imprimir (var arch : arch_reg);
var
	E: empleado;
begin
	reset (arch);
	while not eof(arch) do
	begin
		read (arch, E);
		writeln (E.num,', ', E.ape,', ', E.nombre,', ',E.edad,', ',E.dni);
	end;
	close (arch);
end;

procedure imprimir70 (var arch : arch_reg);
var
	E: empleado;
begin
	reset (arch);
	while not eof(arch) do
	begin
		read (arch, E);
		if (E.edad > 70) then
			writeln (E.num,', ', E.ape,', ', E.nombre,', ',E.edad,', ',E.dni);
	end;
	close (arch);
end;

procedure agregarAtras (var arch: arch_reg);
var
	E: empleado;
	E2: empleado;
	stop: boolean;
begin
	leer (E);
	while (E.ape <> 'fin') do
	begin
		stop := false;
		reset (arch);
		while (not eof (arch)) and (stop = false) do
		begin
			read (arch, E2);
			if (E2.num = E.num) then
			begin
				writeln ('el numero de empleado ya se encuentra cargado');
				stop := true;
			end;
		end;
		if (stop = false) then
		begin
			write(arch, E);
			close(arch);
		end;
		leer (E);
	end;
end;

procedure modificarEdad (var arch: arch_reg);
var
	E: empleado;
	id: integer;
	nuevaEdad: integer;
	stop: boolean;
begin
	writeln ('ingrese el numero de empleado que desea modificar edad:');
	readln (id);
	writeln ('ingrese la nueva edad que no sea 999:');
	readln (nuevaEdad);
	while (nuevaEdad <> 999) do
	begin
		stop := false;
		reset (arch);
		while (not eof (arch)) and (stop = false) do
		begin
			read(arch, E);
			if (E.num = id) then
			begin
				seek(arch,(FilePos(arch)-1));
				E.edad := nuevaEdad;
				write(arch, E);
				stop := true;
			end;
		end;
		if (stop = false) then
			writeln ('el empleado ', id, ' no se encuentra registrado');
		writeln ('ingrese el numero de empleado:');
		readln (id);
		writeln ('ingrese la nueva edad que no sea 999:');
		readln (nuevaEdad);
	end;
end;

procedure exportar (var arch1: arch_reg; var arch2: arch_txt);
var
	E: empleado;
begin
	reset (arch1);
	assign(arch2,'todosEmpleados.txt');
	rewrite (arch2);
	while not eof (arch1) do
	begin
		read(arch1, E);
		writeln(arch2,E.num, ', ',E.nombre);
	end;
	close(arch2);
end;

var
	arch: arch_reg;
	arch2: arch_txt;
	nombre: string;
begin
	writeln ('ingrese el nombre del archivo:');
	readln (nombre);
	assign (arch, nombre);
	cargar (arch);
	buscar (arch);
	modificarEdad (arch);
	imprimir (arch);
	imprimir70(arch);
	exportar(arch, arch2);
end.
		

	
