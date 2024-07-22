program ejercicio2;
type
	viaje = record
		numV: integer;
		codAuto: integer;
		origen: string;
		destino: string;
		KM: real;
	end;
	
	lista= ^nodo;
	
	nodo = record
		elem: viaje;
		sig: lista;
	end;

procedure leer (var V: viaje);
begin
	writeln ('numero de viaje: ');
	readln (V.numV);
	if (V.numV <> 0) then
	begin
		writeln ('codigo del auto: ');
		readln (V.codAuto);
		writeln ('origen: ');
		readln (V.origen);
		writeln ('destino: ');
		readln (V.destino);
		writeln ('km recorridos: ');
		readln (V.KM);
	end;
end;

procedure cargar (var L: lista; var V: viaje);
var
	aux: lista;
begin
	leer (V);
	aux^.elem := V;
	aux^.sig:= L;
	L:= aux;
	while (V.numV <> 0) do
	begin
		new (aux);
		aux^.elem:= V;
		aux^.sig:= L;
		L:= aux;
		leer (V);
	end;
end;

procedure masKM (L: lista; var KM, KM2: integer);
var
	ant: integer;
	kmn, kmn2, suma: real;
begin
	kmn:= 0;
	kmn2:= 0;
	suma:= 0;
	ant:= L^.elem.codAuto;
	while (L <> nil) do
	begin
		if (L^.elem.codAuto = ant) then
			suma:= suma + L^.elem.KM
		else
		begin
			if (suma > kmn) then
			begin
				kmn2 := kmn;
				kmn:= suma;
				KM2:= KM;
				KM:= ant;
			end
			else
			begin
				if (suma > kmn2) then
			   	begin
					kmn2 := suma;
					KM2:= ant;
				end;
			end;
			suma:= L^.elem.KM;
			ant:= L^.elem.codAuto;
		end;
		L:= L^.sig;
	end;
end;

procedure nuevaL (L: lista; var L2: lista);
var
	ant, act, nuevo: lista;
begin
	while (L <> nil) do
	begin
		new (nuevo);
		nuevo:= L;
		ant:= L2;
		act:= L2;
		if (L^.elem.KM > 5) then
		begin
			while (act <> nil) and (L^.elem.numV < act^.elem.numV)do
			begin
				ant:= act;
				act:= act^.sig;
			end;
			if (ant = act)then
				L2:= nuevo
			else
			begin
				ant^.sig:= nuevo;
				nuevo^.sig:= act;
			end;
		end;
	end;
end;

procedure imprimir(KM, KM2: integer);
begin
	writeln ('el auto que mas km recorrio fue el ', KM, ' y el segundo auto que mas km recorrio fue el ', KM2);
end;

procedure imprimir2 (L2: lista);
begin
	while (L2 <> nil)do
	begin
		writeln (L2^.elem.numV);
		L2:= L2^.sig;
	end;
end;

var
	L, L2: lista;
	V: viaje;
	KM, KM2: integer;
begin
	L:= nil;
	L2:= nil;
	KM:= 0;
	KM2:=0;
	
	cargar (L,V);
	masKM (L, KM, KM2);
	//nuevaL (L, L2);
	imprimir (KM, KM2);
	writeln ();
	//imprimir2 (L);
end.
	
	


		
		
				
