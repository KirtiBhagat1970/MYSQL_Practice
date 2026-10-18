-- create databse
create database User;
-- show all databases
show databases;

-- use database User
use User;

-- create table customer
create table customer(custid int,
custname varchar(15),
city varchar(10),
product varchar(15),
price int);

desc customer;

-- insert records into customer
insert into customer(custid,custname,city,product,price) 
values(1,'kirti','bhor','laptop',70000),
	(2,'janvhi','nanaded','mobile',30000),
    (3,'durva','pune','charger',1000);

-- to see all records from customer
select * from customer;

-- add primary key for custid
alter table customer add constraint primary key(custid);

desc customer;

-- select only 3 columns from customer table
select custid,custname,city from customer;

-- select record of specific customer
select * from customer where custid=1;

-- select two records from id use or
select * from customer where custid=1 or custid=2;

-- crate a duplicate table clonetable of customer
create table clonetable as select * from customer;

-- it display all records in customer table
select * from clonetable;

-- delete table clonetable
drop table clonetable;

select custname,product,price from customer where price>=15000;

select custname,product,price from customer where price<15000;

select custname,product,price from customer where price<=1000;

select * from customer where city='bhor';

-- sorting data using order by single column
select * from customer order by price;

-- single coumn sorting
-- sorting data as desending
select * from customer order by price desc;

-- sorting data as asending
select * from customer order by price asc;

-- multiple column sorting
-- it gives the first priority  forfor first enter column
select *  from customer order by city,price;
select *  from customer order by price,city;

select *  from customer order by city desc,price asc;

-- single row function
-- case conversion functions
-- upper  and lower case function
select upper(custname),lower(product) from customer where custid <3;

select upper(custname),lower(product) from customer;

alter table customer add column lastname varchar(10);

update customer set lastname='bhagat' where custid=1;
update customer set lastname='karadkar' where custid=2;
update customer set lastname='sharma' where custid=3;

select * from customer;

-- concate two columns
select concat(custname,lastname) from customer;

-- concate two columns and space between them
select concat(custname,' ',lastname) from customer;

select concat(custname,' ',lastname) as fullname from customer;

-- use of substr and instr function
-- first letter of a string start upto 3
select substr(custname,1,3) from customer;
-- cannot run because of first letter strt from 1 
select substr(custname,0,3) from customer;

-- in instr it display the position of character
select instr(custname,'k') as position from customer;

select instr(custname,'i') as position from customer;

insert into customer(custid,custname,city,product,price) 
values(4,'ajay','bhor','laptop',50000),
	(5,'arpita','nanaded','mobile',20000);
    
select instr(custname,'a') as position from customer;

-- substr and instr at same time
select substr(custname,1,2) as Substring,
instr(custname,'k') as instring from customer;

select substr(custname,1,3),
instr(custname,'k') from customer where custid<=3;
    
