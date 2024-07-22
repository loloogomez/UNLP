program ejercicio5;

type
	producto = record
		codigo: integer;
		descripcion: string[50];
		stockA: integer;
		stockM: integer;
		precio: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		prod: producto;
		sig: lista;
	end;
	
procedure armarNodo (var PN, UN: lista;var P: producto );
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.prod:= P; 
	nuevo^. sig := nil;
	if (PN = nil) then
	begin
		PN:= nuevo;
		UN:= nuevo;
	end
	else
	begin
		UN^.sig := nuevo;
		UN:= nuevo;
	end;
end;

procedure masbaratos (P: producto; var masbarato1, masbarato2: real; var codmasbarato1, codmasbarato2: integer);
begin
	if (P.precio < masbarato1)then
	begin
		masbarato2:= masbarato1;
		masbarato1:= P.precio;
		codmasbarato2:= codmasbarato1;
		codmasbarato1:= P.codigo;
	end
	else
	begin
		if (P.precio < masbarato2) then
		begin
			masbarato2:= P.precio;
			codmasbarato2:= P.codigo;
		end;
	end;
end;
		

procedure  stockMinimo (var PDDM: real; P: producto);
begin
	if (P.stockA < P.stockM) then
		PDDM := PDDM + 1;
end;

procedure leer (var P: producto; var PDDM : real; var rep: integer; var masbarato1,masbarato2: real; var codmasbarato1, codmasbarato2: integer); 
begin
	writeln ('codigo: ');
	readln (P.codigo);
	if (P.codigo <> -1) then
	begin
		writeln ('descripcion: ');
		readln (P.descripcion);
		writeln ('stock actual: ');
		readln (P.stockA);
		writeln ('stock minimo: ');
		readln (P.stockM);
		writeln ('precio: ');
		readln (P.precio);
		stockMinimo (PDDM, P);
		rep:= rep +1;
		masbaratos (P, masbarato1, masbarato2, codmasbarato1, codmasbarato2 )
	end;
end;
	
var
	P: producto;
	PN, UN: lista;
	rep, codmasbarato1, codmasbarato2: integer;
	PDDM, PDDM2, masbarato1, masbarato2: real;
	
begin
	masbarato1:= 99999;
	masbarato2:= 99999;
	leer (P, PDDM, rep, masbarato1, masbarato2, codmasbarato1, codmasbarato2);
	while (P.codigo <> -1) do
	begin
		armarNodo (PN, UN, P);
		leer (P, PDDM, rep, masbarato1, masbarato2, codmasbarato1, codmasbarato2);
	end;
	PDDM2:= (100 / rep) * PDDM;
	writeln ('el porcentaje de productos con stock menor al minimo es el: ',PDDM2:1:2 ,'%');
	writeln ('el codigo del producto mas barato es: ', codmasbarato1, ' y del segundo mas barato es: ', codmasbarato2);
end.
	
// falta hacer lo de descripcion de productos con codigo compuesto por al menos 3 numero pares;
