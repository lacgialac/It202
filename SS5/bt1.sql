drop database if exists bt1_ss4;
create database bt1_ss4;
use bt1_ss4;
 create table Product (
	p_id int primary key auto_increment,
    p_name varchar(255) not null,
    price decimal (10,2 )not null,
    stock int not null,
    status enum("active", "inactive")
 );
 
 insert into Product(p_name, price, stock, status)
 values
 ('Laptop Dell Inspiron', 15000000.00, 10, 'active'),
('Chuột Logitech', 350000.00, 50, 'active'),
('Bàn phím cơ Keychron', 1800000.00, 20, 'active'),
('Tai nghe Bluetooth', 900000.00, 0, 'inactive'),
('Màn hình Samsung 24 inch', 4200000.00, 5, 'active');
 
 

select *from product ;

select *from Product 
where status='active';

select *from Product
where price >1000000;

select *from Product
where status="active"
order by price asc




