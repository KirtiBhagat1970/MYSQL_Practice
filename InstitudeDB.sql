create database InstitudeDB;

show databases;

use InstitudeDB;

create table Staff(staff_id int primary key,
first_name varchar(50),
last_name varchar(50),
DOB date,
dept_id int);

create table Department(dept_id int primary key,
dept_name varchar(50),
dept_location varchar(50)
);

desc Staff;

desc Department;

alter table Staff 
add column location varchar(50);

alter table Staff
add column joining_year int;

desc Staff;

select * from Staff;

alter table Staff
modify first_name text;

alter table Staff
drop column contact_no;

desc Staff;

alter table Department
drop primary key;

desc Department;

alter table Department
add primary key(dept_id);

alter table Staff
drop column dept_id;

desc Staff;

desc Department;

select * from Staff;

select * from Department;

alter table Staff rename Staff1;

desc Staff1;

alter table Staff1 
rename column last_name to surname;

desc Staff1;

drop database InstitudeDB;