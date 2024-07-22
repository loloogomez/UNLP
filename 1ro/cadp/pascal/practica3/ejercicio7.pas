program Registros;
type
	info = record
		linea:string;
		cores:integer;
		reloj: integer;
		nm:integer
	end;
	microprocesador = record
		marca:string;
		cant: integer;
		inf:info;

end;
procedure leer2(var i : info);        {P---------LEER2------------}
begin
	write('   Ingrese la linea: '); readln(i.linea);
	write('  cantidad de cores: '); readln(i.cores);
	write('velocidad del reloj: '); readln(i.reloj);
	write('       transistores: '); readln(i.nm);
end;
procedure leer(var m : microprocesador);        {P---------LEER------------}
begin
	write('----Ingrese la marca-----: '); readln(m.marca);
	leer2(m.inf);
end;

procedure task1(m:microprocesador; var lista:string);				{-------------TASK1-----------}
begin
	if ((m.inf.cores > 2) and (m.inf.nm >= 22)) then begin
		lista += m.marca;
		lista+= ' ';
		lista+= m.inf.linea;
		lista += ', ';
	end;
end;

procedure task2(m:microprocesador;var maxTr, maxTr2:integer; var maxMarca, maxMarca2:string);{-------------TASK2-----------}
begin
	 if (m.cant > maxTr) then begin
		maxTr2:=maxTr;
		maxTr := m.cant;
		maxMarca2:= maxMarca;
		maxMarca:=m.marca;
	 end
	 else if (m.cant > maxTr2) then begin
		maxMarca2:= m.marca;
		maxTr2:=m.cant;
	 end;
end;
procedure task3(m:microprocesador; var pr:integer);		{-------------TASK3-----------}
begin
if (((m.marca = 'AMD') or (m.marca = 'Intel')) and (m.inf.reloj >= 2)) then
	pr+=1
end;

var								 {P---------VAR------------}
m : microprocesador;
lista, maxMarca, maxMarca2:string;
pr, maxTr, maxTr2 : integer;

{----------------------------------BEGIN-----------------------}
begin
	lista := '';
	maxMarca := '';
	maxMarca2 := '';
	maxTr:= -1;
	maxTr2:= -2;
	pr:=0;
	
	writeln('escriba 0 en marca para parar todo el proceso y 0 en cores para parar el bucle de la marca');
	leer(m);
	
	while (m.marca <>'0') do begin
		while (m.inf.cores <> 0) do begin	
			task1(m, lista);
			if m.inf.nm > 14 then m.cant +=1;
			task2(m, maxTr, maxTr2, maxMarca, maxMarca2);
			task3(m, pr);
			leer2(m.inf);
		end;
		m.cant:= 0;
		leer(m);
	end;
	writeln('Marca y linea de procesadores de mas de 2 cores con transistores de a lo sumo 22 nm: ', lista);
	writeln('las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son: ', maxMarca2,' y ', maxMarca);
	writeln('Cantidad de procesadores multicore (de mas de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz: ', pr);

	
end.
