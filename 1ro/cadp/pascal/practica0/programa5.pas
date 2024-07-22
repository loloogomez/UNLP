program programa5;

var
	caramelos: integer;
	personas: integer;
	vendidos: integer;
	del_kiosquero: integer;
	ganancia: real;
	
BEGIN
	write ('numero de caramelos ');
	readln (caramelos);
	write ('numero de personas ');
	readln (personas);
	vendidos:= caramelos div personas;
	del_kiosquero:= caramelos mod personas;
	ganancia:= vendidos * personas * 1.6;
	writeln ('a cada cliente le corresponden ', vendidos, ' caramelos');
	writeln ('el kiosquero se queda con ', del_kiosquero, ' caramelos');
	writeln ('el kiosquero va a cobrar ', ganancia:1:2, ' pesos');
END.

