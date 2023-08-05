create database orgg;
use orgg;

CREATE TABLE Workers (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);


INSERT INTO Workers 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
        	SELECT* FROM Workers;
            
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
		
		SELECT * FROM Bonus;	
        
        CREATE TABLE Titlee (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Workers(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Titlee 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT * FROM Title;
 
 select salary from workers;
 
 -- dual table
 select 55+11;

-- where
select * from workers where salary >2000;
select * from workers where department='hr';
select * from workers where salary between 0 and 100000;
select salary from workers;

-- reduce OR statements
-- hr,admin
select * from workers where department ='hr' or department='admin';
-- if there are many departments so we have to use multiple or
-- in-> a better way
select * from workers where department in('hr','admin');

-- not
select *from workers where department not in('hr','admin');

-- is NULL
insert into workers values (009, NULL,'Arora', 100000, '14-02-20 09.00.00', 'HR');
select *from workers;
select * from workers where first_name is NULL;

-- % operator
select * from workers where first_name LIKE '%i%';
-- _ 
-- i should come in 2nd no
select * from workers where first_name like '_i%';

-- sorting using order by
-- by default order asc
select * from workers order by salary;
select * from workers order by salary desc;

-- distinct
select * from workers;
select department from workers;
select distinct department from workers;

-- group by
--      x                                 y    -> should be same
-- if not used any aggregation functions then group by works same as distinct
select department from workers group by department;
select department, COUNT(department)   from workers group by department;

-- find average salary per department
select department, AVG(salary) from workers group by department;

-- min salary
select department, MIN(salary) from workers group by department; 
select * from workers;
	
-- max salary
select department, MAX(salary) from workers group by department;

-- total salary
select department, SUM(salary) from workers group by department;

-- having with GROUP BY
-- department with workers more than 2
select department, count(department) from workers group by department HAVING COUNT(department) > 2;