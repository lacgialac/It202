drop database if exists bt4_ss5;
create database bt4_ss5;
use bt4_ss5;
 create table Products(
		  order_id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    status VARCHAR(20) NOT NULL
 );
 
 INSERT INTO Products (quantity, status)
VALUES
(5, 'completed'),
(12, 'pending'),
(8, 'completed'),
(20, 'completed'),
(3, 'cancelled'),
(15, 'pending'),
(5, 'completed'),
(12, 'pending'),
(8, 'completed'),
(20, 'completed'),
(3, 'cancelled'),
(15, 'pending'),
(5, 'completed'),
(12, 'pending'),
(8, 'completed'),
(20, 'completed'),
(3, 'cancelled'),
(15, 'pending');




select *from Products
limit 5 offset 0;

select *from Products
limit 5 offset 5;

select *from Products
limit 5 offset 10;



