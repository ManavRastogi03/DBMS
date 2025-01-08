-- 1 write an sql query to fetch "First name" from worker table using the alias name as <worker name>
select first_name AS worker_name from worker;

-- 2 write an sql query to fetch "first_name" from worker table to upper case
select upper(first_name) from worker;

-- 3 write an sql query to fetch unique value of department from workwer table
select distinct department from worker;
-- by group by
select department from worker group by department;

-- 4 write an sql query to print print first three character of first_name from worker table
 select substring(first_name,1,3) from worker;
 
 -- 5 write an sql query to find the position of the alphabet ('b') in the first name col "amitabh" from worker table
 select instr(first_name,'b') from worker where first_name='amitabh';
 
 -- 6 write an sql query to print the first_name from worker table after removing white space from the right side 
 select RTRIM(first_name) from worker;
 
 -- 7 write an sql query to print the department from worker table after removing white space from left side
 select ltrim(first_name) from worker;
 
 -- 8 write an sql that fetch the unique value of department from worker table and print its length
 select distinct department, length(department) from worker;
-- 9 write  an sql query to print the first_name from worker table after replacing 'a' with 'A'
select REPLACE(first_name,'a','A')  from worker;
-- write an sql queir to print an first_anme and last_name from worker table into a single col coplete_name
-- 10 A seprate char should br seprate them
select concat(first_name," ",last_name)  as complete_name from worker;
-- 11 write an sql query to print all worker table order by first_name acsending
select * from worker order by first_name asc;
select * from worker order by first_name;
-- write an sql query to print all worker details from worker table order by 
-- first_name ascending and the department descending
select * from worker order by first_name , department desc;
-- 13 write an sql query to print details for worker with the first_name as "vipul" ans "satish" from worker detail
select * from worker where first_name="vipul" or first_name='satish';
select * from worker where first_name in('vipul','satish');
-- 14 write an sql query to print worker excluding first_name as "vipul" or "satish" 
select * from worker where not first_name in("vipul","satish");
-- 15 write an sql query to print details with worker with department name as "admin%"
select *  from worker where department like "Admin%";
select * from worker where department="admin";
-- 16 write an sql quey to print the worker detail whose first_name contain "a"
select * from worker where first_name like"%a%";
-- 17 write an sql query to print the workwer detail where first_name end with a
select * from worker where first_name like "%a";
-- 18 write an sql query where first_name where end with"h" and contain six alphabet
select * from worker where first_name like "_____h";
-- 19 write an sql query to print the details salary lie btw 100000 & 500000
select * from worker where SALARY between 100000 and 500000;
-- 20 write an sql query to print details of the worker who have joined in feb'2014
select * from worker where year(join_date)=2014 and month(join_date)=2;
-- 21 write an sql query to fetch the count of the employee working in the department "Admin"
select DEPARTMENT,count(DEPARTMENT) from worker where department="Admin";
select department, count(*) from worker group by department;
-- 22 write an sql qury to fetch worker full name and with salaries >=50000 and <=100000
select concat(first_name," ",last_name),salary from worker where salary between 50000 and 100000;
-- 23 write an sql query to fetch the no of worker for each deaprtment in decresing order
select department, count(*) from worker group by DEPARTMENT
order by count(*) desc;
-- 24 write an sql query to print details of the worker who are also a manger 
select w.* from worker as w inner join title as t on w.worker_id=t.WORKER_REF_ID 
where t.WORKER_TITLE="Manager";
-- 25 write an sql query to fetch number (more then 1) of same title in the org different type
select worker_title,count(*) as noofdiff from title group by worker_title having noofdiff>=2;
-- 26 write an sql query to show only odd rows from the table 
select * from worker where Mod(worker_id,2)!=0;
select * from worker where mod(worker_id,2)<>0;
-- 27 write an sql to show the only even rows from the table
select * from worker where mod(WORKER_ID,2)=0;
-- 28 write an sql query to clone a new table from the another table
create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone; 
 drop table worker_clone;
 -- 29 write an sql query to fetch interscting records of two table
 select worker.* from worker inner join worker_clone using(worker_id);
 select worker.* from worker inner join title on worker.WORKER_ID=title.WORKER_REF_ID;
 -- write an sql query to show record from one table that another table does not have 
 select worker.* from worker left join worker_clone using(worker_id) where worker_clone.WORKER_ID is null;
 -- write an sql query to show the current date and time 
 -- dual 
 select curdate();
 select now();
 -- write an sql query to show the top n (say 5) records of a table order by desecending salary
 select * from worker order by SALARY desc limit 5; 
 -- 33 write an sql query to detremine the nth (say n=5) highest salary from the table 
 select * from worker order by salary desc limit 4,1;
 -- 34 write an sql query to determine the fifth highest salary without using limit keyword
 select * from worker w1
 where 4=(
 select count(distinct(w2.salary))
 from worker w2
 where w2.salary>=w1.salary
 );
 -- 35 write an sql query to fetch the list of emp with the same salary
