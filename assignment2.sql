/* Create a table EMPLOYEE with following schema:
(Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name,Job_id, Designation, Salary)
Write SQL statements for the following queries. 
*/

create database EMPLOYEE_DB;

use EMPLOYEE_DB;

create table EMPLOYEE(Emp_no int primary key,E_name varchar(25),E_address varchar(25),E_ph_no varchar(15),
Dept_no int,Dept_name varchar(25),Job_id int,Designation varchar(25),Salary decimal(10,2) );

desc EMPLOYEE;

/*1. List the E_no, E_name, Salary of all employees working for MANAGER.
2. Display all the details of the employee whose salary is more than 10000.
3. List the employees in ascending order of Designations of those who joined after 1981.
4. List the employees along with their Experience and Daily Salary.
5. List the employees who are either ‘CLERK’ or ‘ANALYST’ .
6. List the employees who joined on 1-MAY-1981, 3-DEC-1981, 17-DEC-1981, 19-JAN-1980.
7. List the employees who are working for Deptno 10 or20.
8. List the Enames that start with ‘S’.
9. Write a SQL query to find the highest salary. Return the highest salary
10. Display the name and the first five characters of the name starting with ‘H’ . List all the
employees except ‘PRESIDENT’ & ‘MGR” in ascending order of Salaries.
11. Display the minimum and maximum salary and Experience of the employee.
12. Display the total salary of all employees.
13. Write a query to display the average salary of employees working in IT department.
14. Display the Distinct salary of an employee.
*/
insert into EMPLOYEE(Emp_no,E_name,E_address,E_PH_no,Dept_no,Dept_name,Job_id,Designation,Salary) 
values(1,'kirti','bhor','7812658945',10,'IT',101,'manager',100000),
       (2,'samiksha','pune','7814562945',20,'sales',102,'clerk',6000),
       (3,'harshita','nagpur','7894658945',30,'finance',103,'president',20000),
       (4,'prayanka','satara','2365658945',40,'purchase',104,'manager',10000),
       (5,'himanshu','pune','4561238945',50,'sales',105,'manager',80000),
       (6,'sarthak','bhor','2365658945',60,'IT',106,'MGR',8000);
       
select * from EMPLOYEE;
-- 1. List the E_no, E_name, Salary of all employees working for MANAGER.
select Emp_no,E_name,Salary from EMPLOYEE where Designation="manager";

-- 2. Display all the details of the employee whose salary is more than 10000.
select * from EMPLOYEE where Salary >10000;

alter table EMPLOYEE add column Joined_date date;

desc EMPLOYEE;
-- 1-MAY-1981, 3-DEC-1981, 17-DEC-1981, 19-JAN-1980.
update EMPLOYEE set Joined_date="1981-05-01" where Emp_no=1;
update EMPLOYEE set Joined_date="1981-12-03" where Emp_no=2;
update EMPLOYEE set Joined_date="1981-12-17" where Emp_no=3;
update EMPLOYEE set Joined_date="1980-01-19" where Emp_no=4;
update EMPLOYEE set Joined_date="1984-05-05" where Emp_no=5;
update EMPLOYEE set Joined_date="1985-12-11" where Emp_no=6;

select * from EMPLOYEE;
-- 3. List the employees in ascending order of Designations of those who joined after 1981.
select * from EMPLOYEE where Joined_date>1981 order by Designation asc;

-- 4. List the employees along with their Experience and Daily Salary.
alter table EMPLOYEE add column Experience int,add column Daily_salary decimal(10,2);

update EMPLOYEE set Experience=5 where Emp_no=1;
update EMPLOYEE set Experience=10 where Emp_no=2;
update EMPLOYEE set Experience=15 where Emp_no=3;
update EMPLOYEE set Experience=20 where Emp_no=4;
update EMPLOYEE set Experience=5 where Emp_no=5;
update EMPLOYEE set Experience=10 where Emp_no=6;

use EMPLOYEE_DB;
select E_name,Experience ,round(Salary/30,2) as Daily_salary from EMPLOYEE;

insert into EMPLOYEE
values(7,'payal','bhor','3562658945',70,'IT',107,'analyst',20000,'1981-09-01',5,255);
insert into EMPLOYEE
values(8,'hrutuja','pune','9856658945',80,'sales',108,'analyst',30000,'1981-11-01',6,1000);
-- 5. List the employees who are either ‘CLERK’ or ‘ANALYST’ .
select * from EMPLOYEE where Designation in('clerk','analyst');

