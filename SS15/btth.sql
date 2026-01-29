DROP DATABASE IF EXISTS StudentManagement;
CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
    StudentID CHAR(5) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    TotalDebt DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Subjects (
    SubjectID CHAR(5) PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL,
    Credits INT CHECK (Credits > 0)
);

CREATE TABLE Grades (
    StudentID CHAR(5),
    SubjectID CHAR(5),
    Score DECIMAL(4,2) CHECK (Score BETWEEN 0 AND 10),
    PRIMARY KEY (StudentID, SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

CREATE TABLE GradeLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID CHAR(5),
    OldScore DECIMAL(4,2),
    NewScore DECIMAL(4,2),
    ChangeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);




DELIMITER $$

CREATE TRIGGER tg_CheckScore
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NEW.Score < 0 THEN
        SET NEW.Score = 0;
    ELSEIF NEW.Score > 10 THEN
        SET NEW.Score = 10;
    END IF;
END$$

DELIMITER ;

START TRANSACTION;

INSERT INTO Students (StudentID, FullName)
VALUES ('SV02', 'Ha Bich Ngoc');

UPDATE Students
SET TotalDebt = 5000000
WHERE StudentID = 'SV02';

COMMIT;

DELIMITER $$

CREATE TRIGGER tg_LogGradeUpdate
AFTER UPDATE ON Grades
FOR EACH ROW
BEGIN
    INSERT INTO GradeLog (StudentID, OldScore, NewScore, ChangeDate)
    VALUES (OLD.StudentID, OLD.Score, NEW.Score, NOW());
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_PayTuition()
BEGIN
    START TRANSACTION;

    UPDATE Students
    SET TotalDebt = TotalDebt - 2000000
    WHERE StudentID = 'SV01';

    IF (SELECT TotalDebt FROM Students WHERE StudentID = 'SV01') < 0 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;

