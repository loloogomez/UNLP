program ej3;
const
	valor_alto = 9999;
	sucursales = 3;
type
	producto = record
		cod: integer;
		nombre: string;
		descripcion: string;
		stockD: integer;
		stockM: integer;
		precio: integer;
	end;
	
	venta = record
		cod: integer;
		cant: integer;
	end;
	
	arch_prod = file of producto;
	
	arch_venta = file of venta;
	
	arch_txt = text;
	
	arregloVentas = array [1..sucursales] of venta;
	
	detalles = array [1..sucursales] of arch_venta;

procedure leer (var arch: arch_venta; var V: venta);
begin
	if (not eof(arch)) then
		read(arch, V)
	else
		V.cod := valor_alto;
end;

procedure cargar (var D: detalles; var AV: arregloVentas);
var
	i: integer;
begin
	for i:= 1 to sucursales do
	begin	
		reset(D[i]);
		leer (D[i], AV[i]);
	end;
end;

procedure minimo (var D: detalles; var AV: arregloVentas; var min: venta);
var
	i, codMin, posMin:integer;
begin
	codMin:= valor_alto;
	for i:= 1 to sucursales do
	begin
		if (AV[i].cod <= codMin) then
		begin
			codMin:= AV[i].cod;
			posMin:= i;
		end;
	end;
	min:= AV[posMin];
	leer(D[posMin], AV[posMin]);
end;

procedure actualizar (var maestro: arch_prod; var D: detalles);
var
	total, act: integer;
	min: venta;
	AV: arregloVentas;
	aux: producto;
begin
	reset(maestro);
	cargar(D, AV);
	minimo(D, AV, min);
	while (min.cod <> valor_alto) do
	begin
		total := 0;
		act:= min.cod;
		while (min.cod = act) do
		begin
			total := total + min.cant;
			minimo(D, AV, min);
		end;
		read(maestro, aux);
		while (aux.cod <> act) do
			read(maestro, aux);
		seek(maestro, FilePos(maestro)-1);
		aux.stockD:= aux.stockD - total;
		write(maestro, aux);
	end;
end;

procedure crearD (var D: detalles);
var
	aux: venta;
	i: integer;
begin
	for i:= 1 to sucursales do
	begin
		rewrite(D[i]);
		writeln('sucursal ', i,':');
		writeln('codigo:');
		readln (aux.cod);
		if (aux.cod <> -1) then
		begin
			writeln('cantidad: ');
			readln (aux.cant);
		end;
		while (aux.cod <> -1) do
		begin
			write(D[i], aux);
			writeln('codigo:');
			readln (aux.cod);
			if (aux.cod <> -1) then
			begin
				writeln('cantidad: ');
				readln (aux.cant);
			end;
		end;
		close(D[i]);
	end;
end;

procedure crearM (var maestro: arch_prod);
var
	P:producto;
begin
	rewrite(maestro);
	writeln('cargar maestro: ');
	writeln('codigo:');
	readln (P.cod);
	if (P.cod <> -1) then
	begin
		writeln('nombre:');
		readln(P.nombre);
		writeln('descripcion:');
		readln (P.descripcion);
		writeln('stock disponible:');
		readln(P.stockD);
		writeln('stock minimo:');
		readln(P.stockM);
		writeln('precio:');
		readln(P.precio);
	end;
	while (P.cod <> -1) do
	begin
		write(maestro, P);
		writeln('codigo:');
		readln (P.cod);
		if (P.cod <> -1) then
		begin
			writeln('nombre:');
			readln(P.nombre);
			writeln('descripcion:');
			readln (P.descripcion);
			writeln('stock disponible:');
			readln(P.stockD);
			writeln('stock minimo:');
			readln(P.stockM);
			writeln('precio:');
			readln(P.precio);
		end;
	end;
	close(maestro);
end;

procedure imprimir (var maestro: arch_prod);
var
	P:producto;
begin
	reset(maestro);
	writeln('maestro final:');
	while (not eof(maestro))do
	begin
		read(maestro, P);
		writeln(P.cod,', ',P.nombre,', ',P.stockD);
	end;
	close(maestro);
end;

procedure exportarStockBajo (var maestro: arch_prod; var txt: arch_txt);
var
	P: producto;
begin
	rewrite(txt);
	reset (maestro);
	while (not eof(maestro))do
	begin
		read(maestro, P);
		if (P.stockD < P.stockM) then
			writeln(txt, P.cod,', ',P.nombre,', ',P.stockD);
	end;
	close(maestro);
	close(txt);
end;

var
	maestro: arch_prod;
	D: detalles;
	txt: arch_txt;
begin
	assign(maestro, 'maestroProductosEj3');
	assign(D[1], 'detalleEj3-1');
	assign(D[2], 'detalleEj3-2');
	assign(D[3], 'detalleEj3-3');
	assign(txt, 'stockBajoEj3');
	//crearD(D);
	//crearM(maestro);
	actualizar(maestro, D);
	imprimir(maestro);
	exportarStockBajo(maestro, txt);
end.
	
	
