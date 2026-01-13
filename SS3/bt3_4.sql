drop database if exists bt3_ss3;
create database bt3_ss3;
use bt3_ss3;

create table Subject(
	sj_id varchar(10) primary key,
    sj_name varchar(10) not null,
    credit int not null
    check(credit>0)
);


create table Student(
	st_id varchar(10) primary key,
    st_name varchar(15) not null,
    birth date not null,
    email varchar(20) not null
);

insert into Student(st_id, st_name, birth,email)
values 
 ('SV01', 'Nguyen A', '2004-05-10', 'a@gmail.com'),
    ('SV02', 'Tran B', '2003-09-22', 'b@gmail.com'),
    ('SV03', 'Le C', '2004-01-15', 'c@gmail.com');



insert into Subject(sj_id, sj_name, credit)
values 
('SJ01', 'Toan', 3),
('SJ02', 'Ly', 4),
('SJ03', 'Hoa', 3),
('SJ04', 'Tin', 2),
('SJ05', 'Anh', 3);

update Subject
set credit=200
where sj_id="sj01";

update Subject
set sj_name="lac"
where sj_id="sj02";


SELECT * FROM Subject;

