program practica3;
type 
	arbol= ^nodo;
	
	nodo = record
		elem: integer;
		hi: arbol;
		hd: arbol;
	end;

procedure crear (var A: arbol; num: integer);
begin
	if (A = nil) then
	begin
		new (A);
		A^.elem:= num;
		A^.hi:= nil;
		A^.hd:= nil;
	end
	else
	begin
		if (num < A^.elem) then
			crear (A^.hi, num)
		else
			crear (A^.hd, num);
	end;
end;
	
procedure cargar (var A: arbol; var num: integer);
begin
	writeln ('ingrese un numero entero: ');
	readln (num);
	while (num <> 58) do
	begin
		crear (A, num);
		writeln ('ingrese un numero entero: ');
		readln (num);
	end;
end;

procedure imprimir (A: arbol);
begin
	if (A <> nil) then
	begin
		imprimir (A^.hi);
		imprimir (A^.hd);
		writeln (A^.elem);
	end;
end;

procedure multipli (var A: arbol);
begin
	if (A <> nil) then
	begin
		multipli (A^. hi);
		multipli (A^.hd);
		A^.elem:= A^.elem * 2;
	end;
end;

procedure maximo (A: arbol; var max: integer);
begin
	if (A <> nil) then
	begin
		maximo (A^.hi, max);
		maximo (A^.hd, max);
		if (A^.elem > max) then
			max:= A^.elem;
	end;
end;


var
	A: arbol;
	num: integer;
	max: integer;
begin
	cargar (A, num);
	imprimir (A);
	multipli (A);
	writeln ();
	imprimir (A);
	max:= -32768;
	maximo (A, max);
	writeln ();
	writeln (max);
end.
