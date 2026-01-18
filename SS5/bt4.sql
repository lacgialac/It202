drop database if exists bt4_ss5;
create database bt4_ss5;
use bt4_ss5;
 create table Products(
		sold_quanity int not null
 );
 
 insert into Products(sold_quanity)
 values
(5),
(12),
(8),
(20),
(3),
(15);

select *from Products
order by sold_quanity desc
limit 4;

select *from Products
limit 2 offset 4 


select *from Products
where sold_quanity<10
order by sold_quanity desc




