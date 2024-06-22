program PascalTriangle;

{ Helper function to calculate the binomial coefficient }
function Binomial(n, r: integer): integer;
begin
  if (r = 0) or (r = n) then
    Binomial := 1
  else
    Binomial := Binomial(n - 1, r - 1) + Binomial(n - 1, r)
end;

//---------------------------------Variables---------------------------------
var n, i, j: integer;
var line: array[0..14] of integer;  // Max 15 rows


//---------------------------------Main---------------------------------
begin
  { Initialize 'line' array }
  for i := 0 to 14 do
    line[i] := 0;

  readln(n);

  for i := 0 to n - 1 do
  begin
    { Construct the new line and then print it. }
    for j := 0 to i do
    begin
      line[j] := Binomial(i, j);
      write(line[j]);  // Print the element
      if (j < i) then  // Add space only if not the last element
        write(' ')
    end;
    writeln // Move to the next line after printing the row
  end
end.
