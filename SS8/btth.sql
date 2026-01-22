drop database if exists btth_ss8;
create database  btth_ss8;
use  btth_ss8;

create table Guests (
	id bigint auto_increment primary key,
    name varchar(255) not null,
    phone varchar(255) not null
);

create table Rooms (
	id bigint auto_increment primary key,
    room_type varchar(255) not null,
    price_per_day int not null
);

create table Bookings (
	id bigint auto_increment primary key,
    guests_id bigint not null ,
    room_id bigint not null,
    check_int date not null,
    check_out date not null,
    
    constraint fk_guests
		foreign key(guests_id)
        references Guests(id),
        
	constraint fk_room
		foreign key(room_id)
        references Rooms(id)
);

INSERT INTO guests (name, phone) VALUES
('Nguyễn Văn An', '0901111111'),
('Trần Thị Bình', '0902222222'),
('Lê Văn Cường', '0903333333'),
('Phạm Thị Dung', '0904444444'),
('Hoàng Văn Em', '0905555555');

INSERT INTO rooms (room_type, price_per_day) VALUES
('Standard', 500000),
('Standard', 500000),
('Standard', 500000),
('Standard', 500000),

('Deluxe', 800000),
('Deluxe', 800000),
('VIP', 1500000),
('VIP', 2000000);

INSERT INTO bookings (guests_id, room_id, check_int, check_out) values
(1, 1, '2024-01-10', '2024-01-12'), -- 2 ngày
(1, 3, '2024-03-05', '2024-03-10'), -- 5 ngày
(1, 3, '2024-03-05', '2024-03-10'), -- 5 ngày
(2, 2, '2024-02-01', '2024-02-03'), -- 2 ngày
(2, 5, '2024-04-15', '2024-04-18'), -- 3 ngày
(3, 4, '2023-12-20', '2023-12-25'), -- 5 ngày
(3, 6, '2024-05-01', '2024-05-06'), -- 5 ngày
(4, 1, '2024-06-10', '2024-06-11'); -- 1 ngày




select name,phone from Guests;

select  *from Rooms
where price_per_day> 1000000;

select distinct room_type
from Rooms;

select room_type, price_per_day Rooms from Rooms
order by price_per_day asc;

select *from Bookings
where year(check_int) =2024;

select room_type, count(*) as phong 
from Rooms
group by room_type ;

SELECT 
	g.name as name_customer,
    r.room_type as loaiphong,
    b.check_int as ngaydatphong
from Bookings b
join Guests g on b.guests_id=g.id
join Rooms r on b.room_id=r.id;

select 
	g.name as tenkhachhang,
    count(b.id) as lac
from Bookings b
join Guests g on b.guests_id = g.id
group by g.name, g.id;
  
select 
r.id as room_id,
	r.room_type as lac,
    sum(datediff(b.check_out, b.check_int)* r.price_per_day) as lacc
	from Rooms r
    join Bookings b on b.room_id = r.id
    group by r.id, r.room_type;
    
select 
	r.room_type as lac,
    sum(datediff(b.check_out, b.check_int)* r.price_per_day) as tong_dt_cua_cacphpng
from Rooms r
join Bookings b on b.room_id = r.id
group by r.room_type;

select 
	g.name as namee,
    count(b.id) as solan
from Guests g
join Bookings b on b.guests_id = g.id
group by g.id,g.name
having count(b.id) >= 2;

select 
	r.room_type as loai_phong,
    count(b.id) as sodat
from Rooms r
join Bookings b on b.room_id= r.id
group by r.room_type
order by sodat desc
limit 1

    
    



	




