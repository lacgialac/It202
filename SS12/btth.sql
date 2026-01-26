DROP DATABASE IF EXISTS QLSinhVien;
CREATE DATABASE QLSinhVien;
USE QLSinhVien;

CREATE TABLE Department (
    DeptID CHAR(5) PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID CHAR(6) PRIMARY KEY,
    FullName VARCHAR(50),
    Gender VARCHAR(10),
    BirthDate DATE,
    DeptID CHAR(5),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Course (
    CourseID CHAR(6) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollment (
    StudentID CHAR(6),
    CourseID CHAR(6),
    Score FLOAT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Department VALUES
('D001','Information Technology'),
('D002','Business Administration'),
('D003','Mechanical Engineering');

INSERT INTO Student VALUES
('S00001','Nguyen Van A','Male','2003-01-15','D001'),
('S00002','Tran Thi B','Female','2003-03-22','D001'),
('S00003','Le Van C','Male','2002-07-10','D002'),
('S00004','Pham Thi D','Female','2003-11-05','D003'),
('S00005','Hoang Van E','Male','2002-12-30','D001');

INSERT INTO Enrollment VALUES
('S00001','C00001',8.5),
('S00002','C00001',9.2),
('S00005','C00001',10),
('S00001','C00002',7.5),
('S00003','C00003',8.0),
('S00004','C00002',6.5);


INSERT INTO Course VALUES
('C00001','Database Systems',3),
('C00002','Programming Basics',4),
('C00003','Marketing 101',2);


create or replace view View_StudentBasic as
select StudentID,FullName from Student;

select *from View_StudentBasic;

create index Regular_index
on Student(FullName )

delimiter $$
create procedure GetStudentsIT(
)
begin 
select 
	s.FullName,
    s.Gender,
    s.BirthDate
from Student s
join Department d on  d.DeptID=s.DeptID
where DeptName="Information Technology";


end $$
delimiter ;

call GetStudentsIT();


create or replace View  View_StudentCountByDept as 
select d.DeptName, count(s.DeptID) as  TotalStudents from Department d
join Student s on s.DeptID=d.DeptID
group by d.DeptName, d.DeptID;

select *from View_StudentCountByDept;

select *from View_StudentCountByDept
order by TotalStudents  desc
limit 1;

delimiter $$
create procedure GetTopScoreStudent(
in p_CourseID char(6)
)
begin 
select 
	s.FullName,
    s.Gender,
    s.BirthDate, 
    e.Score
    from Student s

    join Enrollment e on e.StudentID= s.StudentID
    where e.CourseID =p_CourseID
    order by e.Score desc
    limit 1;
    
    
end $$
delimiter ;



call GetTopScoreStudent ("C00001");

drop procedure GetTopScoreStudent;



