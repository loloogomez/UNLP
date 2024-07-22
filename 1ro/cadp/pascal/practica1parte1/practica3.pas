program programa3;

var
	n1,n2,n3: integer;
	mayor,medio,menor: integer;

BEGIN
	write ('ingrese el primer numero: ');
	readln (n1);
	write ('ingrese el segundo numero: ');
	readln (n2);
	write ('ingrese el tercer numero: ');
	readln (n3);
	if (n1 > n2) then
		begin
			mayor:= n1;
			medio:= n2;
		end
	else
		begin
			mayor:= n2;
			medio:= n1;
		end;
	if (medio > n3) then
		begin
			menor:= n3;
		end
	else
		begin
			if (n3 > mayor) then
				begin
					menor:= medio;
					medio:= mayor;
					mayor:= n3;
				end
			else
				begin
					menor:= medio;
					medio:= n3;
				end
		end;
	writeln (mayor,' ', medio,' ', menor);	
		
END.

