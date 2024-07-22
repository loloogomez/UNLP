program practicaFinal10102023;
type

	codigoSucursal=1..5;

	factura = record
		num:integer;
		codCliente:integer;
		sucursal: codigoSucursal;
		monto: real;
	end;
	
	lista=^nodo;
	
	nodo = record
		elem:factura;
		sig:lista;
	end;
	
procedure leer (var F: factura);
begin
	writeln('ingrese el numero de factura:');
	readln(F.num);
	if (F.num <> -1) then
	begin
		writeln('ingrese el codigo de cliente:');
		readln(F.codCliente);
		writeln('ingrese el codigo de sucursal (1..5):');
		readln(F.sucursal);
		writeln('ingrese el monto total:');
		readln(F.monto);
	end;
end;

procedure agregarAtras (var L: lista);
var
	nuevo,aux: lista;
	F:factura;
begin
	leer(F);
	while (F.num <> -1) do
	begin
		new(nuevo);
		nuevo^.elem:= F;
		nuevo^.sig:= nil;
		if (L = nil) then
			L:= nuevo
		else
		begin
			aux:= L;
			while (aux^.sig <> nil)do
				aux:= aux^.sig;
			aux^.sig:= nuevo;
		end;
		leer(F);
	end;
end;
	
procedure eliminarPorSucursal(numSucursal: codigoSucursal;var L:lista);
var
	ant, aux:lista;
begin
	aux:= L;
	ant:= nil;
	while (aux <> nil) do
	begin
		if(aux^.elem.sucursal = numSucursal)then
		begin
			if (ant = nil)then
			begin
				L:= aux^.sig
			end
			else
			begin	
				ant^.sig:= aux^.sig
			end;
		end;
		ant:= aux;
		aux:= aux^.sig;
	end;
end;

procedure imprimir (L:lista);
begin
	while (L<>nil)do
	begin
		writeln(L^.elem.num);
		writeln(L^.elem.sucursal);
		L:= L^.sig;
	end;
end;

var
	L:lista;
	sucursal: codigoSucursal;
begin
	L:= nil;
	agregarAtras(L);
	imprimir(L);
	writeln('ingrese el numero de sucursal que desea eliminar(1..5):');
	readln(sucursal);
	eliminarPorSucursal(sucursal, L);
	imprimir(L);
end.
	
