CREATE TABLE Student ( 
StudentID INT PRIMARY KEY, 	
FirstName VARCHAR(50), 
LastName VARCHAR(50), 
Age INT, 
Grade FLOAT, 
Major VARCHAR(50)
 ); 

-- Insert sample records 
INSERT INTO Student VALUES (1, 'John', 'Doe', 20, 85.5, 'Computer Science'); 
INSERT INTO Student VALUES (2, 'Jane', 'Smith', 22, 78.0, 'Biology'); 
INSERT INTO Student VALUES (3, 'Alex', 'Johnson', 21, 92.3, 'Mathematics'); 
INSERT INTO Student VALUES (4, 'Emily', 'Williams', 19, 76.8, 'Physics'); 
INSERT INTO Student VALUES (5, 'Chris', 'Brown', 23, 88.7, 'Chemistry'); 
INSERT INTO Student VALUES (6, 'Megan', 'Taylor', 20, 94.2, 'Psychology'); 
INSERT INTO Student VALUES (7, 'Ryan', 'Miller', 22, 79.5, 'English'); 
INSERT INTO Student VALUES (8, 'Sophia', 'Anderson', 21, 87.1, 'History'); 
INSERT INTO Student VALUES
(9,'Ethan', 'Jones', 21, 75, 'Mathematics'),
(10,'Olivia', 'Wilson', 20, 82, 'Physics'),
(11,'Liam', 'Taylor', 23, 90, 'Chemistry'),
(12,'Ava', 'Anderson', 22, 78, 'Biology'),
(13,'Noah', 'Brown', 21, 85, 'English'),
(14,'Sophia', 'Clark', 20, 91, 'Computer Science'),
(15,'William', 'Martinez', 23, 79, 'Mathematics'),
(16,'Isabella', 'Hernandez', 22, 84, 'Physics'),
(17,'James', 'Young', 21, 87, 'Chemistry'),
(18,'Emma', 'Smith', 22, 88, 'Computer Science');

CREATE TABLE Department ( 
Major VARCHAR(50) PRIMARY KEY, 
DepartmentName VARCHAR(50) 
); 

INSERT INTO Department (Major, DepartmentName) 
VALUES 
('Computer Science', 'Engineering'), 
('Mathematics', 'Science'), 
('Physics', 'Science'), 
('Chemistry', 'Science'), 
('Biology', 'Science'), 
('English', 'Humanities'); 

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Major VARCHAR(50),
    FOREIGN KEY (Major) REFERENCES Department(Major)
);

INSERT INTO Course (CourseID, CourseName, Major) VALUES
(1, 'Introduction to Computer Science', 'Computer Science'),
(2, 'Calculus I', 'Mathematics'),
(3, 'General Physics', 'Physics'),
(4, 'Organic Chemistry', 'Chemistry'),
(5, 'Literature and Composition', 'English'),
(6, 'Data Structures and Algorithms', 'Computer Science'),
(7, 'Linear Algebra', 'Mathematics'),
(8, 'Electricity and Magnetism', 'Physics'),
(9, 'Biochemistry', 'Chemistry'),
(10, 'American Literature', 'English'),
(11, 'Advanced Programming', 'Computer Science'),
(12, 'Differential Equations', 'Mathematics'),
(13, 'Modern Physics', 'Physics'),
(14, 'Inorganic Chemistry', 'Chemistry'),
(15, 'Shakespearean Studies', 'English');

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5,2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID));

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, Grade) VALUES
(1, 1, 1, 90.5),
(2, 2, 2, 85.0),
(3, 3, 3, 92.5),
(4, 4, 4, 88.0),
(5, 5, 5, 95.5),
(6, 6, 6, 91.0),
(7, 7, 7, 89.5),
(8, 8, 8, 93.0),
(9, 9, 9, 90.5),
(10, 10, 10, 94.0),
(11, 11, 11, 87.5),
(12, 12, 12, 84.0),
(13, 13, 13, 91.5),
(14, 14, 14, 88.5),
(15, 15, 15, 96.0);

Select * from Enrollment
Lab 01
SELECT * FROM Student
SELECT firstname, lastname from student
select * from student where studentid = 3
select * from student where age > 21
Select * from student where major = 'chemistry'
select * from student where grade > 80
select * from student where major = 'physics' and grade < 80
select * from student where age in(20, 21)
select * from student where grade between 85 and 90
select * from student where major = 'Computer Science' or major =  'Mathematics'
select * from student order by age desc
select top 3 * from student order by grade desc
select top 2 * from student order by age desc
select top 1 * from student order by grade asc

Lab 02
Select major, avg(grade) as avggrade from student group by major
select major, count(*) as nbrstudent from student group by major
select major, max(age) as oldest from student group by major
select major, sum(grade) as total from student group by major
select age, count(*) as nrstudent from student group by age
select major, avg(age) as avgage from student group by major
select major, min(grade) as smallest from student group by major
select major, age, count(*) as nbr from student group by age, major
select major, age, count(*) as nbstudents, avg(grade) as avggrade from student group by major, age
select top 1 major, max(grade) highestgrade from student group by major order by major desc

select major, avg(grade) as avggrade from student group by major having avg(grade) >80
select major, count(*) nbrstudents from student group by major having count(*) > 1
select major, sum(grade) as titalgrade from student group by major having sum(grade) > 200
select major, max(grade) - min(grade) as diff from student group by major having max(grade) - min(grade) > 10
select major, max(age) - min(age) as agediff from student group by major having max(age) - min(age) >2

