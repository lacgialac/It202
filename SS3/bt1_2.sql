drop database if exists bt1_ss3;
create database bt1_ss3;
use bt1_ss3;

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


select * from Student ;
select st_id, st_name from Student;

update Student
set email='lac@gmail.com'
where st_id="sv03";


update Student 
set birth='2004-01-02'
where st_id="sv02";

delete from Student
where st_id='sv03';

select * from Student