-- start a new transaction
/*BEGIN;
-- or 
*/
create database TCL;
use TCL;

create table orders(order_id int primary key,
customer_name varchar(100),
status varchar(50));

desc orders;

set autocommit=0;

begin;

insert into orders(order_id,customer_name,status)
 values(1,'kirti','Pending'),
	(2,'janvi','pending');
     
update orders set customer_name='raj' where order_id=2;

select * from orders;

rollback;

insert into orders(order_id,customer_name,status)
 values(1,'kirti','Pending'),
	(2,'janvi','pending');
     
commit;
update orders set customer_name='raj' where order_id=2;

rollback;

select * from orders;

insert into orders(order_id,customer_name,status)
 values(3,'nandini','Pending'),
	(4,'anuja','completed');
    
select * from orders;

delete from orders where order_id=2;

rollback;

select * from orders;

-- update one order
update orders set customer_name='raj' where order_id=3;

savepoint s1;

select * from orders;

-- insert 2 orders
-- create savepoint
-- update one order
-- create savepoint
-- 

-- insert 2 orders
insert into orders(order_id,customer_name,status)
 values(5,'arati','shipped'),
	(6,'pooja','completed');
    
-- create savepoint
savepoint s2;

-- update 1 order
update orders set customer_name='dhanashri' where order_id=4;
savepoint s3;

select * from orders;

rollback to savepoint s2;
select * from orders;

drop database TCL; 

--  Starts a new transaction--
/*Begin;
--or
START TRANSACTION; -- To execute multiple statements as a single transaction,
we must explicitly start the transaction,
COMMIT :- Saves all changes made during the transaction
ROLLBACK :- Undoes all changes made during the transaction
SAVEPOINT :- Sets a savepoint within a transaction to rollback to later
ROLLBACK TO SAVEPOINT :- Rolls back to a specific savepoint without affecting earlier changes.*/

create database TCL;

use TCL;

create table orders(order_id int primary key,
customer_name varchar(100),
status varchar(50));

desc orders;

set autocommit=0;

insert into orders(order_id,customer_name,status)
 values(1,'kirti','Pending'),
	(2,'janvi','pending');

select * from orders;

insert into orders(order_id,customer_name,status)
 values(3,'anuja','completed'),
	(4,'nandini','pending');
    
savepoint s1;

insert into orders(order_id,customer_name,status)
 values(5,'arohi','pending'),
	(6,'yuvika','shipped');
