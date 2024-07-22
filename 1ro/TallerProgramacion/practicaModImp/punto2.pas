program punto2;
type
	pelicula = record
		cod: integer;
		codGen: 1..8;
		critica: real;
	end;
	
	lista= ^nodo;
	
	nodo = record
		elem: pelicula;
		sig: lista;
	end;
	
	procedure leer (var L: lista);
	var
		act: lista;
		nueva: lista;
		corte: integer;
		next: lista;
	begin
		while ( corte <> -1) do
		begin	
			new (nueva);
			writeln ('ingrese el codigo de la pelicula: ');
			readln (nueva^.elem.cod);
			corte:= (nueva^.elem.cod);
			if (corte <> -1) then
			begin
				writeln ('ingrese el codigo de genero (1 a 8): ');
				readln (nueva^.elem.codGen);
				writeln ('valoracion promedio por parte de la critica: ');
				readln (nueva^.elem.critica);
				writeln ();
			end;
			if (L <> nil) then
			begin
				act:= L;
				next:= act^.sig;
				if (act^.sig = nil) then
				begin
					if (act^.elem.codGen <= nueva^.elem.codgen)then
					begin
						act^.sig:= nueva;
						nueva^.sig:= next;
					end
					else
					begin
						nueva^.sig:= act;
						act^.sig:= next;
					end
				end
				else
				begin
					while (next^.elem.codGen <= nueva^.elem.codGen) do
						act:= act^.sig;
						next:= next^.sig;
					act^.sig:= nueva;
					nueva^.sig := next;
				end;
			end
			else
				L:= nueva;
				L^.sig:= nil;
		end;
	end;
	
	procedure imprimir (L: lista);
	begin
		while (L <> nil) do
		begin
			writeln (L^.elem.codGen);
			L:= L^.sig;
		end;
	end;
	
	var
		L: lista;
	begin
		L:= nil;
		leer (L);
		imprimir (L);
	end.
		
