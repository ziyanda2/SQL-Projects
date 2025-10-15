-- Students with their details
SELECT 
	StudentID,
	CONCAT(First_Name, ' ', Last_Name) AS Student_Name,
	Email,
	Major,
	Current_Semester,
	Registration_Date
FROM Students
ORDER BY Current_Semester DESC, Student_Name;

-- Lecturers by Department
SELECT
	LecturerID,
	CONCAT(First_Name, ' ', Last_Name),
	Department,
	Email,
	Hire_Date
FROM Lecturers
ORDER BY Department, Last_Name;

-- Courses with Assigned Lecturers
SELECT
	c.Course_Code,
	c.Course_Name,
	c.Credits,
	c.Department,
	CONCAT(l.First_Name, ' ', l.Last_Name) AS Lecturer_Name
FROM Courses c
LEFT JOIN Lecturers l on c.LecturerID = l.LecturerID
ORDER BY c.Department, c.Course_Code;