drop database if exists hethong_tructuyen;
create database hethong_tructuyen ;
use hethong_tructuyen;

create table Student (
	id bigint primary key auto_increment,
    mssv char(10) not null unique,
    name varchar(50) not null,
    birth date not null,
    email varchar(100) not null unique
);

create table Course(
	id bigint primary key auto_increment,
    name varchar(100) not null,
    desription varchar(200) not null,
    total_session int not null
);

create table Teacher(
	id bigint auto_increment primary key,
    code char(10) not null,
    name varchar(50) not  null,
    email varchar(100) not null unique
);

create table Enrollment(
	st_id bigint not null ,
    course_id bigint not null,
    create_at timestamp default current_timestamp,
    
    primary key(st_id, course_id),
		constraint fk_st
		foreign key(st_id)
        references Student(id),
        
        constraint fk_course
        foreign key(course_id)
        references Course(id)
    
);


create table Score(
	st_id bigint not null , 
    course_id bigint not null,
    score float check (score between 0 and 10),
    result varchar(20),
    
    
    primary key(st_id, course_id),
    
    constraint fk_st_score
		foreign key(st_id)
        references Student(id),
        
	constraint fk_course_score
		foreign key(course_id)
        references Course(id)
);



insert into Student (mssv, name, birth, email)
values
('SV00000001', 'Nguyen Van A', '2002-05-12', 'vana@gmail.com'),
('SV00000002', 'Tran Thi B', '2001-09-20', 'thib@gmail.com'),
('SV00000003', 'Le Van C', '2002-01-15', 'vanc@gmail.com'),
('SV00000004', 'Pham Thi D', '2003-03-08', 'thid@gmail.com'),
('SV00000005', 'Hoang Van E', '2001-11-30', 'vane@gmail.com');


insert into Course (name, desription, total_session)
values
('Database Fundamentals', 'Basic database concepts and SQL', 12),
('Web Programming', 'HTML CSS JavaScript basics', 15),
('Data Structures', 'Linked list, stack, queue, tree', 18),
('Software Engineering', 'Software development process', 10),
('Operating Systems', 'Process, memory, and file system', 14);

insert into Teacher (code, name, email)
values
('GV00000001', 'Nguyen Minh Tuan', 'tuan@gmail.com'),
('GV00000002', 'Tran Hong Lan', 'lan@gmail.com'),
('GV00000003', 'Le Duc Anh', 'anh@gmail.com');

insert into Enrollment(st_id, course_id)
values
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5);

insert into Score (st_id, course_id, score, result)
values
(1, 1, 8.5, 'Pass'),
(1, 2, 7.0, 'Pass'),
(2, 1, 5.5, 'Pass'),
(2, 3, 4.0, 'Fail'),
(3, 2, 9.0, 'Pass'),
(4, 4, 6.5, 'Pass');



update Student 
set email="laclaclat@gmail.com"
where mssv="SV00000001";

update Course 
set desription="laclalcalcla"
where id =2;

update Score 
set score =10
where st_id =2;

delete from Enrollment 
where st_id>4;

delete from Score 
where score <5;

select *from Student ;
select *from Teacher ;
select *from Course ;
select *from Enrollment ;
select *from Score ;



