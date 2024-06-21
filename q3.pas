program CoursesManager;
//-----------------------------------Types-----------------------------------

type 
    CourseType = (REG, LAB, SEM);

    Course = record
        name: string;
        id: integer;
        case cType : CourseType of
            REG : (hours : integer);
            LAB : (profName, location : string);
            SEM : (beginning, ending : string);
    end;

//---------------------------------Variables---------------------------------

var
    courses: array[1000..1100] of Course;  // Array to store up to 100 courses, id range: [1000,1100]
    command: string;
    id: integer;
    courseTypeVar: CourseType;

//---------------------------------Add Course---------------------------------

procedure AddCourse(var id: integer; var courseTypeVar: CourseType);
begin
    readln(courseTypeVar);
    readln(id);
    courses[id].id := id;
    courses[id].cType := courseTypeVar;
    case courseTypeVar of
        REG:
        begin
            readln(courses[id].name);
            readln(courses[id].hours)
        end;
        LAB:
        begin
            readln(courses[id].name);c
            readln(courses[id].profName);
            readln(courses[id].location)
        end;
        SEM:
        begin
            readln(courses[id].name);
            readln(courses[id].beginning);
            readln(courses[id].ending)
        end;
    end;
end;

//---------------------------------Print Course---------------------------------

procedure PrintCourse(var id: integer);
var
    courseTypeVar: CourseType;
begin
    readln(id);
    courseTypeVar := courses[id].cType;
    writeln(courseTypeVar);
    writeln(id);
    case courseTypeVar of
        REG:
        begin
            writeln(courses[id].name);
            writeln(courses[id].hours)
        end;
        LAB:
        begin
            writeln(courses[id].name);
            writeln(courses[id].profName);
            writeln(courses[id].location)
        end;
        SEM:
        begin
            writeln(courses[id].name);
            writeln(courses[id].beginning);
            writeln(courses[id].ending)
        end;
    end;
end;

//---------------------------------Main---------------------------------

begin
    readln(command);
    while (command <> 'END') do
    begin
        if command = 'ADD' then
            AddCourse(id, courseTypeVar)
        else if command = 'PRINT' then
            PrintCourse(id);
        readln(command);
    end;
end.
