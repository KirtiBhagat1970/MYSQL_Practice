create database Company;

show databases;

use Company;

create table Employee (Emp_id int primary key,
emp_name varchar(20),
City varchar(20),
bdate date);

desc Employee;

create table Investor(inv_no int primary key,
name varchar(20),
inv_date date,
inv_amt decimal(10,2),
emp_id int);

desc Investor;

insert into Employee(Emp_id,emp_name,City,bdate) 
values(1,'kirti','bhor','2005-05-06'),
      (2,'pooja','pune','1997-12-11'),
      (3,'arati','mumbai','1999-11-19'),
      (4,'sandhya','bhor','1960-05-06'),
      (5,'manasi','pune','2005-06-20');
      
select * from Employee;

desc Investor;

insert into Investor(inv_no,name,inv_date,inv_amt,emp_id) 
values(101,'pooja','2008-05-06',100000,1),
      (102,'kirti','1990-12-11',200000,2),
      (103,'janvhi','2000-05-06',30000,3),
      (104,'krushna','2010-06-20',500000,4),
      (105,'sandhya','2016-11-20',400000,5);

select * from Investor;

alter table Employee add Age int check(Age<=50) ,add Salary int check(Salary>=10000);

desc Employee;

select * from Employee;

alter table Investor add Age int;

select * from Investor;

alter table Investor modify name text;

desc Investor;

alter table Employee rename column Emp_id to e_id;

desc Employee;

update Employee set City='Nagpur' where e_id=4;

delete from Investor where inv_no=105;

select * from Investor;

alter table Investor drop column Age;

desc Investor;

show create table Employee;

alter table Employee drop check employee_chk_1;

desc Employee;

alter table Investor add constraint fk_employee_investor foreign key(emp_id) references Employee(e_id);

desc Investor;

select inv_no,name,inv_date,inv_amt from Investor;

alter table Employee rename to Employee1;

truncate table Investor;

desc Investor;

select * from Investor;

drop table Investor;

drop table Employee;