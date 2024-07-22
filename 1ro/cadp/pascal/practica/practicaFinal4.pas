program practicaFinal4;
type
	producto = record
		numero: integer;
		cantidadV: integer;
		nombre: string;
	end;
	
	lista= ^nodo;
	
	nodo = record
		elem: producto;
		sig: lista;
	end;
	
	productos = array [1..3] of real;

procedure leerV (var P: producto);
begin
	writeln ('numero de producto: ');
	readln (P.numero);
	if (P.numero <> -1) then
	begin
		writeln ('cantidad de vendida: ');
		readln (P.cantidadV);
		writeln ('nombre del producto: ');
		readln (P.nombre);
	end;
end;

procedure cargarV (var L: lista; var P: producto);
var
	aux: lista;
begin
	leerV (P);
	while (P.numero <> -1) do
	begin
		new (aux);
		aux^.elem := P;
		aux^.sig:= L;
		L:= aux;
		writeln (L^.elem.numero, ', ', L^.elem.nombre, ', ', L^.elem.cantidadV);
		leerV(P);
	end;
	writeln ('carga de ventas finalizada');
end;

procedure cargarP (var PS: productos);
var
	precio: real;
	i: integer;
begin
	for i:= 1 to 3 do
	begin
		writeln ('precio del producto ',i, ': ');
		readln (precio);
		PS[i]:= precio;
	end;
end;

procedure calcular (L: lista; PS: productos);
var
	nomAnt: string;
	ant: integer;
	suma: real;
	menorP: real;
	menor: string;
	
begin
	suma:= 0;
	menorP:= 9999;
	ant:= L^.elem.numero;
	nomAnt := L^.elem.nombre;
	
	while (L <> nil) do
	begin
		if (L^.elem.numero = ant) then
			suma:= suma + L^.elem.cantidadV
		else
		begin
			suma := suma * PS[ant];
			writeln (ant);
			writeln (suma:2:1);
			if (suma < menorP) then
			begin
				menorP := suma;
				menor:= nomAnt;
			end;
			writeln (menorP:2:1);
			ant:= L^.elem.numero;
			suma := L^.elem.cantidadV;
			nomAnt:= L^.elem.nombre;
		end;
		L:= L^.sig;
	end;
	suma := suma * PS[ant];
			writeln (ant);
			writeln (suma:2:1);
			if (suma < menorP) then
			begin
				menorP := suma;
				menor:= nomAnt;
			end;
	writeln ();
	writeln ('el producto que menos ingresos dio al supermercado fue el: ', menor);
end;

var
	L: lista;
	P: producto;
	PS: productos;
begin
	L:= nil;
	cargarP (PS);
	cargarV (L,P);
	calcular (L, PS);
end.
			
	
