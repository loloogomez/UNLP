program ejercicio4;

const
	clientes = 9300;
	P_Minuto = 3.40;
	P_MB = 1.35;

type
	linea = record
	tel: real;
	min: integer;
	mb: integer;
	end;

procedure leer_L (var L:linea);
begin
	writeln ('numero de telefono: ');
	readln (L.tel);
	writeln ('cantidad de minutos consumidos: ');
	readln (L.min);
	writeln ('cantidad de mb consumidos: ');
	readln (L.mb);
end;

procedure leer_C (var numero_C: integer; var cantidad_L: integer);
begin
	writeln ('codigo de cliente: ');
	readln (numero_C);
	writeln ('cantidad de lineas: ');
	readln (cantidad_L);
end;

procedure cliente (L: linea; numero_C: integer; cantidad_L: integer);
var
	i: integer;
	pagar: real;
begin
	for i:= 1 to (cantidad_L) do
	begin
		leer_L (L);
		pagar:= pagar + (L.min * P_Minuto) + (L.mb * p_MB);
	end;
	writeln ('el cliente ', numero_C, ' debe pagar: ', pagar:1:2, '$');
end;

var
	L: linea;
	i, numero_C, cantidad_L: integer;
begin
	for i:= 1 to 9300 do
	begin
		leer_C (numero_C, cantidad_L);
		cliente (L, numero_C, cantidad_L);
	end;
end.
	
		
		
