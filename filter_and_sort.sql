/*Filtering data from tables*/

create database organization;

show databases;

use organization;

create table employee(Empid int not null primary key,
First_name varchar(15),
Last_name varchar(15),
Gender char,
Role varchar(15),
Dept varchar(15),
Manager_id varchar(10));

desc employee;

insert into employee(Empid,First_name,Last_name,Gender,Role,Dept,Manager_id)
values(1,'kirti','bhagat','F','Manager','HR','M11'),
      (2,'janvhi','karadlekar','F','Team leader','Sales','M12'),
      (3,'anuja','bhapunvar','F','President','Retail','M13'),
      (4,'prajakta','gupta','F','Assitant','HR','M15'),
      (5,'nandini','bhagvat','F','Manager','Finance','M14'),
      (6,'suraj','bhilare','M','President','HR','M16');
      
select * from employee;

-- Select disntinct from employee
select distinct Dept from employee order by Dept;

-- distinct cluse to get all the unique values of the role column
select distinct Role from employee order by Role;

-- and operator: the and operator is a logical operator that combines two or more boolean expressionsand 
-- returns 1,0,null. the and operator is used is used for fliterning  data with the where clause

select * from employee where Role="president" and Dept="Finance";

select * from employee where Role="president" and Dept="HR";

/* or operator: the and operator is a logical operator that combines two or more boolean expressionsand 
returns 1. (true) if either of the exxpresiions is true. 
the and operator is used is used for fliterning  data with the where clause*/

select * from employee where role="Manager" or Role="Team leader";

select * from employee where role="Manager" or Dept="HR";

/* In operator*/

select * from employee where Role in('President','Manager');

select * from employee where Role in('TM','CEO');

/* not in operator: the not in operatoe is formed by combining the not and in operator.
the not in operator,in constrast to the in operator,
is used to determine if a value does not match any of values in the list */

select * from employee where Role not in('President','Manager');


alter table employee add column Experience int;

update employee set Experience=8 where Empid=1;
update employee set Experience=5 where Empid=2;
update employee set Experience=10 where Empid=3;
update employee set Experience=15 where Empid=4;
update employee set Experience=5 where Empid=5;
update employee set Experience=6 where Empid=6;

select * from employee;

/*Between operator:the between operator is a logical operator that determines ehere a value belongs a
in a range . the between operator returns null if the value,low,or high is null*/

select * from employee where experience between 6 and 10;

select * from employee where experience=5 or experience=10;

/*Like operator: the like operator is a logical operator that determines 
whether or not a string contains a specifiedd pattern. */
select * from  employee where Last_name like 'b%';

select * from  employee where Last_name like 'n%';

select * from employee;

select * from  employee order by Experience limit 5;

/*is null: the is null operator determines where or not the value is null.
the expreesiions return 1(true) if the value is null,
otherwise return 0 (false).*/
-- is not null
insert into employee values(7,'rituja','jhedhe','F','Manager','HR',' ',null);

select * from employee;

select * from employee where Manager_id is null;

select * from employee where Experience is null;
select * from employee where Manager_id is not null;

select * from employee where Experience is not null;

/*aggregate functions*/
-- count,min,max,sum,avg

use organization;

select count(*) from employee;

select min(Experience) from employee;
select count(empid) from employee where dept='finance';
select max(Experience) from employee;
select sum(Experience) from employee;
select avg(Experience) as exp_avg from employee;

/*grop by clause*/

-- find department wise employee count
select dept,count(*) as employee_count from employee group by dept;

-- find role wise employee count
select Role, count(*) as employee_count from employee group by Role;

-- find gender wise employee count
select Gender,count(*) as employee_count from employee group by Gender;

/* having clause*/
select dept,sum(Experience) as total_experience 
from employee group by dept
having total_experience >=10 and total_experience<=20;

select Role,sum(Experience) as total_experience 
from employee group by Role
having total_experience >=10 and total_experience<=20;

-- fetch department wise employee count using having clause and sorting data
select dept,count(Empid)
from employee
group by dept
having count(Empid)>=2
order by count(Empid) desc;

select dept,sum(Experience) as total_experience 
from employee group by dept
having total_experience >=10 or total_experience<=30;

