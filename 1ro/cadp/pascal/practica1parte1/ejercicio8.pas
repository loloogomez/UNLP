program ejercicio8;

var
	L1: char;
	L2: char;
	L3: char;
	v: integer;
	
BEGIN
	write ('ingrese la primera letra: ');
	readln (L1);
	write ('ingrese la segunda letra: ');
	readln (L2);
	write ('ingrese la tercer letra: ');
	readln (L3);
	if ((L1 = 'a') or (L1 = 'e') or (L1 = 'i') or (L1 = 'o') or (L1 = 'u')) then
		v:= v + 1;
	if ((L2 = 'a') or (L2 = 'e') or (L2 = 'i') or (L2 = 'o') or (L2 = 'u')) then
		v:= v + 1;
	if ((L3 = 'a') or (L3 = 'e') or (L3 = 'i') or (L3 = 'o') or (L3 = 'u')) then
		v:= v + 1;
	writeln;
	if (v = 3) then
		writeln ('los tres son vocales')
	else
		writeln ('al menos un caracter no es vocal');
	
END.

