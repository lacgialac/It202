DROP DATABASE IF EXISTS ss1_bt3;
create database ss1_bt3;
use ss1_bt3;

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL
);

CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    CHECK (credit > 0)
);

create table dangky(
	st_id varchar(10) not null,
    sj_id varchar(10) not null,
    date_dk date not NUll,
     primary key(st_id, sj_id),
     
     constraint fk_st
      foreign key(st_id)
      references student(student_id),
      
       CONSTRAINT fk_enroll_subject
        FOREIGN KEY (sj_id)
        REFERENCES Subject(subject_id)
);
