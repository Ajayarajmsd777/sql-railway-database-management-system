create database railway
use  railway
create table employees
(
employee_id int PRIMARY KEY,
employee_name varchar(20),
address varchar(20),
gender enum('m','f'),
phone_number bigint,
date_of_birth date,
salary int
)
insert into employees values (1,'ajay','india','m',9605632103,'1997-01-05',30000),
(2,'bevin','usa','m',9605643193,'1997-07-07',34000),
(3,'anjana','thrissur','f',8765738237,'1997-09-09',56000),
(4,'shibin','adolokam','m',8899334466,'1996-09-01',34356),
(5,'dominic','kottayam','m',9807653647,'1998-02-05',12000)

create table passenger
(
passenger_id int PRIMARY KEY,
passenger_name varchar(20),
seat_number int,
gender enum('m','f'),
phone_number bigint,
EMPLOYEE_ID INT,
reservation_status enum('s','w'),
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
)
insert into passenger values (1,'ajay',1,'m',9605632103,1,'s'),
(2,'anjana',34,'f',9655632103,2,'s'),
(3,'ganesh',35,'m',9675632103,3,'w'),
(4,'dominic',17,'m',9455632103,4,'w'),
(5,'shibin',10,'m',9605732103,5,'s')
create table station
(
station_id int,
station_name varchar(20),
number_of_lines int,
number_of_platforms int
)
insert into station values(1,'kollam',3,4),
(2,'koyikod',5,8),
(3,'trivandrum',5,6),
(4,'thrissur',7,4)
create table train
(
train_id int,
station_id int,
train_name varchar(20)
)
insert into train values(1,3,'netravadhi'),
(2,5,'csk express'),
(3,6,'bengaluru'),
(6,7,'kanyakumari')
create table ticket
(
ticket_no int,
sourc varchar(255),
destination varchar(255),
class_id int,
fare int,
train_id int
)
insert into ticket values(1,'ernakulam','thrs',234,12,1),
(2,'ernakulam','mndy',234,12,2),
(3,'ernakulam','orapp',234,12,3),
(4,'ernakulam','thrichy',234,12,4)

create table fare
(
receipt_no int,
train_id int,
sourc varchar(255),
destination varchar(255),
class varchar(255),
fare int,
ticket_no int
)

insert into fare values(123,2,'dallas','orapp','sleeper',15,1),
(1230,3,'valeri','KALLODI','semi sleeper',5,2),
(1231,4,'puthsery','chovva','2ac',19,3),
(1283,1,'kuttipuzha','muthireri','RAC',9,4)

create table class
(
class varchar(255),
journey_date date,
no_of_seats int,
train_id int
)
insert into class values('sleeper','2001-01-05',670,1),
('semi sleeper','2001-02-09',670,2),
('rac','2001-05-09',670,3),
('3ac','2001-07-07',670,4)

create table time
(
reference_no int,
departure_time time,
arrival_time time,
train_id int,
station_id int
)
insert into time values(1,11.20,22.40,1,12),
(3,11.26,13.41,2,112),
(1,11.25,12.41,3,123),
(2,11.27,12.43,4,212)
create table route
(
arrival_time time,
departure_time time,
stop_time time
)
SELECT 
    employee_name, gender AS male_employees, salary
FROM
    employees
    where gender='m' and salary=30000 
SELECT 
    employee_name, gender AS male_employees, salary
FROM
    employees
WHERE
    salary < 30000 AND gender = 'f'
    
SELECT 
    passenger_name, gender, reservation_status, employee_id
FROM
    passenger
    where employee_id=2

SELECT 
    train_id, sourc, destination, class, fare
FROM
    fare
    where sourc='dallas' and fare>10
SELECT 
    train_id, sourc, destination, class, fare
FROM
    fare
    where sourc='dallas' and fare=15
    
SELECT 
    station_name, number_of_platforms, number_of_lines
FROM
    station
    where number_of_lines>1 and number_of_platforms>5

SELECT 
    train_id, train_name, station_id
FROM
    train
     where station_id!='arz'
SELECT 
    c.train_id, t.train_name, c.class
FROM
    class c
    join train t on c.train_id=t.train_id
SELECT 
    e.employee_name,
    e.phone_number,
    e.gender,
    p.phone_number,
    p.passenger_name,
    p.reservation_status
FROM
    employees e
        JOIN
    passenger p
    on e.employee_id=p.passenger_id 
    where e.phone_number like '%9%'

SELECT 
    t.station_id,
    t.train_name,
    c.class,
    c.no_of_seats,
    c.journey_date
FROM
    class c
        JOIN
    train t ON t.train_id = c.train_id
    where journey_date like '2001-02%'


SELECT 
    f.receipt_no,
    f.ticket_no,
    f.train_id,
    tra.train_name,
    f.sourc,
    f.destination,
    f.class,
    f.fare,
    t.departure_time,
    t.arrival_time
FROM
    fare f
        JOIN
    ticket ti ON ti.ticket_no = f.ticket_no
        JOIN
    time t ON t.train_id = ti.train_id
        JOIN
    train tra ON tra.train_id = ti.train_id


    
