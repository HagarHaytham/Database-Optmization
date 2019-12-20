SELECT FirstName ,SSN, NumberOfPieces from student , help,helpreceived
where ( student.SSN = helpreceived.StudntID and help.DateRecieved = helpreceived.HelpDate and help.Kind = helpreceived.Helpkind )

SELECT DISTINCT student.SSN ,student.FirstName,student.LastName, volunteer.FirstName from student,studentclass,class,volunteer
WHERE (student.SSN = studentclass.StudentID and studentclass.ClassID = class.Code and class.Teacher = volunteer.SSN)
order by student.FirstName

SELECT COUNT(*) from studentlesson,class
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2))

SELECT student.SSN,COUNT(*) from studentlesson,class,student
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100)
GROUP BY student.SSN
SELECT student.SSN,COUNT(*) from studentlesson,class,student,lesson
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN
      and lesson.ClassID = class.Code)
GROUP BY student.SSN


-- SELECT student.SSN, SUM(studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN and lesson.ClassID = class.Code)
-- FROM    studentlesson,class,student,lesson
-- GROUP BY student.SSN

-- SELECT student.SSN, SUM(studentlesson.Attended = 1) 
-- FROM    studentlesson,class,student,lesson
-- WHERE  ((class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN and lesson.ClassID = class.Code)
-- GROUP BY student.SSN


-- SELECT * from (
-- SELECT * from (SELECT student.SSn,student.FirstName,studentlesson.* from student,studentlesson
-- WHERE student.SSN = studentlesson.StudentID)
-- WHERE studentlesson.ClassID =1)
-- WHERE studentlesson.Attended =1



SELECT * from(
    SELECT t1.SSn,t1.Attended from (
        SELECT student.SSn,student.FirstName,studentlesson.* from student,studentlesson
		WHERE student.SSN = studentlesson.StudentID ) As t1
	WHERE t1.ClassID =1) As t2
WHERE t2.Attended =1

