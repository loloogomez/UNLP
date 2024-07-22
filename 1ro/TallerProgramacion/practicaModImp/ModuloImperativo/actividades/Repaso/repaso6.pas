program repaso6;

type
	venta = record
		cod: integer;
		tipo: integer;
		fecha: integer;
		cantidad: integer;
		monto: real;
	end;
	
	producto = record
		cod: integer;
		tipo: integer;
		cantidadT: integer;
		montoT: real;
	end;
	
	arbol =^nodo;
	
	nodo = record
		elem: producto;
		hi: arbol;
		hd: arbol;
	end;
	
procedure leer (var P: producto);
begin
	writeln ('ingrese el codigo del producto: ');
	readln (P.cod);
	if (P.cod <> 0) then
	begin
		writeln ('ingrese el tipo de producto: ');
		readln (P.tipo);
		writeln ('ingrese la cantidad de ventas del producto: ');
		readln (P.cantidadT);
		writeln ('ingrese el monto total recaudado con las ventas de este producto: ');
		readln (P.montoT);
	end;
	writeln ();
end;

procedure 
