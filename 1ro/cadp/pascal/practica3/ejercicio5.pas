program ejercicio5;

type
	auto = record
	marca: string;
	modelo : string;
	precio : real;
	end;

procedure leer (var A: auto);
begin
	writeln ('modelo: ');
	readln (A.modelo);
	writeln ('precio: ');
	readln (A.precio);
end;

procedure marcas (var A: auto; var cantidadModelos: integer);
begin
	writeln ('marca: ');
	read (A.marca);
	if (A.marca <> 'ZZZ') then
	begin
		writeln ('cantidad de modelos de esta marca: ');
		readln (cantidadModelos);
	end;
end;

procedure masCaro (var A: auto; var ModeloMC: string; var MarcaMC: string; var PMC: real);
begin
	if (A.precio > PMC) then
	begin
		ModeloMC := A.modelo;
		MarcaMC := A.marca;
		PMC := A.precio;
	end;
end;

procedure precioP (A: auto; cantidadModelos: integer; promedioM: real; var ModeloMC : string; var MarcaMC : string; var PMC : real);
var
	i: integer;
begin
	for i:= 1 to (cantidadModelos) do
	begin
		leer (A);
		promedioM := promedioM + A.precio;
		masCaro (A, ModeloMC, MarcaMC, PMC);
	end;
	promedioM := promedioM / cantidadModelos;
	writeln ('el valor promedio de autos marca ', A.marca, ' es ', promedioM:1:2, '$');
end;

var
	A:auto;
	cantidadModelos: integer;
	promedioM, PMC : real;
	ModeloMC, MarcaMC : string;
begin
	PMC := 0;
	while (A.marca <> 'ZZZ') do
	begin
		marcas (A, cantidadModelos);
		if (A.marca <> 'ZZZ') then
		begin
			precioP (A, cantidadModelos, promedioM, ModeloMC, MarcaMC,PMC);
		end;
	end;
	writeln ('el auto mas caro es marca ', MarcaMC, ' modelo ', ModeloMC);
end.
	
	


	
		
