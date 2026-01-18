drop database if exists bt3_ss5;
create database bt3_ss5;
use bt3_ss5;
 create table Orders(
	id int primary key auto_increment,
    o_id varchar(255) not null,
        c_id varchar(255) not null,
    total_amount decimal(10,2) not null,
    order_date date not null,
    status ENUM("pending", "completed", "cancelled")
 );
 
 insert into orders(o_id, c_id, total_amount, order_date, status)
 values
 ('ORD001', 'C001', 1500000.00, '2024-01-10', 'completed'),
('ORD002', 'C002', 750000.00,  '2024-01-15', 'pending'),
('ORD003', 'C001', 3200000.00, '2024-02-05', 'completed'),
('ORD004', 'C003', 500000.00,  '2024-02-20', 'cancelled'),
('ORD005', 'C004', 2100000.00, '2024-03-01', 'pending');

select *from Orders
where status="pending";

select *from Orders
where  total_amount>5000000;

select *from Orders
where status="pending"
order by total_amount desc ;
 
select *from Orders
order by order_date desc
limit 3;



