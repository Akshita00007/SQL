use temp;
create table customer(
id int primary key,
name char(25)
);

desc customer;

insert into customer (id,name) values (101,"akshita");
insert into customer (id,name) values (102,"b");
insert into customer (id,name) values (103,"c");

select *from customer;

create table orders (
productID int primary key,
productName varchar(25),
custID int,				-- foreign key
FOREIGN KEY(custID) REFERENCES customer(id)
);

desc orders;

insert into orders values(1,'Aa',102);
select *from orders;

-- check constraint
create table accountt(
id int primary key,
name varchar(25) unique,
balance INT,
constraint accc_balance_chk check(balance > 1000)
);

-- it will show an error
insert into accountt(id,name,balance) values (101,'A',100);
insert into accountt(id,name,balance) values (101,'A',10000);
-- unique
insert into accountt(id,name,balance) values (101,'A',10000);

-- default 
create table defaultExe(
balance int not null default 0 
);
desc defaultExe;
insert into defaultExe values(1000);
insert into defaultExe values();
insert into defaultExe values();
select * from defaultExe;


