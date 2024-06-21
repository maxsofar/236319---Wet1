program StringCheck;

var 
    str1, str2, str3: string;
	set1, set2, set3, intersection: Set of char;
	i: integer;
	isMergeLegal: boolean;
	count: array['a'..'z'] of integer;
    c: char;

begin
    //---------------------------------Intialization---------------------------------

    set1 := [];
	set2 := [];
	set3 := [];
	intersection := [];
	for c := 'a' to 'z' do
		count[c] := 0;

    // Reading
	readln(str1);
	readln(str2);
	readln(str3);

    // ------------------Converting to sets and counting letters---------------------

	for i := 1 to Length(str1) do
	begin
		Include(set1, str1[i]);
		count[str1[i]] := count[str1[i]] + 1
	end;

	for i := 1 to Length(str2) do
	begin
		Include(set2, str2[i]);
		count[str2[i]] := count[str2[i]] + 1
	end;

	for i := 1 to Length(str3) do
	begin
		Include(set3, str3[i]);
		count[str3[i]] := count[str3[i]] + 1
	end;

	intersection := set1 * set2;
	isMergeLegal := true;

    //---------------------------------Checks---------------------------------

	// if str3 contains a letter that appears in both str1 and str2
	if (intersection * set3 <> []) then
		isMergeLegal := false;
	
    // if str3 contains a letter that is not in str1 or in str2
	if not (set3 <= (set1 + set2)) then
		isMergeLegal := false;

	// if str3 does not contain at least one letter from each str1 and str2
	if (set3 * set1 = []) or (set3 * set2 = []) then
		isMergeLegal := false;

    //---------------------------------Printing---------------------------------
    
	if isMergeLegal then
		writeln('TRUE')
	else
		writeln('FALSE');

	for c := 'a' to 'z' do
		if (count[c] > 0) then
			writeln(c, ' ', count[c])

end.