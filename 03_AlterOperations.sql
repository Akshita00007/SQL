-- ALTER Operations
use temp;
create table actors(
id int not null primary key,
name char(25),
age int,
moviesCount int
);
insert into actors(id,name,age,moviesCount) values (101,'Shaktiman',24,3);
insert into actors(id,name,age,moviesCount) values (102,'Ninja Hattori',28,1), (103,'Doremon',25,3),(104,'Shinchan',26,4),(105,'Nobita',22,8);

desc actors;
select *from actors;

-- add column
ALTER TABLE actors ADD nationality char(25);
desc actors;
-- NULL value will be stored by default
select *from actors;
ALTER TABLE actors ADD salary int default 1000;
desc actors;
select *from actors;


-- MODIFY
ALTER TABLE actors MODIFY name varchar(1024);
desc actors;

-- CHANGE COLUMN
ALTER TABLE actors CHANGE COLUMN name first_name varchar(1024);
desc actors;

-- DROP COLUMN
ALTER TABLE actors DROP COLUMN nationality;
desc actors;

-- RENMAE 
ALTER TABLE actors RENAME TO Actorss;
desc actorss;