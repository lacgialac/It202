drop database if exists bt2_ss6;
create database bt2_ss6;
use bt2_ss6;

 create table Customers(
		c_id int primary key auto_increment,
        name varchar(255) not null,
        city varchar(255) not null
 );
 
  create table Orders(
		o_id int primary key auto_increment,
        co_id int not null,
        order_date date,
total_amount decimal(10,2) default 0,
        status enum("pending", "completed", "cancelled")
 );
 
 INSERT INTO Customers (name, city)
VALUES
('An', 'Hà Nội'),
('Bình', 'TP.HCM'),
('Chi', 'Đà Nẵng'),
('Dũng', 'Hà Nội'),
('Hà', 'Cần Thơ');

 
 
INSERT INTO Orders (co_id, order_date, total_amount, status)
VALUES
(1, '2024-01-05', 500000, 'completed'),
(1, '2024-01-20', 300000, 'pending'),

(2, '2024-02-10', 800000, 'completed'),
(2, '2024-02-18', 200000, 'cancelled'),

(3, '2024-03-01', 400000, 'completed'),
(3, '2024-03-15', 600000, 'completed'),

(4, '2024-03-20', 250000, 'pending');




SELECT * FROM Customers;
SELECT * FROM Orders;

select o.o_id,
		c.name as customer_name,
        o.order_date,
        o.status
        
from Orders o 
inner join Customers c on o.c_id = c.c_id;



SELECT 
    c.c_id,
    c.name AS customer_name,
    COUNT(o.o_id) AS "tong so don hang cua moi cus"
FROM Customers c
LEFT JOIN Orders o ON o.co_id = c.c_id
GROUP BY c.c_id, c.name
having count(o.o_id) >=1;

select
	c.c_id,
    c.name as customername,
    sum(o.total_amount) as tongtiendachi
	

from Customers c
left join Orders o on o.co_id=c.c_id 
group by c.c_id, c.name;

select 
	c.c_id,
    c.name as customer_name,
    max(o.total_amount) as tiencaonhat
from Customers c
left join Orders o on o.co_id=c.c_id
group by c.c_id,c.name;


SELECT 
    c.c_id,
    c.name AS customer_name,
    sum(o.total_amount) AS lac
FROM Customers c
LEFT JOIN Orders o ON o.co_id = c.c_id
GROUP BY c.c_id, c.name
order by lac desc;









 
 

