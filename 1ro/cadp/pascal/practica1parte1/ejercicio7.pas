program ejercicio7;

var
	c: integer;
	pa: real;
	np: real;
	p: real;


BEGIN
	while not(c = 32767) do
		begin
			write ('codigo del producto: ');
			readln (c);
			write ('precio actual: ');
			readln (pa);
			write ('nuevo precio: ');
			readln (np);
			p:= (100 / pa) * (np - pa);
			if (p < 10) then
				writeln ('el aumento de precio del producto ', c, ' no supera el 10%')
			else
				writeln ('el aumento de precio del producto ', c, ' es superior al 10%');
		end;			
	
END.

