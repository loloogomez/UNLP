program punto1;
type
	oficina = record
		ident: integer;
		dni: integer;
		expensaV: real;
	end;
	
	oficinas = array [1..300] of oficina;
	
	procedure leer (var ofs: oficinas; var dimL: integer);
	var
		i: integer;
		num: integer;
	begin
		i:= 0;
		writeln ('ingrese el numero de identificacion de la oficina: ');
		readln (num);
		if (num <> -1) then
		begin
			i:= i + 1;
			ofs[i].ident:= num;
			writeln ('dni del propietario: ');
			readln (ofs[i].dni);
			writeln ('valor de las expensas: ');
			readln (ofs[i].expensaV);
		end;
		while (num <> -1) do
		begin
			writeln ('ingrese el numero de identificacion de la oficina: ');
			readln (num);
			if (num <> -1) then
			begin
				i:= i + 1;
				ofs[i].ident:= num;
				writeln ('dni del propietario: ');
				readln (ofs[i].dni);
				writeln ('valor de las expensas: ');
				readln (ofs[i].expensaV);
			end;
		end;
		dimL:= i;
	end;
	
	procedure ordenarInsercion (var ofs: oficinas; dimL: integer);
	var
		i: integer;
		ant: integer;
		act: integer;
	begin
		for i:= 2 to dimL do
		begin
			act:= ofs[i].ident;
			ant:= i-1;
			while (ant > 0) and (ofs[ant].ident > act) do
			begin
				ofs[ant+1].ident:= ofs[ant].ident;
				ant:= ant -1;
			end;
			ofs[ant+1].ident:= act;
		end;
	end;
	
	procedure ordenarSeleccion (var ofs: oficinas; dimL: integer);
	var
		sig: integer;
		i: integer;
		menorPos: integer;
		aux: integer;
	begin
		for i:= 1 to dimL-1 do
		begin
			menorPos:= i;
			for sig:= i+1 to dimL do
			begin
				if (ofs[sig].ident < ofs[menorPos].ident) then
				menorPos:= sig;
			end;
			aux:= ofs[menorPos].ident;
			ofs[menorPos].ident:= ofs[i].ident;
			ofs[i].ident:= aux;
		end;
	end;
			
	
var
	ofs: oficinas;
	dimL: integer;
	i: integer;
begin
	leer (ofs,dimL);
	ordenarSeleccion (ofs, dimL);
	
	//ordenarInsercion (ofs, dimL);
	
	for i:= 1 to dimL do
		writeln (ofs[i].ident);
end.
				
