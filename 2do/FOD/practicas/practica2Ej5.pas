program ej5;
const
	valor_alto = 999;
	distritos = 3;
type
	nacimiento = record
		nro: integer;
		nombre: string;
		apellido: string;
		direc: string;
		matriculaM: integer;
		nomApeMadre: string;
		dniMadre: integer;
		nomApePadre: string;
		dniPadre: integer;
	end;
	
	fallecimiento = record
		nro: integer;
		dni: integer;
		nomApe: string;
		matriculaM: integer;
		fechaHora: string;
		lugar: string;
	end;
	
	join = record
		nro: integer;
		nombre: string;
		apellido: string;
		direc: string;
		medicoN: integer;
		nomApeMadre: string;
		dniMadre: integer;
		nomApePadre: string;
		dniPadre: integer;
		medicoF: integer;
		fechaHora: string;
		lugar: string;
	end;
	
	arch_nacimiento = file of nacimiento;
	
	arch_fallecimiento = file of fallecimiento;
	
	maestro = file of join;
	
	arch_txt = text;
	
	archivos_nacimiento = array[1..distritos] of arch_nacimiento;
	
	archivos_fallecimiento = array[1..distritos] of arch_fallecimiento;
	
	nacimientos = array[1..distritos] of nacimiento;
	
	fallecimientos = array[1..distritos] of fallecimiento; 
	
procedure leerN (var arch: arch_nacimiento; var N: nacimiento);
begin
	if (not eof(arch)) then
		read(arch, N)
	else
		N.nro := valor_alto;
end;

procedure leerF (var arch: arch_fallecimiento; var F: fallecimiento);
begin
	if (not eof(arch)) then
		read(arch, F)
	else
		F.nro := valor_alto;
end;

procedure cargarN (var archivos: archivos_nacimiento; var N: nacimientos);
var
	i: integer;
begin
	for i:= 1 to distritos do
	begin
		reset(archivos[i]);
		leerN(archivos[i], N[i]);
	end;
end;

procedure cargarF (var archivos: archivos_fallecimiento; var F: fallecimientos);
var
	i: integer;
begin
	for i:= 1 to distritos do
	begin
		reset(archivos[i]);
		leerF(archivos[i], F[i]);
	end;
end;

procedure minNac (var archivos: archivos_nacimiento; var N: nacimientos; var minN: nacimiento);
var
	i: integer;
	minPos: integer;
begin
	minN.nro := valor_alto;
	for i:= 1 to distritos do
	begin
		if (N[i].nro < minN.nro) then
		begin
			minN := N[i];
			minPos:= i;
		end;
	end;
	if (minN.nro <> valor_alto) then
		leerN(archivos[minPos], N[minPos]);
end;

procedure minFall (var archivos: archivos_fallecimiento; var F: fallecimientos; var minF: fallecimiento);
var
	i: integer;
	minPos: integer;
begin
	minF.nro := valor_alto;
	for i:= 1 to distritos do
	begin
		if (F[i].nro < minF.nro) then
		begin
			minF := F[i];
			minPos:= i;
		end;
	end;
	if (minF.nro <> valor_alto) then
		leerF(archivos[minPos], F[minPos]);
end;

procedure merge (var maestro: maestro; var archivosN: archivos_nacimiento; var N: nacimientos; var archivosF: archivos_fallecimiento; var F: fallecimientos);
var
	minF: fallecimiento;
	minN: nacimiento;
	merge: join;
	i: integer;
begin
	rewrite(maestro);
	minNac(archivosN, N, minN);
	minFall(archivosF, F, minF);
	while (minN. nro <> valor_alto) or (minF.nro <> valor_alto) do
	begin
		if (minN.nro < minF.nro) then
		begin
			merge.nro:= minN.nro;
			merge.nombre:= minN.nombre;
			merge.apellido:= minN.apellido;
			merge.direc:= minN.direc;
			merge.medicoN:= minN.matriculaM;
			merge.nomApeMadre:= minN.nomApeMadre;
			merge.dniMadre:= minN.dniMadre;
			merge.nomApePadre:= minN.nomApePadre;
			merge.dniPadre:= minN.dniPadre;
			merge.medicoF:= -1;
			merge.fechaHora:= '';
			merge.lugar:= '';
			minNac(archivosN, N, minN);
		end
		else
		begin
			merge.nro:= minN.nro;
			merge.nombre:= minN.nombre;
			merge.apellido:= minN.apellido;
			merge.direc:= minN.direc;
			merge.medicoN:= minN.matriculaM;
			merge.nomApeMadre:= minN.nomApeMadre;
			merge.dniMadre:= minN.dniMadre;
			merge.nomApePadre:= minN.nomApePadre;
			merge.dniPadre:= minN.dniPadre;
			merge.medicoF:= minF.matriculaM;
			merge.fechaHora:= minF.fechaHora;
			merge.lugar:= minF.lugar;
			minNac(archivosN, N, minN);
			minFall(archivosF, F, minF);
		end;
		write(maestro, merge);
	end;
	for i:= 1 to distritos do
		close(archivosN[i]);
	for i:= 1 to distritos do
		close(archivosF[i]);
	close(maestro);
