-- Final queries
--q1
SELECT FirstName ,SSN, NumberOfPieces FROM student , help , helpreceived
WHERE ( student.SSN = helpreceived.StudntID AND
        help.DateRecieved = helpreceived.HelpDate AND
        help.Kind = helpreceived.Helpkind );

--q2
SELECT student.SSN,COUNT(*) from studentlesson,class,student,lesson
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN
      and lesson.ClassID = class.Code and lesson.ClassID = studentlesson.ClassID and lesson.LessonDate = studentlesson.LessonDate)
GROUP BY student.SSN;

--q3
SELECT DISTINCT student.SSN ,student.FirstName,student.LastName, volunteer.FirstName from student,studentclass,class,volunteer
WHERE (student.SSN = studentclass.StudentID and studentclass.ClassID = class.Code and class.Teacher = volunteer.SSN)
order by student.FirstName;



--       before      stored procedures      index tuning      query_optimization
--q1     0.0110       0.4923                  0.0023            0.0099
--q2     0.0108       0.0010                  0.0031            0.0048
--q3     0.7388       exceeded 300 s          0.7121            0.7350 


-- queries after optmization 
--q1
SELECT FirstName, SSN, NumberOfPieces 
FROM ( ( 
    SELECT NumberOfPieces, StudntID 
    FROM help JOIN helpreceived on 
    HelpDate=DateRecieved AND Kind = Helpkind ) 
    as STDHELP ), 
    ( ( 
        Select FirstName, SSN 
        from student )
         as STDNAME )
          WHERE STDNAME.SSN=STDHELP.StudntID

--q2
SELECT SSN,COUNT(*) FROM
(
    (SELECT * FROM
        ((SELECT SSN FROM student WHERE SSN<100) as S) JOIN
            ((SELECT * FROM studentlesson WHERE Attended = 1) AS SL) on
                S.SSN = SL.StudentID
    ) AS lefttable
),
 (
    (SELECT * From lesson JOIN (
        ((SELECT Code FROM class) AS C)
    ) ON lesson.ClassID = C.Code) AS righttable
) 
Where lefttable.ClassID = righttable.ClassID and lefttable.LessonDate = righttable.LessonDate
GROUP BY lefttable.SSN;



--q3
SELECT DISTINCT T.SSN ,T.FirstName,T.LastName, CV.FirstName 
FROM studentclass, 
( (SELECT SSN, FirstName, LastName FROM student) AS T ), 
( (SELECT FirstName, Code FROM ((SELECT Code, Teacher from class) AS C) 
JOIN ((SELECT FirstName,SSN FROM volunteer) AS V) ON C.Teacher = V.SSN) AS CV ) 
WHERE T.SSN = studentclass.StudentID and studentclass.ClassID = CV.Code 
order by T.FirstName


-- q1:
-- index student.ssn
-- index added helpreceived.StudntID ->0.0097 
-- then index added on help.kind -> time 0.0023

-- q2:
--class.code 0.0062 
--studentlesson.StudentID  0.0031
-- studentlesson.Attended  // Not nessesary ?

--q3
--class.code  0.7315 
--studentclass.StudentID 0.7168 
-- student.FirstName 0.7121  
