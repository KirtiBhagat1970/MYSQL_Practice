#create databse
create database college2;

use college2;

#create table
create table Employees(EmpID int,
FirstName varchar(10),
LastName varchar(50),
EmpAge int,
EmpZone varchar(10));

#description of table employee
desc Employees;

#insert one record in table
insert into Employees values(1,'kirti','bhagat',21,'north');

#insert multiple reocrd in table
insert into Employees(EmpID,FirstName,LastName,EmpAge,EmpZone)
values(2,'janvi',NULL,21,'south'),
	  (3,'arati','bhagat',25,NULL),
      (4,'pooja','bhagat',27,'east');

#display all records employees      
select * from Employees;

#update one column at a time
update Employees set FirstName='tanuja' where EmpID=2;

#update multiple columns at a time
update Employees set FirstName='pooja',LastName='bhilare' where EmpId=4;

desc Employees;

delete from Employees where EmpId=2;

select EmpID,FirstName from Employees;


