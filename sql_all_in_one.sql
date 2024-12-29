CREATE DATABASE ORG;
SHOW databases;
USE ORG;
CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOIN_DATE datetime,
DEPARTMENT CHAR(25)
);
INSERT INTO Worker(worker_id,FIRST_NAME,LAST_NAME,SALARY,JOIN_DATE,DEPARTMENT) VALUES
	(001,'Monika','Arora',100000,'14-02-20 09.00.00','hr'),
    (002,'NIHARIKA','VERMA',80000,'14-06-11 09.00.00','Admin'),
    (003,'VISHAL','SINGHAL',300000,'14-02-20 09.00.00','HR'),
    (004,'AMITABH','SINGH',500000,'14-02-20 09.00.00','Admin'),
	(005,'VIVEK','BHATI',550000,'14-06-11 09.00.00','Admin'),
    (006,'VIPUL','DIWAN',200000,'14-06-11 09.00.00','Account'),
    (007,'Satish','Kumar',75000,'14-06-11 09.00.00','Account'),
    (008,'geetika','chauhan',90000,'14-04-11 09.00.00','Admin');
select * from worker;
create table Bonus(
	worker_ref_id INT,
    bonus_amount INT(10),
	bonus_date DATETIME,
    foreign key (WORKER_REF_ID)
		references Worker(WORKER_ID)
        ON DELETE CASCADE
);
Insert into Bonus(worker_ref_id,bonus_amount,bonus_date) values
	(001,5000,'16-02-20'),
    (002,3000,'16-06-11'),
    (003,4000,'16-02-20'),
    (001,4500,'16-02-20'),
    (002,3500,'16-06-11');
create table title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FORM DATETIME,
    foreign key (WORKER_REF_ID)
		references Worker(WORKER_ID)
        ON DELETE CASCADE
);

Insert into title(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FORM) values
	(001,'manager','2016-02-20 00:00:00'),
    (002,'executive','2016-06-11 00:00:00'),
    (003,'executive','2016-06-11 00:00:00'),
	(004,'manager','2016-06-11 00:00:00'),
	(005,'asst. manager','2016-06-11 00:00:00'),
	(006,'executive','2016-06-11 00:00:00'),
	(007,'lead','2016-06-11 00:00:00'),
	(008,'lead','2016-06-11 00:00:00');
select * from title;
select first_name,salary,department from worker;
select 55+11;
select now();
select lcase('MANAVRASTOGI');
select * from worker where salary>80000;
select * from worker where department='hr';
select * from worker where salary between 80000 and 300000;
-- reduce OR statement
-- hr,admin
select * from worker where department='hr' or department='admin';
-- better way to go through in 
select * from worker where department in ('hr','admin');
-- not
select * from worker where department not in ('hr','admin');
-- is null
insert into worker(worker_id,FIRST_NAME,LAST_NAME,SALARY,JOIN_DATE,DEPARTMENT) VALUES
	(009,'raju','saxena',null,'14-02-20 09.00.00','intern');
select * from worker where salary is null;
-- wildcard
select *from worker where first_name like '%i%';
select * from worker where first_name like '_i%';

use org;

-- sorting
select * from worker order by salary;

-- desc
select * from worker order by salary desc;

-- distinct 
select distinct department from worker; 

-- data grouping 
-- find no of emp working in different department 
-- group by -> count, sum ,avg , min, max
select department,count(*) from worker group by department;

select department,avg(salary) from worker group by department;

select department,min(salary) from worker group by department;

-- having 
select department, count(department) from worker group by department having count(DEPARTMENT)>=2;

-- add new column bonus 
select * from bonus;
alter TABLE bonus add name_emp varchar(1024);

-- modify the datatype of attribute
alter table bonus modify name_emp char;

-- desicrbe datatype attribute
desc bonus;

-- columen rename
alter table bonus change column name_emp first_name varchar(1024);

-- drop column
alter table bonus drop column first_name;

-- rename the table 
alter table bonus rename to bouns_emp;
alter table bouns_emp rename to bonus;
use org;
select * from worker;
-- update
update worker set first_name='Manavv',last_name='Rastogi' where worker_id=1;

-- update multiple rows
alter table worker add pincode int not null default 0;
set sql_safe_updates=0;
update worker set pincode=10001;

-- delete 
delete from worker where worker_id=9;

select * from worker;
insert into worker values(1,"Manavv","rastogi",1000000,"2014-06-11 09:00:00","hr",10001);
-- replace
replace into worker(worker_id,first_name) values(01,'manav');
-- replace became insert
delete from worker where worker_id=01;
replace into worker(worker_id,first_name) values(9,'manav');
replace into worker set worker_id=09,first_name="motu";
replace into worker(worker_id,first_name,last_name) 
  select worker_id,first_name,last_name 
        from worker where worker_id=9;
