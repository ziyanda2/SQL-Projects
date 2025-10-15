-- Student Marks with Course Details
SELECT
	s.StudentID,
	CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
	c.Course_Code,
	c.Course_Name,
	st.Test_Name,
	st.Test_Weight,
	sm.Marks_Obtained,
	st.Total_Marks,
	ROUND((sm.Marks_Obtained / st.Total_Marks) * 100, 2) AS percentage,
	sem.Semester_Name
FROM Student_Marks sm
JOIN Students s ON sm.StudentID = s.StudentID
JOIN Semester_Tests st on sm.TestID = st.TestID
JOIN Courses c ON st.CourseID = c.CourseID
JOIN Semesters sem ON st.SemesterID = sem.SemesterID
ORDER BY sem.Semester_Name, s.StudentID, c.Course_Code;

-- Top performing students overall
SELECT
	s.StudentID,
	CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
	s.Major,
	COUNT(sm.TestID) AS Tests_Taken,
	ROUND(AVG(sm.Marks_Obtained), 2) AS Average_Marks
FROM Students s
JOIN Student_Marks sm ON s.StudentID = sm.StudentID
GROUP BY s.StudentID, Student_Name, s.Major
HAVING COUNT(sm.TestID) >= 2
ORDER BY Average_Marks DESC;

-- Student Final Marks
SELECT
	s.StudentID,
	CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
	c.Course_Code,
	c.Course_Name,
	sem.Semester_Name,
	ROUND(SUM(sm.Marks_Obtained * st.Test_Weight), 2) AS Final_Marks,
	COUNT(st.TestID) AS Tests_Completed
FROM Students s
JOIN Student_Marks sm ON s.StudentID = sm.StudentID
JOIN Semester_Tests st ON sm.TestID = st.TestID
JOIN Courses c ON st.CourseID = c.CourseID
JOIN Semesters sem ON st.SemesterID =  sem.SemesterID
GROUP BY s.StudentID, Student_Name, c.Course_Code, c.Course_Name, sem.SemesterID, sem.Semester_Name
HAVING Tests_Completed >= 1
ORDER BY sem.Semester_Name, Final_Marks DESC;