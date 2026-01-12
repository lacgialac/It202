create database ss1_bt2;
use ss1_bt2;

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
