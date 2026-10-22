create database basicjoin;

show databases;

use basicjoin;

create table employees(employee_id int primary key,
ename varchar(50));

desc employees;

insert into employees(employee_id,ename) 
values(1,'kirti'),
      (2,'anuja'),
      (3,'janvhi'),
      (4,'nandini');
      
select * from employees;

create table projects(project_id int primary key,
panme varchar(50),
employee_id int,
foreign key(employee_id) references employees(employee_id));

desc projects;

insert into projects(project_id,panme,employee_id)
values(101,'project A',1),
	  (102,'project B',2),
      (103,'project C',3),
      (104,'project D',4);
      
select * from projects;

insert into employees values(5,'sanjay');
insert into employees values(6,'jay');

/*inner join */
/* only matching records will display from employee and projects tables */
/* if any join is not mention it is inner join*/

select * from employees join projects on employees.employee_id=projects.employee_id;

/* fetch employee name and project name they belongs to */
select e.ename,p.panme from employees e inner join projects p on e.employee_id=p.employee_id;

-- right join
select e.ename,p.panme from employees e right join projects p on e.employee_id=p.employee_id;

insert into projects values(105,'project E',null);
insert into projects values(106,'project F',null);

-- inner join
select e.ename,p.panme from projects p inner join employees e on e.employee_id=p.employee_id;

-- left join
select e.employee_id, e.ename,p.panme from employees e left join projects p on e.employee_id=p.employee_id;

insert into projects values(107,'project G',5);

insert into projects values(108,'project I',null);

/* left join = inner join + any additional records in the left table */
/* right join =  inner join + any additional records in the right table */

/* full outer join using union */
/* display all matching and non-matching  data from both tables */

select * from employees
 left join projects 
 on employees.employee_id =projects.employee_id 
 union 
 select * from employees
 right join projects 
 on employees.employee_id =projects.employee_id;
 

 /* display employee name who has not been assigned any project */
 select employees.ename ,projects.panme 
 from employees 
 left join projects
 on employees.employee_id=projects.employee_id
 where projects.employee_id is not null;
 
 select employees.ename ,projects.panme 
 from employees 
 left join projects
 on employees.employee_id=projects.employee_id
 where projects.employee_id is null;
 
 select employees.ename ,projects.panme 
 from projects 
 left join employees
 on employees.employee_id=projects.employee_id
 where projects.employee_id is null;
 
 select * from employees;
 
 select * from projects;