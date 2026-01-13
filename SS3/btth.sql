drop database if exists btth;
create database btth;
use btth;

create table if not exists Student (
	st_id bigint auto_increment primary key,
    st_mssv char(10) not null,
    st_name varchar(200) not null,
    birth date not null,
    gender bit not null,
    address varchar(200) not null
    
    
);



create table if not exists Subject(
	sj_id bigint auto_increment primary key,
    sj_name varchar(15) not null,
    duration int not null,
    session int not null,
	type varchar(45) not null,
    semester char(15) not null,
    price varchar(20) not null
);

create table if not exists Register(
	st_id bigint not null,
    sj_id bigint not null,
    create_at timestamp default current_timestamp,
    price decimal(7, 2)not null,
    description varchar(200) ,
    
    
    
    primary key(st_id, sj_id),
    
    constraint fk_st
    foreign key(st_id)
    references Student(st_id),
    
    constraint fk_class
    foreign key(sj_id)
    references Subject(sj_id)
);

alter table Student
add st_phone varchar(10);

alter table Student
add email varchar(50) not null unique after st_name;

alter table Student 
add constraint uq_email unique (email);

alter table Student rename column email to email_persion;

alter table Subject
modify semester varchar(50);

alter table Subject
add constraint price
check(price>0);

alter table Subject
drop column semester;

alter table Register
add semester varchar(50) not null ;




insert into Student(st_mssv, st_name,email_persion, birth, gender, address,st_phone)
values
('SV001', 'Nguyen Van An', 'aaan@gmail.com',   '2004-05-12', 1, 'Ha Noi',         '0912345678'),
('SV002', 'Tran Thi Binh', 'binh@gmail.com', '2003-09-20', 0, 'TP Ho Chi Minh', '0923456789'),
('SV003', 'Le Minh Chau',  'chau@gmail.com', '2004-01-15', 0, 'Da Nang',        '0934567890'),
('SV004', 'Pham Quoc Dat', 'dat@gmail.com',  '2003-11-30', 1, 'Can Tho',        '0945678901'),
('SV005', 'Vo Thanh Em',   'em@gmail.com',   '2004-07-08', 1, 'Vung Tau',       '0956789012');

update Student
set st_name="laclatlac"
where st_id='2';

alter table Student
add constraint un_code unique(st_mssv)







