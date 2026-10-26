create database assignment;

use assignment;

create table EMPLOYEE(Emp_no int primary key,
E_name varchar(25),
E_address varchar(50),
E_ph_no varchar(20),
Dept_no int,
Dept_name varchar(20),
Job_id int,
Designation varchar(25),
Salary decimal(10,2));

desc EMPLOYEE;

insert into Employee(Emp_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Designation,Salary)
values(1,'kirti','bhor','7823874890',10,'Sales',1000,'Manager',50000),
      (2,'himanshu','pune','9992387489',20,'Finance',2000,'President',60000),
      (3,'samiksha','satara','3849874890',30,'Purchase',3000,'Clerk',70000),
      (4,'anuja','kolhapur','2345674890',40,'Finance',4000,'Analyst',80000),
      (5,'shruti','nagpur','9087674890',50,'Accountant',5000,'MGR',30000),
      (6,'hritik','bhor','7823812345',60,'Assistant',6000,'Manager',40000);

select * from EMPLOYEE;

select Emp_no,E_name,Salary from EMPLOYEE where Designation="Manager";

select * from EMPLOYEE where salary >=10000;

alter table EMPLOYEE add column joined_on date;

desc EMPLOYEE;

update EMPLOYEE set joined_on="1981-05-01" where Emp_no=1;
update EMPLOYEE set joined_on="1981-12-03" where Emp_no=2;
update EMPLOYEE set joined_on="1981-12-17" where Emp_no=3;
update EMPLOYEE set joined_on="1980-01-19" where Emp_no=4;
update EMPLOYEE set joined_on="1982-05-02" where Emp_no=5;
update EMPLOYEE set joined_on="1985-10-01" where Emp_no=6;
select * from EMPLOYEE;

select * from EMPLOYEE where joined_on > '1981-12-31' order by Designation asc;

select Emp_no,E_name ,round(datediff(current_date,joined_on)/365,1) as experience_years,
round(Salary/30,2) as Daily_salary
from EMPLOYEE;

select * from EMPLOYEE where Designation="Clerk" or Designation="Analyst";

select * from EMPLOYEE where joined_on in ("1981-05-01","1981-12-03","1981-12-17","1980-01-19");

select * from EMPLOYEE where Dept_no=10 or Dept_no=20;

select * from EMPLOYEE where E_name like 's%';

select max(Salary) as highest_salary from EMPLOYEE;

select E_name,substr(e_name,1,5) as first_fivechar from EMPLOYEE where E_name like 'h%' and Designation not in ("President","MGR")
order by Salary asc;

select min(Salary),max(Salary),round(datediff(current_date,joined_on)/365,1) as experience from Employee ;