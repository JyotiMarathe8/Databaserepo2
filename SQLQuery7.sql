create database selfjoin;
create table thinkemp
(empid int primary key,
ename varchar(15),
salary int,
mngr_id int);

alter table thinkemp
add constraint fkmngrid foreign key(mngr_id) references thinkemp (empid);

SELECT * FROM thinkemp;

Select e1.ename,e2.ename from thinkemp e1 inner join thinkemp e2 on e1.mngr_id=e2.empid;
---select manager under which more than 2 has employee
select m.ename , count(*)from thinkemp e inner join thinkemp m on e.mngr_id=m.empid group by  m.ename having count (*)>2;

---delete table/alias from table1 alias inner join table2 alias on alias.table1=alias.table2 where column=condition;

