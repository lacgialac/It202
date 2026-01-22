drop database if exists btth2_ss8;
create database  btth2_ss8;
use  btth2_ss8;


CREATE TABLE Patient (
    patient_id VARCHAR(5) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id VARCHAR(5) PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    service_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('Active', 'On Leave', 'Retired'))
);

CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(5) NOT NULL,
    doctor_id VARCHAR(5) NOT NULL,
    appointment_date DATE NOT NULL,
    shift_time VARCHAR(20),

    CONSTRAINT fk_patient
        FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    CONSTRAINT fk_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);


CREATE TABLE Prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis VARCHAR(255),
    total_cost DECIMAL(10,2) NOT NULL,
    created_date DATE NOT NULL,

    CONSTRAINT fk_appointment
        FOREIGN KEY (appointment_id)
        REFERENCES Appointment(appointment_id)
);

INSERT INTO Patient (patient_id, full_name, gender, phone, address) VALUES
('P01', 'Nguyen Van An', 'Nam', '0988111111', 'Ha Noi'),
('P02', 'Tran Thi Binh', 'Nu', '0988222222', 'HCM'),
('P03', 'Le Van Cuong', 'Nam', '0988333333', 'Da Nang'),
('P04', 'Pham Thi Dung', 'Nu', '0988444444', 'Ha Noi'),
('P05', 'Hoang Van Em', 'Nam', '0988555555', 'Can Tho');

INSERT INTO Doctor (doctor_id, doctor_name, specialization, service_price, status) VALUES
('D01', 'Dr. Alice', 'Noi Khoa', 200.00, 'Active'),
('D02', 'Dr. Bob', 'Nhi Khoa', 150.00, 'Active'),
('D03', 'Dr. Charlie', 'Rang Ham Mat', 300.00, 'On Leave'),
('D04', 'Dr. David', 'Noi Khoa', 220.00, 'Active'),
('D05', 'Dr. Eve', 'Da Lieu', 250.00, 'Retired');


INSERT INTO Appointment (patient_id, doctor_id, appointment_date, shift_time) VALUES
('P01', 'D01', '2025-06-01', 'Sang'),
('P02', 'D02', '2025-06-02', 'Chieu'),
('P03', 'D03', '2025-06-03', 'Sang'),
('P01', 'D04', '2025-06-04', 'Chieu'),
('P05', 'D02', '2025-06-05', 'Sang');

INSERT INTO Prescription (appointment_id, diagnosis, total_cost, created_date) VALUES
(1, 'Viem hong', 500.00, '2025-06-01'),
(2, 'Sot xuat huyet', 800.00, '2025-06-02'),
(3, 'Nho rang', 400.00, '2025-06-03'),
(4, 'Dau da day', 600.00, '2025-06-04'),
(5, 'Di ung da', 300.00, '2025-06-01'),
(5, 'Di ung da', 100.00, '2025-05-01');




update Patient
set address="hue"
where patient_id ="P03";
select *from Patient;

update Doctor
set status='retired', service_price=0
where doctor_id="D05";
select *from Doctor;

SELECT prescription_id
FROM Prescription
WHERE total_cost < 400
  AND created_date < '2025-06-04';
  
  select * from Prescription;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Prescription
WHERE total_cost < 400
  AND created_date < '2025-06-04';

SET SQL_SAFE_UPDATES = 1;


select *from doctor
where specialization='Noi Khoa'
		and service_price>200;
        
select  doctor_id, doctor_name, service_price from Doctor
order by service_price desc;

select * from Prescription 
order by total_cost desc
limit 3;

select *from Patient
limit 3 offset 1






