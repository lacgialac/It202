drop database if exists bt3_ss6;
create database bt3_ss6;
use bt3_ss6;

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



SELECT 
    c.c_id,
    c.name AS customer_name,
    sum(o.total_amount) AS lac
FROM Customers c
LEFT JOIN Orders o ON o.co_id = c.c_id
GROUP BY c.c_id, c.name
order by lac desc;

SELECT 
    order_date,
    count(o_id) AS tong_doanh_thu
FROM Orders
GROUP BY order_date
ORDER BY order_date desc;


SELECT 
    order_date,
    sum(total_amount) AS tong_doanh_thu
FROM Orders
where total_amount > 400000
GROUP BY order_date;


SELECT 
    order_date,
    SUM(total_amount) AS tong_doanh_thu
FROM Orders
GROUP BY order_date
ORDER BY order_date desc;









 
 

