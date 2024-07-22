program PracticaVideoClase3;
type
	lista = ^nodo;
	
	nodo = record
		elem: integer;
		sig: lista;
	end;
	
	arreglo = array [1..5] of lista;
	
procedure cargar (var A: arreglo);
var
	i, num: integer;
	act, nue: lista;
begin
	for i:= 1 to 5 do
	begin
		writeln ('ingrese un numero para la lista ', i,':');
		readln (num);
		while (num <> -1) do
		begin
			new (nue);
			nue^.elem := num;
			nue^.sig:= nil;
			if (A[i] <> nil) then
			begin
				act:= A[i];
				while (act^.sig <> nil) do
					act:= act^.sig;
					act^.sig:= nue;
			end
			else
				A[i]:= nue;
			writeln ('ingrese un numero para la lista ', i,':');
			readln (num);
		end;
		writeln ();
	end;
end;

procedure imprimir (A: arreglo);
var
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		while (A[i] <> nil) do
		begin
			writeln (A[i]^.elem);
			A[i]:= A[i]^.sig;
		end;
		writeln ();
	end;
end;

procedure minimo (var A: arreglo; var min: integer );
var
	aux, i: integer;
begin
	min := 32767;
	for i:= 1 to 5 do
	begin
		if (A[i] <> nil) and (A[i]^.elem <= min) then
		begin	
			min:= A[i]^.elem;
			writeln (min); 
			aux:= i;
		end;
	end;
	if (min <> 32767) then
		A[aux]:= A[aux]^.sig;
end;


procedure agregarA (var L: lista; min: integer);
var
	nue, act: lista;
begin
	new (nue);
	nue^.elem := min;
	nue^.sig:= nil;
	if (L <> nil) then
	begin
		act:= L;
		while (act <> nil) do
			act:= act^.sig;
		act:= nue;
	end
	else
		L:= nue;
end;

procedure merge (A: arreglo; var L: lista ); 
var
	min: integer;
begin
	minimo (A, min);
	while (min <> 32767) do
	begin
		agregarA (L, min);
		minimo (A, min);
	end;
end;

procedure imprimir2 (L: lista);
begin
	while (L <> nil) do
	begin
		writeln (L^.elem);
		L:= L^.sig;
	end;
end;

var
	A: arreglo;
	i: integer;
	L: lista;
begin
	L:= nil;
	for i:= 1 to 5 do
		A[i]:= nil;
	cargar (A);
	imprimir (A);
	merge (A, L);
	imprimir2 (L);
end.
			
			

