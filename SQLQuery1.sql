//Employee database

create database employee;

use Employee;

create table employee(Eid int primary key,Ename varchar(40) not null,Dname varchar(20) not null,salary int,age int);

insert into employee values(1,'Rajesh','IT',25000,24);
insert into employee values(2,'shyam','Sales',30000,25);
insert into employee values(3,'Nagesh','ME',20000,20);
insert into employee values(4,'akash','IT',25000,26);
insert into employee values(5,'Suraj','Medical',26000,30);



select*from employee;


//Book Database

create database BookStore;

use BookStore;

create table Book(bid int primary key,bname varchar(40) not null,author varchar(20) not null,price int not null);

insert into Book values(1,'Java','Nirali',150);

select author from Book;

select * from Book;


create database hotel;

use hotel

create table hotel(hotelid int not null, hotelname varchar(20));
alter table hotel add city varchar(25);
alter table hotel add rating int;

insert into hotel values(1,'veg','pune',5);
insert into hotel values(2,'non-veg','pune',4.5);
insert into hotel values(3,'pure-veg','pune',3);
alter table hotel add  Primary key(hotelid);
alter table hotel drop constraint PK__hotel__17AA30FAAB432CFE;
alter table hotel drop column hotelid;--not allow to drop , hence need to drop constraint of primary key then drop column
select * from hotel;
drop table hotel;


----foreign key
create table trainer
(trainerid int primary key, trainername varchar(15));

create table student1
(sid int primary key,sname varchar(20),percentage int,trainerid int constraint fkid foreign key (trainerid) references trainer(trainerid));

insert into  trainer values(101,'deepa');
insert into  trainer values(102,'Kirti');

insert into  student1 values(1,'jyoti','85',101);
insert into  student1 values(2,'sarvesh','86',102);
insert into  student1 values(3,'Niraj','87',103);


select * from trainer;
select * from student1;
drop table student1;
