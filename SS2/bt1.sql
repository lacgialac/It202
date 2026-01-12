create database ss1_bt1;
use ss1_bt1;

create table class(
	class_id varchar(10) primary key,
    class_name varchar(10) not nULL,
    schoolYear varchar(10) not NULL
);

create table student(
	st_id varchar(10) primary key,
    st_name varchar(10) not null,
    class_id varchar(10)not NULL,
    birth date not NULL,
    constraint fk_calss
		foreign key (class_id)
        references class(class_id)
    
);