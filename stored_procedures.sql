DELIMITER  //
CREATE PROCEDURE  `get_aided_students`()
BEGIN
SELECT FirstName ,SSN, NumberOfPieces FROM student , help , helpreceived
WHERE ( student.SSN = helpreceived.StudntID AND
        help.DateRecieved = helpreceived.HelpDate AND
        help.Kind = helpreceived.Helpkind );

END//
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE  `get_class_attendance_count`()
BEGIN
SELECT student.SSN,COUNT(*) from studentlesson,class,student,lesson
WHERE (studentlesson.Attended = 1 and(class.Code= 1 or class.Code =2) and student.SSN<100 and studentlesson.StudentID = student.SSN
      and lesson.ClassID = class.Code)
GROUP BY student.SSN;
END$$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE  `get_students_&_volunteer_info`()
BEGIN

SELECT DISTINCT student.SSN ,student.FirstName,student.LastName, volunteer.FirstName from student,studentclass,class,volunteer
WHERE (student.SSN = studentclass.StudentID and studentclass.ClassID = class.Code and class.Teacher = volunteer.SSN)
order by student.FirstName;
END//
DELIMITER ;