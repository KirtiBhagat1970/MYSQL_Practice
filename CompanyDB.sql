create  database company_db;

use company_db;

show databases;

create table Employee(EmpID int NOT NULL,
FirstName varchar(10),
LAstName varchar(10),
EmpAge int);

desc Employee;

insert into Employee values(NULL,'kirti','bhagat',21);

insert into Employee values(1,'kirti','bhagat',21);

-- not null and unique constraint creates a primary key constraint
create table Employee1(EmpID int NOT NULL,
FirstName varchar(10),
LAstName varchar(10),
EmpAge int,
Unique (EmpID));

insert into Employee1 values(NULL,'arati','bhagat',25);

desc Employee1;

insert into Employee1 values(1,'kirti','bhagat',21);
insert into Employee1 values(1,'kirti','bhagat',21);

select * from Employee1;

desc Employee1;

-- check constraint 
-- if age <20 it not inserted record in table
create table Employee3(EmpID int NOT NULL,
FirstName varchar(10),
LastName varchar(10),
EmpAge int,check(EmpAge>20));

insert into Employee3 values(2,'sandhya','bhagat',19);

desc Employee3;

insert into Employee3 values(2,'sandhya','bhagat',23);

-- add column
alter table Employee3 add column salary int;

desc Employee3;

-- drop column salary 
alter table Employee3 drop salary;

-- add column with constraints
alter table Employee3 add column salary int,add check(salary >= 5000);

desc Employee3;

insert into Employee3 values(3,'dhanashri','bhilare',28,1000);

insert into Employee3 values(4,'rajashri','bhilare',28,6000);

select * from Employee3;

-- show all constraints in table
show create table Employee3;

-- give error checck constrint is not found

-- to drop constraint fro salary column
alter table Employee3 drop check employee3_chk_2;

insert into Employee3 values(5,'arohi','dal',21,3000);

select * from Employee3;

-- add multiple constraint at a time
create table Employee4(EmpID int NOT NULL,
FirstName varchar(10),
LastName varchar(10),
EmpAge int,check(EmpAge>20),
primary key(EmpID));

-- no duplicate recores are allowed because primary key must be unique
insert into Employee4 values(101,'rohini','chandan',22);

insert into Employee4 values(101,'nikita','chandan',24);

select * from Employee4;
insert into Employee4 values(102,'rohini','chandan',24);

-- drop foregin key constrint from the key created for constraint

create table Employee5(EmpID int primary key,
FirstName varchar(10),
LastName varchar(10),
EmpAge int,
salary int);

-- add 2 constraint with createting key
alter table Employee5 add constraint chk_EmpAge_salary
check(EmpAge > 20 AND salary>=5000);

insert into Employee5 values(102,'kirti','bhagat',21,100000);

show create table Employee5;

alter table Employee5 drop chk_EmpAge_salary;

-- default constraint :set a default value for a column if no  other value specified
create table Employee6(EmpID int not null,
FirstName varchar(10),
LastName varchar(10),
EmpDept varchar(10) default 'Operations');

desc Employee6;


