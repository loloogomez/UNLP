program ejercicio3;
const
	dimF = 200;

type
	dias = 1..31;
	
	viajes = record
	dia: dias;
	dineroT: real;
	distanciaR: real;
	end;
	
	registro = array [1.. dimF] of viajes;
	viajesXdia = array [1..31] of integer;

procedure leer (var V: viajes);
begin	
	writeln ('dia del viaje: ');
	readln (V. dia);
	writeln ('dinero transportado: ');
	readln (V. dineroT);
	writeln ('distancia recorrida: ');
	readln (V.distanciaR);
end;

procedure contador (var V: viajes; var R: registro; var dimL : integer);
begin
	leer (V);
	if (V. distanciaR <> 0) then
	begin
		R[dimL]:= V;
		dimL:= dimL +1;
	end;
end;

procedure promedio (var V: viajes; var R: registro; var montoP: real; var dimL: integer; var menosD: real; var distanciaM: real; var diaM: dias; var VXD : viajesXdia);
begin
	contador (V, R, dimL);
	if (V.distanciaR <> 0) then
	begin
		montoP := montoP + V.dineroT;
		if ( V.dineroT < menosD) then
		begin
			menosD:= V.dineroT;
			distanciaM:= V.distanciaR;
			diaM:= V.dia;
		end;
		VXD[V.dia]:= VXD[V.dia] + 1;
	end;
end;

procedure eliminar (var R: registro; var dimL: integer );
var
	i: integer;
begin
	for i:= 1 to (dimL-1) do 
	begin
		if (R[i].distanciaR = 100) then
		begin
			R[i]:= R[i+1];
			dimL:= dimL -1;
		end;
	end;
end;

procedure escribir (VXD: viajesXdia; distanciaM: real; diaM: integer ;montoP: real);
var 
	i: integer;
begin
	writeln ();
	writeln ('el monto promedio transportado fue: ', montoP:1:2);
	writeln ();
	writeln ('el dia : ',diaM ,' fue el que se transporto menos dinero, y se recorrieron: ', distanciaM:1:2, ' km');
	writeln ();
	for i:= 1 to 31 do
		writeln( 'el dia ',i, ' se realizaron ',VXD[i], ' envios');
end;
	

var
	V: viajes;
	R: registro;
	dimL: integer;
	montoP, menosD, distanciaM: real;
	VXD: viajesXdia;
	diaM: dias;
	
begin
	menosD:= 9999;
	V.distanciaR := 1;
	dimL:= 1;
	leer (V);
	if (V. distanciaR <> 0) then
		R[dimL]:= V;
	if (V.distanciaR <> 0) then
	begin
		montoP := montoP + V.dineroT;
		if ( V.dineroT < menosD) then
		begin
			menosD:= V.dineroT;
			distanciaM:= V.distanciaR;
			diaM:= V.dia;
		end;
		VXD[V.dia]:= VXD[V.dia] + 1;
	end;
	while ((V.distanciaR <> 0) and (dimL < dimF)) do
		promedio (V, R, montoP, dimL, menosD, distanciaM, diaM, VXD);
	eliminar (R, dimL);
	montoP := montoP / dimL;
	escribir (VXD, distanciaM, diaM, montoP);
end.