end;

procedure exportar (var maestro: maestro; var txt: arch_txt);
var
	elem: join;
begin
	rewrite(txt);
	reset (maestro);
	while (not eof(maestro))do
	begin
		read(maestro, elem);
		writeln(txt, elem.nro,', ', elem.nombre,', ', elem.apellido,', ', elem.direc,', ', elem.medicoN,', ', elem.nomApeMadre,', ', elem.dniMadre,', ', elem.nomApePadre,', ', elem.dniPadre,', ', elem.medicoF,', ', elem.fechaHora,', ', elem.lugar);		
	end;
	close(maestro);
	close(txt);
end;

procedure crearN(var archivosN: archivos_nacimiento);
var
	N:nacimiento;
	i: integer;
begin
	for i:= 1 to distritos do
	begin
		rewrite(archivosN[i]);
		writeln('archivo de nacimientos ', i);
		writeln('ingrese el numero de partida de nacimiento: ');
		readln(N.nro);
		while (N.nro <> -1) do
		begin
			writeln('ingrse el nombre: ');
			readln(N.nombre);
			writeln('ingrese el apellido: ');
			readln(N.apellido);
			writeln('ingrese la direcion: ');
			readln(N.direc);
			writeln('ingrese la matricula del medico: ');
			readln(N.matriculaM);
			writeln('ingrese el nombre y apellido de la madre: ');
			readln(N.nomApeMadre);
			writeln('ingrese el dni de la madre: ');
			readln(N.dniMadre);
			writeln('ingrese el nombre y apellido del padre: ');
			readln(N.nomApePadre);
			writeln('ingrese el dni del padre: ');
			readln(N.dniPadre);
			write(archivosN[i], N);
			writeln('ingrese el numero de partida de nacimiento: ');
			readln(N.nro);
		end;
		close(archivosN[i]);
	end;
end;

procedure crearF(var archivosF: archivos_fallecimiento);
var
	i: integer;
	F: fallecimiento;
begin
	for i:= 1 to distritos do
	begin
		rewrite(archivosF[i]);
		writeln('archivo de fallecimientos ', i);
		writeln('ingrese el numero de partida de nacimiento: ');
		readln(F.nro);
		while (F.nro <> -1) do
		begin
			writeln('ingrse el dni ');
			readln(F.dni);
			writeln('ingrese el nombre y apellido del fallecido: ');
			readln(F.nomApe);
			writeln('ingrese la matricula del medico: ');
			readln(F.matriculaM);
			writeln('ingrese la fecha y hora del deceso:');
			readln(F.fechaHora);
			writeln('ingrese el lugar del deceso: ');
			readln(F.lugar);
			write(archivosF[i], F);
			writeln('ingrese el numero de partida de nacimiento: ');
			readln(F.nro);
		end;
		close(archivosF[i]);
	end;
end;

var
	N: nacimientos;
	F: fallecimientos;
	archivosN: archivos_nacimiento;
	archivosF: archivos_fallecimiento;
	master: maestro;
	txt: arch_txt;
begin
	assign(archivosN[1], 'nacimiento1');
	assign(archivosN[2], 'nacimiento2');
	assign(archivosN[3], 'nacimiento3');
	assign(archivosF[1], 'fallecimiento1');
	assign(archivosF[2], 'fallecimiento2');
	assign(archivosF[3], 'fallecimiento3');
	assign(master, 'maestroP2Ej5');
	assign(txt, 'txtP2Ej5');
	//crearN(archivosN);
	//crearF(archivosF);
	cargarN(archivosN, N);
	cargarF(archivosF, F);
	merge(master, archivosN, N, archivosF, F);
	exportar(master, txt);
end.
	
	

