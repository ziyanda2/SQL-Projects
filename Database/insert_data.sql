USE Student_Management

-- Insert Lecturers
INSERT INTO Lecturers (First_Name, Last_Name, Email, Department, Hire_Date)
VALUES ('Dr. Sarah', 'Chen', 's.chen@university.edu', 'Computer Science', '2018-08-15'),
	('Prof. Michael', 'Rodriguez', 'm.rodriguez@university.edu', 'Mathematics', '2015-03-01'),
	('Dr. Emily', 'Watson', 'e.watson@university.edu', 'Physics', '2020-01-10'),
	('Prof. James', 'Kim', 'j.kim@university.edu', 'Computer Science', '2012-09-15');
	
INSERT INTO Students (First_Name, Last_Name, Email, DOB, Registration_Date, Major, Current_Semester)
VALUES ('Alice', 'Johnson', 'alice.johnson@student.edu', '2002-05-15', '2021-09-01', 'Computer Science', 2),
	('Bob', 'Smith', 'bob.smith@student.edu', '2001-12-03', '2020-09-01', 'Mathematics', 1),
	('Carol', 'Davis', 'carol.davis@student.edu', '2003-02-28', '2022-09-01', 'Physics', 1),
	('David', 'Wilson', 'david.wilson@student.edu', '2002-08-17', '2021-09-01', 'Computer Science', 2),
	('Eva', 'Brown', 'eva.brown@student.edu', '2001-11-11', '2020-09-01', 'Mathematics', 2);
	
INSERT INTO Semesters (Semester_Name, Start_Date, End_Date, Is_Current)
VALUES ('SM2 2022', '2022-09-01', '2022-12-20', FALSE),
	('SM1 2023', '2023-01-15', '2023-05-15', FALSE),
	('SM2 2023', '2023-09-01', '2023-12-20', TRUE);
	
INSERT INTO Courses (Course_Code, Course_Name, Credits, LecturerID, Department)
VALUES ('CS101', 'Introduction to Programming', 3, 1, 'Computer Science'),
	('CS201', 'Data Structures', 4, 4, 'Computer Science'),
	('MATH101', 'Calculus I', 4, 2, 'Mathematics'),
	('MATH201', 'Linear Algebra', 3, 2, 'Mathematics'),
	('PHYS101', 'Classical Mechanics', 4, 3, 'Physics'),
	('CS301', 'Database Systems', 3, 1, 'Computer Science');
	
INSERT INTO Semester_Tests (Test_Name, Test_Weight, SemesterID, CourseID, Total_Marks, Test_Date)
VALUES ('Midterm', 0.40, 1, 1, 100, '2022-10-15'),
	('Final', 0.60, 1, 1, 100, '2022-12-10'),

	('Midterm', 0.40, 1, 3, 100, '2022-10-20'),
	('Final', 0.60, 1, 3, 100, '2022-12-15'),
	
	('Midterm', 0.40, 2, 2, 100, '2023-03-15'),
	('Final', 0.60, 2, 2, 100, '2023-05-05'),

	('Midterm', 0.40, 2, 4, 100, '2023-03-20'),
	('Final', 0.60, 2, 4, 100, '2023-05-10');
	
INSERT INTO Student_Marks (StudentID, TestID, Marks_Obtained, Assessment_Date)
VALUES (1, 1, 82.0, '2022-10-15'),  -- Midterm
	(1, 2, 88.0, '2022-12-10'),  -- Final

	(1, 3, 90.0, '2022-10-20'),  -- Midterm
	(1, 4, 93.0, '2022-12-15'),  -- Final

	(2, 1, 75.0, '2022-10-15'),  -- Midterm
	(2, 2, 80.0, '2022-12-10'),  -- Final

	(2, 3, 85.0, '2022-10-20'),  -- Midterm
	(2, 4, 91.0, '2022-12-15'); -- Final
	
INSERT INTO Semester_Marks (StudentID, SemesterID, CourseID, Final_Marks, Credits_Earned)
VALUES (1, 1, 1, 85.6, 3),  
	(1, 1, 3, 91.8, 4),  

	(2, 1, 1, 78.0, 3),  
	(2, 1, 3, 88.6, 4),  

	(1, 2, 2, 89.2, 4); 