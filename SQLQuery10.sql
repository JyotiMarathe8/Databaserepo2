--1.Write a query to create Student and Score table.
create database student2;
  create table Statuss(statusid int primary key,descvalue int not null, descare varchar(20));

  create table Students(studid int primary key,sname varchar(20) not null,mobile bigint,batchid int,statusid int foreign key REFERENCES Statuss(statusid),yearofpass date);
  
  create table Score(studid int,testdate date,topic varchar(20),marksobtained int);

  create table Attendence(studid int foreign key REFERENCES Students(studid),adate date,present varchar(10) not null);
  
  create table Batch(batchid int primary key,bname varchar(20) not null,teacherid int );

  create table Teacher(teacherid int primary key,tname varchar(20) not null);

  --2.Write a query to add column Qualification to Student table. ( Assume it was not present earlier)– add qualification column after status id

  alter table Students add qualification varchar(10);

   --3.Write single query to create StudentCopy table which will have same structure and data of table.
  select * into StudentCopy from Students;

  --4.List all studentsname from pb3 who were present for test on 08-04-2022.
  select sname from Students s inner join Batch b on s.batchid=b.batchid inner join Attendence a on a.studid=s.studid where adate='08-04-2022' and present='P';

 -- 5.	Update record of student Mithilesh from PB3 batch to Aug2018.Batch id of both batches is not known.
  update Students set banme=Aug2018 inner join Batch on where bname=null;

  --7.	List all Students from PB3 whose qualification is “BE” and year of passing is 2022.
  select * from Students s  inner join Batch b on s.batchid=b.batchid where yearofpass='2022-04-08';

  --8.List student name ,topic and topic wise marks of each student from PB3 batch.
  select sname,topic from Students s inner join Score c on s.studid=c.studid inner join Batch b  on s.batchid=b.batchid where bname='PB3';

  --9.	Display batchname and Batchwise Placed student count for all batches from which less than 5 students are placed.
  select bname,count(*) from Batch group by batchid having count(*)<=5;

  --10.	Display top 3 students from PB3 batch with least attendance.
  select top(3) from Students where studid=(select studid from Batch  where bname=2018);

  --11.	Delete all records of those students from attendance who are ‘PLACED’
  delete Students 

  --12.	Delete all records of students whose average marks are less than 50.
  delete Students where studid=(select studid from Score where marksobtained<=50);

  --13.	Create a view to which shows sid name batchname. 
  Create View vk as select studid,sname from Students s inner join Batch b on s.batchid=b.batchid;
  
  --14.	Create index so that retrieval of records is faster when retrieved based on status id
  create index idxs on Statuss(statusid);

  --15.	Give one example of left outer join using above database.
  select sname from Students s left join Batch b on s.batchid=b.batchid;