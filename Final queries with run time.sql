-- Final queries
--q1
SELECT FirstName ,SSN, NumberOfPieces FROM student , help , helpreceived
WHERE ( student.SSN = helpreceived.StudntID AND
        help.DateRecieved = helpreceived.HelpDate AND
        help.Kind = helpreceived.Helpkind );

--q2
SELECT student.SSN,COUNT(*) from studentlesson,class,student,lesson
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN
      and lesson.ClassID = class.Code)
GROUP BY student.SSN;

--q3
SELECT DISTINCT student.SSN ,student.FirstName,student.LastName, volunteer.FirstName from student,studentclass,class,volunteer
WHERE (student.SSN = studentclass.StudentID and studentclass.ClassID = class.Code and class.Teacher = volunteer.SSN)
order by student.FirstName;



--       before      stored procedures      index tuning
--q1     0.0110       0.4951
--q2     0.0073       0.0055
--q3     0.7388       exceeded 300 s