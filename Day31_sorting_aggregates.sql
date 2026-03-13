create database Ecommerce;
use Ecommerce;


create table products( product_id int primary key , product_name varchar(50) not null, price decimal(10,2));
insert into products values(1, 'Elicapter', 10000),
(2, 'pulicapter', 20000), (3, 'monicapter', 30000), (4, 'palicapter', 40000), (5, 'vericapter', 50000);
select * from products order by price desc limit 3;

-- order by & limit



alter table products rename to sales;
select price as p from sales;

select sum(price) from sales;
select count(price) from sales;
select avg(price) from sales;
select min(price) from sales;
select max(price) from sales;
select format (avg(price),2) from sales;
select round(avg(price)),2 from sales;


-- aggregated results are returned

create table college(did int primary key auto_increment, stuname varchar(100) not null, department varchar(50) not null);
insert into college (stuname,department) values('pavithra','it') , ('suchitra','it'), ('padiktha','it'), ('solanthe','it'), ('sumithe','eee'), ('pramesh','it'), ('pavish','it'), ('salip','it'), ('nagay','it'), ('paditha','it'), ('sharm','it'), ('deor','it');
insert into college (department) values( 'it'), ('it'),('it'),('it'),( 'it'),('it'),('eee'),('it'),('it'),('it'),('it'),('it');
SELECT department, COUNT(*) 
FROM college
GROUP BY department
HAVING COUNT(*) > 10;
SELECT department, COUNT(*) AS total_employees
FROM college
GROUP BY department
HAVING COUNT(*) > 10;
drop table college;


select department, count(*) from college group by department having count(*) >10;

--only department with >10 students name returned