Lab 3
--inner join retrieves rows from both tables that satisfy the join condition
Select s.firstname, s.lastname, s.major, d.departmentname
from student s
inner join department d
on s.major = d.Major
--cross join shows all the possible combinations
select s.firstname, s.lastname, s.major, d.departmentname
from Student s 
cross join department d;
--outer join retrieve all rows from one tble and only those rows
--from the other table that satusfy the join condition
--		left join: return all records from the ledt table (table1), and the matching records
--		from the right table (table2). the result is 0 records from the right side, if there is no match
select s.firstname, s.lastname, s.major, d.departmentname
from student s
left outer join department d
on s.major = d.major;
--		right join return all records from the right table (table2), and the matchign
--		records from the left table (table1). everything on right is filled
select s.firstname, s.lastname, s.major, d.departmentname
from student s
right outer join department d
on s.major = d.major;
--full outer join return all records when there is a match in left or right table records
select s.firstname, s.lastname, s.major, d.departmentname
from student s
full outer join department d
on s.major = d.major
--self join joins a table with itself; combines with other rows in the same table based on related columns
select s1.firstname as student1name, s1.lastname as student1lastname,
		s2.firstname as student2firstname, s2.lastname as student2lastname, s1.major
from student s1, student s2
where s1.major = s2.major and s1.studentID != s2.studentid

--inner jion
select s.firstname, s.lastname, c.coursename, e.grade 
from student s
inner join enrollment e on s.studentid = e.studentid 
inner join course c on e.courseid = c.courseid

--left join
select s.firstname, s.lastname, e.courseid, e.grade 
from student s left join enrollment e on s.studentid = e.studentid

--right join
select s.firstname, s.lastname, e.courseid, e.grade
from student s right join enrollment e on s.studentid = e.studentid

--full join
select s.firstname, s.lastname, e.courseid, e.grade
from student s full join enrollment e on s.studentid = e.studentid

--cross join
select s.firstname, s.lastname, c.coursename from student s cross join course c

--union 
select firstname from student union select lastname from student
select major from student union select major from department
--unnion all
select firstname from student union all select lastname from student
select major from student union all select major from department
--intersect
select major from student intersect select major from department
select courseid from course intersect select courseid from enrollment
--except
select major from student except select major from department
select courseid from course except select courseid from enrollment

CREATE TABLE Students ( 
StudentID INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Age INT CHECK (Age >= 18), 
GPA DECIMAL(3, 2) CHECK (GPA BETWEEN 0 AND 4), 
Major VARCHAR(100) 
); 

CREATE TABLE Courses ( 
CourseID INT PRIMARY KEY, 
CourseName VARCHAR(100) NOT NULL, 
Instructor VARCHAR(100), 
Credits INT CHECK (Credits > 0), 
Department VARCHAR(100) 
); 

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA, Major) VALUES 
(1, 'John', 'Doe', 20, 3.5, 'Computer Science'), 
(2, 'Jane', 'Smith', 22, 3.8, 'Biology'), 
(3, 'Alex', 'Johnson', 21, 3.2, 'Mathematics'), 
(4, 'Emily', 'Williams', 19, 3.9, 'Physics'), 
(5, 'Chris', 'Brown', 23, 3.6, 'Chemistry'), 
(6, 'Sarah', 'Davis', 20, 3.7, 'English'), 
(7, 'Michael', 'Taylor', 21, 3.4, 'History'), 
(8, 'Amanda', 'Anderson', 22, 3.1, 'Psychology'); 

INSERT INTO Courses (CourseID, CourseName, Instructor, Credits, Department) VALUES 
(101, 'Introduction to Programming', 'Dr. Smith', 3, 'Computer Science'), 
(102, 'Biology 101', 'Dr. Johnson', 4, 'Biology'), 
(103, 'Calculus I', 'Prof. Brown', 4, 'Mathematics'), 
(104, 'Physics Fundamentals', 'Dr. Williams', 3, 'Physics'), 
(105, 'Organic Chemistry', 'Prof. Davis', 4, 'Chemistry'), 
(106, 'Literature Survey', 'Dr. Taylor', 3, 'English'), 
(107, 'World History', 'Prof. Anderson', 3, 'History'), 
(108, 'Introduction to Psychology', 'Dr. White', 3, 'Psychology'); 

--UPDATE
update students set gpa = 3.5 where gpa  = 3
--DELETE
delete from students where studentid = 3

create table Employee (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DepartmentID INT
);

CREATE TABLE Customer ( 
CustomerID INT UNIQUE, 
FirstName VARCHAR(50), 
LastName VARCHAR(50), 
Email VARCHAR(100) UNIQUE 
); 

CREATE TABLE Product ( 
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL, 
UnitPrice DECIMAL(10, 2), 
UnitsInStock INT NOT NULL 
); 

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY, 
OrderDate DATE, 
TotalAmount DECIMAL(10, 2), 
CONSTRAINT CHK_TotalAmount CHECK (TotalAmount >= 0) ); 

CREATE TABLE OrderDetails ( 
OrderDetailID INT PRIMARY KEY, 
OrderID INT, 
ProductID INT, 
Quantity INT, 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 
); 

ALTER TABLE Employee 
ADD CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID);

ALTER TABLE Customer
DROP CONSTRAINT UC_Email;

alter table product
alter column productname Varchar(100) not null

alter table orders 
add constraint CHK_OrderDate CHECK (OrderDate <= GETDATE());

alter table orderdetails
add constraint FK_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);