program ej10;
const
	valor_alto = 9999;
type
	extra = record
		dep : string;
		division: integer;
		num: integer;
		categoria: integer;
		horas: integer;
	end;
	
	valorHora = array[1..15] of integer;
	
	arch_valor = text;
	
	arch_horas = file of extra;
	
procedure leer (var arch: arch_horas; var horasE: extra);
begin
	if (not eof(arch)) then
		read(arch, horasE)
	else
		horasE.num := valor_alto;
end;

procedure cargarValorHora(var arch: arch_valor; var valorH: valorHora);
var
	cat: integer;
	valor: integer;
begin
	reset(arch);
	read(arch, cat);
	read(arch, valor);
	while (not eof(arch)) do
	begin	
		valorH[cat]:= valor;
		read(arch, cat);
		read(arch, valor);
	end;
	close(arch);
end;

procedure imprimir (valorH: valorHora; var arch: arch_horas);
var
	aux, act: extra;
	horasDep, montoDep, horasDiv, montoDiv, montoEmp : integer;
begin
	reset(arch);
	leer(arch, aux);
	while (aux.num <> valor_alto) do
	begin
		act:= aux;
		writeln(aux.dep);
		writeln();
		horasDep := 0;
		montoDep:= 0;
		while (aux.num <> valor_alto) and (act.dep = aux.dep) do
		begin
			act:= aux;
			writeln(aux.division);
			writeln();
			writeln('Numero de empleado     Total de Hs.     Importe a cobrar');
			horasDiv:= 0;
			montoDiv:= 0;
			while (aux.num <> valor_alto) and (act.division = aux.division) do
			begin
				montoEmp := aux.horas * valorH[aux.categoria];
				writeln(aux.num:18,'     ',aux.horas:12,'     ',montoEmp:16);
				horasDiv:= horasDiv + aux.horas;
				montoDiv:= montoDiv + montoEmp;
				leer(arch, aux);
			end;
			writeln();
			writeln('Total de horas division: ', horasDiv);
			writeln('Monto total por division: ', montoDiv);
			writeln();
			horasDep:= horasDep + horasDiv;
			montoDep:= montoDep + montoDiv;
		end;
		writeln('Total de horas departamento: ', horasDep);
		writeln('Monto total departamento: ', montoDep);
		writeln();
	end;
	close(arch);
end;

procedure crearArch (var arch: arch_horas);
var
	elem: extra;
begin
	rewrite(arch);
	writeln('ingrese el departamento del empleado: ');
	readln (elem.dep);
	while (elem.dep <> '') do
	begin
		writeln('ingrese la division del empleado: ');
		readln (elem.division);
		writeln('ingrese el numero de empleado: ');
		readln (elem.num);
		writeln('ingrese la categoria del empleado: ');
		readln (elem.categoria);
		writeln('ingrese las horas extras del empleado: ');
		readln (elem.horas);
		write(arch, elem);
		writeln('ingrese el departamento del empleado: ');
		readln (elem.dep);
	end;
	close(arch);
end;

procedure crearValorXCategoria (var arch: arch_valor);
var
	i, valor: integer;
begin
	rewrite(arch);
	for i:= 1 to 15 do
	begin
		writeln('ingrese el valor por hora de la categoria ',i);
		readln(valor);
		writeln(arch, i,' ', valor);
	end;
	close(arch);
end;

procedure imprimirArch(var arch: arch_horas);
var
	elem: extra;
begin
	reset(arch);
	while (not eof(arch)) do
	begin
		read(arch, elem);
		writeln(elem.dep,' ',elem.division,' ', elem.num,' ', elem.categoria,' ', elem.horas);
	end;
	close(arch);
end;

var
	arch: arch_horas;
	valorH: valorHora;
	arch_valores: arch_valor;
begin
	assign(arch, 'horasExtras');
	assign(arch_valores, 'valorXCategoria');
	//crearArch(arch);
	//crearValorXCategoria(arch_valores);
	imprimirArch(arch);
	readln();
	cargarValorHora(arch_valores, valorH);
	imprimir(valorH, arch);
end.
