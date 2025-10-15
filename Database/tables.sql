-- Create Database
CREATE DATABASE Student_Management
USE Student_Management

-- Lecturers table
CREATE TABLE Lecturers (
	LecturerID int PRIMARY KEY AUTO_INCREMENT,
	First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
	Email VARCHAR(100),
	Department VARCHAR(100),
	Hire_Date DATE
);

-- Student table
CREATE TABLE Students (
	StudentID int PRIMARY KEY AUTO_INCREMENT,
	First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
	Email VARCHAR(100),
	DOB DATE,
	Registration_Date DATE,
	Major VARCHAR(100),
	Current_Semester int
);

-- Semester table
CREATE TABLE Semesters (
	SemesterID int PRIMARY KEY AUTO_INCREMENT,
	Semester_Name VARCHAR(30) NOT NULL,
	Start_Date DATE,
	End_Date DATE,
	Is_Current BOOLEAN DEFAULT FALSE
);

-- Course table
CREATE TABLE Courses (
	CourseID int PRIMARY KEY AUTO_INCREMENT,
	Course_Code VARCHAR(20) UNIQUE NOT NULL,
	Course_Name VARCHAR(100) NOT NULL,
	Credits int,
	LecturerID int,
	Department VARCHAR(100),
	FOREIGN KEY (LecturerID) REFERENCES Lecturers(LecturerID)
);


-- Semester Test table
CREATE TABLE Semester_Tests (
	TestID int PRIMARY KEY AUTO_INCREMENT,
	Test_Name VARCHAR(50) NOT NULL,
	Test_Weight DECIMAL(5,2) NOT NULL,
	SemesterID int NOT NULL,
	CourseID int NOT NULL,
	Total_Marks DECIMAL(5,2) DEFAULT 100.00,
	Test_Date DATE,
	FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Student Marks table
CREATE TABLE Student_Marks (
	MarkID int PRIMARY KEY AUTO_INCREMENT,
	StudentID int NOT NULL,
	TestID int NOT NULL,
	Marks_Obtained DECIMAL(5,2),
	Assessment_Date DATE,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (TestID) REFERENCES Semester_Tests(TestID),
	UNIQUE KEY Unique_Student_Test (StudentID, TestID)
);

-- Student Semester Marks
CREATE TABLE Semester_Marks (
	Semester_Mark_ID int PRIMARY KEY AUTO_INCREMENT,
	StudentID int NOT NULL,
	SemesterID int NOT NULL,
	CourseID int NOT NULL,
	Final_Marks DECIMAL(5,2),
	Credits_Earned int,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	UNIQUE KEY Unique_Student_Semester_Course (StudentID, SemesterID, CourseID)
);


	