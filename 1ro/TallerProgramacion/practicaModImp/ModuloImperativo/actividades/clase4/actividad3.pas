program actividad3;
type
	arbol = ^nodo;
	
	nodo = record
		elem: integer;
		HI: arbol;
		HD: arbol;
	end;
	
procedure insertarA (var A: arbol; num: integer);
begin
	if (A = nil) then
	begin
		new (A);
		A^.elem := num;
		A^.HI:= nil;
		A^.HD:= nil;
	end
	else
		if (A^.elem > num) then
			insertarA (A^.HI, num)
		else
			insertarA (A^.HD, num);
end;

procedure leerNum (var num: integer; var A: arbol);
begin
	writeln ('ingrese un numero: ');
	readln (num);
	writeln ();
	while (num <> -1) do
	begin
		insertarA (A, num);
		writeln ('ingrese un numero: ');
		readln (num);
		writeln ();
	end;
end;

function buscar (A:arbol; dato: integer):arbol;
begin
	if (A = nil) then
		buscar := nil
	else
		if (dato= A^.elem) then 
			Buscar:=A
		else
			if (dato < a^.elem) then
				Buscar:=Buscar(A^.HI ,dato)
			else
				Buscar:=Buscar(A^.HD ,dato);
end;

procedure imprimir (A: arbol);
begin
	if (A <> nil) then
	begin
		imprimir (A^.HI);
		writeln (A^.elem);
		imprimir (A^.HD);
	end;
end;

var
	A: arbol;
	num: integer;
begin
	A:= nil;
	leerNum (num, A);
	writeln ('ingrese un numero para buscarlo en el arbol: ');
	readln (num);
	writeln ();
	if  (buscar (A, num) = nil) then
		writeln ('el numero ', num,' no se encuentra en el arbol')
	else
		writeln ('el numero ', num,' se encuentra en el arbol');
end.
