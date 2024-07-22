program ejercicio3;

const fin = 30; // 8

type 

info record //268

	nombre: string; //256

	cant: integer; // 8

	datos: integer; // 4
end;

vector = array [3..fin] of ^info; // 28 * 4 = 112

var 
	v: vector; // 112
	i,j: integer; // 16
	e: info; // 268
	
	// mem estatica = 404

begin

	for i:= 3 to 20 do
	begin

		read(e.nombre); read(e.cant); new(V[i]); //17 * 268 = 4.556

		if (e.cant MOD 5 = 0) then 
		begin
			v[i]:= nil;
		end
		else
		begin
			v[i]^.nombre:= e.nombre;
			V[i]^.cant := e.cant + (e.cant div 2);
		end;
	end;
	for j:= 6 to 15 do dispose (V[j]); // - 9 * 268 = -2412
end.

//mem dinamica = 4.556 - 2412 = 2.144
