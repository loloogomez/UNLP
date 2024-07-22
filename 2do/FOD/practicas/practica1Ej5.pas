program ej5;
type
	celular = record
		cod: integer;
		nombre: string;
		descripcion: string;
		marca: string;
		precio: real;
		stockM: integer;
		stock: integer;
	end;
	
	arch_reg = file of celular;
	
	arch_txt = text;

procedure leer (var C: celular);
begin
	writeln ('cod');
	readln (C.cod);
	if (C.cod <> -1) then 
	begin
		writeln ('nombre');
		readln (C.nombre);
		writeln ('descripcion');
		readln (C.descripcion);
		writeln ('marca');
		readln (C.marca);
		writeln ('stock minimo');
		readln (C.stockM);
		writeln ('stock');
		readln (C.stock);
	end;
end;

procedure cargar (var arch : arch_reg);
var
	C: celular;
begin
	assign (arch, 'celulares.txt');
	rewrite (arch);
	leer (C);
	while (C.cod <> -1) do
	begin
		write (arch, C);
		leer(C);
	end;
end;

procedure copiar (var arch1: arch_reg; var arch2: arch_reg);
var
	C: celular;
begin
	reset (arch1);
	rewrite (arch2);
	while not eof (arch1) do
	begin
		read (arch1, C);
		write (arch2, C);
	end;
	close (arch1);
	close (arch2);
end;

procedure listarStockMenor (var arch: arch_reg);
var
	C: celular;
begin
	assign (arch, 'celularesCopia.txt');
	reset (arch);
	while not eof (arch) do
	begin
		read (arch, C);
		if (C.stock < C.stockM) then
			writeln (C.cod,', ', C.marca);
	end;
end;

procedure exportar (var arch1 : arch_reg; var arch2: arch_txt);
var
	C: celular;
begin
	reset (arch1);
	rewrite (arch2);
	while not eof (arch1) do
	begin
		read (arch1, C);
		writeln (arch2, C.cod, C.precio, C.marca);
		writeln (arch2, C.stock, C.stockM, C.descripcion);
		writeln (arch2, C.nombre);
	end;
	close (arch1);
	close (arch2);
end;

procedure agregar (var arch: arch_reg);
var
	C:celular;
begin
	reset (arch);
	seek(arch, FileSize(arch));
	leer (C);
	while (C.cod <> -1) do
	begin
		write(arch, C);
		leer (C);
	end;
	close (arch);
end;

procedure cambiarStock (var arch: arch_reg);
var
	C: celular;
	nom: string;
	newStock: integer;
begin
	writeln ('ingrese el nombre del ceular que desea modificar el stock:');
	readln (nom);
	writeln ('ingrese el nuevo stock: ');
	readln (newStock);
	reset (arch);
	read (arch, C);
	while (C.nombre <> nom) do
		read (arch, C);
	C.stock := newStock;
	seek (arch, FilePos(arch) - 1);
	write (arch, C);
	close (arch);
end;

procedure sinStock (var arch1: arch_reg; var arch2: arch_txt);
var
	C: celular;
begin
	reset (arch1);
	rewrite (arch2);
	while not eof (arch1) do
	begin
		read (arch1, C);
		if (C.stock =  0) then
		begin
			writeln (arch2, C.cod, C.precio, C.marca);
			writeln (arch2, C.stock, C.stockM, C.descripcion);
			writeln (arch2, C.nombre);
		end;
	end;
	close (arch1);
	close (arch2);
end;

var
	arch1, arch2: arch_reg;
	arch3, arch4: arch_txt;
begin
	assign (arch1, 'celulares.txt');
	assign (arch2, 'celularesCopia.txt');
	assign (arch3, 'celularesExportados.txt');
	assign (arch4, 'sinStock.txt');
	copiar (arch1, arch2);
	listarStockMenor (arch2);
	agregar (arch2);
	cambiarStock (arch2);
	sinStock (arch2, arch4);
	exportar (arch2, arch3);
end.