-- 6. List the employees who joined on 1-MAY-1981, 3-DEC-1981, 17-DEC-1981, 19-JAN-1980.

select * from EMPLOYEE where Joined_date in('1981-05-01','1981-12-03','1981-12-17','1980-01-19');

-- 7. List the employees who are working for Deptno 10 or20.
select * from EMPLOYEE where Dept_no =10 or Dept_no=20;

-- 8. List the Enames that start with ‘S’.
select * from EMPLOYEE where E_name like 's%';

-- 9. Write a SQL query to find the highest salary. Return the highest salary
select max(Salary) as max_sal from EMPLOYEE;

-- 10. Display the name and the first five characters of the name starting with ‘H’ . List all the
-- employees except ‘PRESIDENT’ & ‘MGR” in ascending order of Salaries.
select E_name,left(E_name,5) as first_five,Designation,Salary from EMPLOYEE where E_name like 'h%'
and  Designation not in ('president','MGR') order by Salary asc;

-- 11. Display the minimum and maximum salary and Experience of the employee.
select Experience,max(Salary) as max_sal,min(Salary) as min_sal from EMPLOYEE group by Experience;

-- 12. Display the total salary of all employees. 
select sum(Salary) as sum_sal from EMPLOYEE;

-- 13. Write a query to display the average salary of employees working in IT department.
select avg(Salary) as avg_sal from EMPLOYEE where Dept_name='IT';

-- 14. Display the Distinct salary of an employee. 
select distinct Salary from EMPLOYEE;

select sum(Salary) as sum_sal from EMPLOYEE where Designation='manager';

create index index_demo on EMPLOYEE(Emp_no);

select Emp_no from EMPLOYEE;
create index index_demo1 on EMPLOYEE(E_name,E_address);
select E_name,E_address from EMPLOYEE;

show indexes from EMPLOYEE;

drop index index_demo on EMPLOYEE;

drop index index_demo1 on EMPLOYEE;

-- order by cluse
select * from EMPLOYEE order by Salary;
-- upper ,lower function
select upper(E_name),lower(E_Address) from EMPLOYEE where Emp_no=1;

select substr(E_name,1,4) from EMPLOYEE;
select instr(E_name,'k') from EMPLOYEE;
select substr(E_name,1,2) ,instr(E_name,'h') from EMPLOYEE;

select now() as current_datetime;

-- distinct
select distinct Salary from EMPLOYEE order by Salary;

-- and operator
select * from EMPLOYEE where Designation='manager' and E_name like 'h%';

-- or operator
select * from EMPLOYEE where Designation='manager' or Designation='president';

-- in operator
select * from EMPLOYEE where Designation in('manager','president','MGR');

-- not in operator
select * from EMPLOYEE where Designation not in('manager','president','MGR');

-- between operator
select * from EMPLOYEE where Salary between 5000 and 10000;

-- like operator
select * from EMPLOYEE where E_name like '%i';

-- limit operator
select * from EMPLOYEE order by Experience limit 5;

-- is null operator
insert into EMPLOYEE
values(9,'anuja','pune','9872658945',90,'sales',109,'analyst',10000,'1978-10-02',6,300);
insert into EMPLOYEE
values(10,'anuja','pune','9872658945',90,'sales',109,'analyst',10000,'1978-10-02',6,null);

select * from EMPLOYEE where Daily_salary is null;

-- not null
select * from EMPLOYEE where Daily_salary is not null;

-- agreegate function
-- sum
select sum(Salary) as sum_sal from EMPLOYEE;

-- count
select count(*) as count from EMPLOYEE where Salary >10000;
select Dept_name,count(*) as emp_count from EMPLOYEE group by Dept_name;

-- min
select min(Experience) as min_exp from EMPLOYEE;

-- max
select max(Experience) as max_exp from EMPLOYEE;

-- avg
select avg(Salary) as avg_sal from EMPLOYEE;

-- group by clause
select Dept_name,count(*) as emp_count from EMPLOYEE group by Dept_name;

-- having clause
select Dept_name,count(*) as emp_count from EMPLOYEE group by Dept_name having avg(Salary>10000);

select Dept_name,count(*) as emp_count from EMPLOYEE where Experience>5 and Salary>10000 group by Dept_name;

-- all queries in one file
