create database College;
use college;
create table students(stid int primary key auto_increment, stuname varchar(100) not null);
create table courses(cid int primary key auto_increment, course_name varchar(100) not null)
auto_increment=101;
drop table courses;
insert into students (stuname) values ('malini'), ('meghna'), ('meghala'),('priyanka'),('paluvenchekova');
insert into courses (course_name) values ('jogging'),('running'),('mimicry'),('itching');
create table enrollment (stid int, cid int);
insert into enrollment values(1,101), (2,102), (3,101),(4,102),(5,103);
select stuname,course_name
from students as s
inner join enrollment as e
on s.stid=e.stid
inner join courses as c
on c.cid=e.cid;

-- only students with valid enrollments included

select stuname,course_name
from students s
left join enrollment e
on s.stid=e.stid
left join courses c
on c.cid=e.cid;

select stuname,course_name
from courses c
right join enrollment e
on c.cid=e.cid
right join students s
on e.stid=s.stid;
insert into students (stuname) values('pithambari');

--  students/courses are shown with NULLs where no match exists

select stuname as unions
from students
union 
select course_name
from courses;

select stuname as unionsall
from students
union all 
select course_name 
from courses;

-- UNION removes duplicates, UNION ALL keeps all rows executed 

select stuname, upper(stuname) up from students;
select stuname, lower(stuname) low from students;
select stuname, substring(stuname, 1,5) from students;

select stuname, concat(stuname, ' ', course_name) newname
from students s
join enrollment e
on s.stid=e.stid
join courses c
on c.cid=e.cid;


-- formatted names outputs are displayed

alter table students add joiningdate date;
update students set joiningdate='2020-02-01'  where stid=1;
update students set joiningdate='2020-03-01'  where stid=2;
update students set joiningdate='2020-02-04'  where stid=3;
update students set joiningdate='2020-04-01'  where stid=4;
update students set joiningdate='2021-06-30'  where stid=5;

select stuname, year(joiningdate) tremendousjoin from students;
select now();
select stuname, year(now()) - year(joiningdate) tenure_years from students;
select stuname, datediff(now(), joiningdate) Totaldays from students;
 
 --- students tenure calculated correctly using year,datediff,now
 
 alter table students add firstname varchar(100), add lastname varchar(100);
 update students set firstname='namitha', lastname='waste'  where stid=1;
 update students set firstname='tisha', lastname='ok'  where stid=2;
 update students set firstname='federer', lastname='firstrank'  where stid=3;
 update students set firstname='alugumunju', lastname='topcontender'  where stid=4;
 update students set firstname='promise', lastname='thing'  where stid=5;
 
 Delimiter $$
 create function get_stuname (firstname varchar(100), lastname varchar(100))
 returns varchar(200)
 deterministic
 begin
 return concat(firstname, ' ' ,lastname);
 End $$
 Delimiter ;
 
 select get_stuname(firstname, lastname) fullname from students;
 
 --  Full name is returned when function is called.
 
 select * from students;

delimiter $$
create procedure proceed (in sid int)
begin
select * from students where stid =sid;
end $$
delimiter ;
call proceed(5);

-- students details are returned when procedure is executed

create view student_course_view as
select stuname,course_name from students s
join enrollment e
on s.stid=e.stid
join courses c
on c.cid=e.cid;
select * from student_course_view
 


 -- new view created succesfully
  create view students_multiple_columnview as
  select s.stuname,c.course_name, c.cid, s.stid
  from students s
  join enrollment e
  on s.stid=e.stid
  join courses c
  on e.cid=c.cid;
 
 select * from students_multiple_columnview
 
 -- view return combined datas from all tables
 
 
 
 
 
 
 
 














 



