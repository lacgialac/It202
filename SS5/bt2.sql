drop database if exists bt2_ss4;
create database bt2_ss4;
use bt2_ss4;
 create table Customers(
	c int primary key auto_increment,
    c_name varchar(255) not null,
    email varchar(255) not null,
    city varchar(255) not null,
    status enum("active", "inactive")
 );
 
 insert into Customers(c_name, email, city, status)
 values
 ('Nguyễn Văn A', 'a@gmail.com', 'Hà Nội', 'active'),
('Trần Thị B', 'b@gmail.com', 'TP.HCM', 'active'),
('Lê Văn C', 'c@gmail.com', 'Đà Nẵng', 'inactive'),
('Phạm Thị D', 'd@gmail.com', 'Cần Thơ', 'active'),
('aoàng Văn E', 'e@gmail.com', 'Hải Phòng', 'inactive');

 select *from Customers;
 
 select *from Customers
 where city="TP.HCM";
 
 select *from Customers
 where city="Hà Nội" and status ="active";
 
 select *from Customers
 order by c_name ASC





