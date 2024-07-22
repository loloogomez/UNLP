program  trenes;
type
	
	mesInt=1..12;
	codDest=1..20;
	
	viaje = record
		cod: integer;
		mes: mesInt;
		pasajeros: integer;
		destino: codDest;
	end;
	
	lista =^nodo;
	
	nodo = record
		elem: viaje;
		sig: lista;
	end;
	
	cantidadPorCodigo = record
		cod: integer;
		cantidad: integer;
	end;
	
	lista2 =^nodo2;
	
	nodo2 = record
		elem: cantidadPorCodigo;
		sig: lista2;
	end;
	
	meses = Array [1..12] of integer;

	procedure leer(var V:viaje);
	begin
		writeln('ingrese codigo de tren:');
		readln(V.cod);
		if (V.cod <> -1) then
		begin
			writeln('ingrese el mes:');
			readln(V.mes);
			writeln('ingrese la cantidad de pasajeros:');
			readln(V.pasajeros);
			writeln('ingrese el destino:');
			readln(V.destino);
		end;
		writeln();
	end;
	
	procedure cargar (var L: lista);
	var
		V:viaje;
		aux,nuevo: lista;
	begin
		leer(V);
		while (V.cod <> -1) do
		begin
			new(nuevo);
			nuevo^.elem := V;
			nuevo^.sig:= nil;
			if (L = nil) then
				L:= nuevo
			else
			begin
				aux:= L;
				while (aux^.sig <> nil) do
					aux:= aux^.sig;
				aux^.sig:= nuevo;
			end;
			leer(V);
		end;
	end;
	
	procedure agregarAtras (var L2: lista2; nodo: lista2);
	var
		aux: lista2;
	begin
		if (L2 = nil) then
			L2 := nodo
		else
		begin
			aux:= L2;
			while (aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig:= nodo;
		end;
	end;
	
	procedure generarLista (L:lista; var L2: lista2; var mes: meses);
	var
		act, total: integer;
		aux:lista2;
	begin
		while (L <> nil) do
		begin
			act:= L^.elem.cod;
			total := 0;
			while (L <> nil) and (act = L^.elem.cod)do
			begin
				total := total + 1;
				mes[L^.elem.mes] := mes[L^.elem.mes] + L^.elem.pasajeros;
				L:= L^.sig;
			end;
			new(aux);
			aux^.elem.cod := act;
			aux^.elem.cantidad := total;
			aux^.sig:= nil;
			agregarAtras(L2, aux);
		end;
	end;
	
	procedure imprimirLista(L2: lista2);
	begin
		while (L2<> nil) do
		begin
			writeln(L2^.elem.cod);
			writeln(L2^.elem.cantidad);
			writeln();
			L2:= L2^.sig;
		end;
	end;
	
	procedure mesMasRecaudado(M: meses);
	var
		i, mayorCantidad, mayorMes: integer;
	begin
		mayorCantidad := 0;
		mayorMes:= 0;
		for i:= 1 to 12 do
		begin
			if (M[i] > mayorCantidad) then
			begin
				mayorCantidad := M[i];
				mayorMes := i;
			end;
		end;
		writeln('el mes que mas se recaudo fue el:', mayorMes);
	end;
	
	procedure inicializarMeses( var M: meses);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			M[i] := 0;
	end;
	
var
	L: lista;
	L2: lista2;
	M: meses;
begin
	L:= nil;
	L2:= nil;
	inicializarMeses(M);
	cargar(L);
	generarLista(L, L2, M);
	imprimirLista(L2);
	mesMasRecaudado(M);
end.
				

			
	
			
	
	
	

