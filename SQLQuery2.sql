
use indreni_dbms;

/*46*/

create table Department
(
	Dept_id int constraint PK_Department primary key identity(1,1) not null,
	Dept_Name varchar(50),
	Floor varchar(50)
);



create table Employee
(
	Emp_id int constraint PK_Employee primary key identity(1,1) not null,
	Name varchar(50),
	Address varchar(50),
	Salary int,
	Dept_id int not null,
	constraint FK_Dept_id foreign key (Dept_id) references Department (Dept_id)
);

/* inserting data in Department table */

	insert into Department (Dept_Name,Floor) values('Human Resource','1st');
	insert into Department (Dept_Name,Floor) values('IT','2nd');
	insert into Department (Dept_Name,Floor) values('Marketing','3rd');
	insert into Department (Dept_Name,Floor) values('Accounting','4th');

/* inserting data in Employee table */

	insert into Employee (Name,Address,Salary,Dept_id) values ('Ram sapkota','kathmandu',20000,1);
	insert into Employee (Name,Address,Salary,Dept_id) values ('Shyam sharm','pokhara',30000,2);
	insert into Employee (Name,Address,Salary,Dept_id) values ('Sita poudel','Bharatpur',10000,3);
	insert into Employee (Name,Address,Salary,Dept_id) values ('Ashok Rijal','Kathmandu',50000,4);




/*47 */

/* inner join */

  select Employee.Emp_id,Employee.Name,Department.Dept_Name
  from Employee
  inner join Department on Employee.Dept_id=Department.Dept_id;

/* left join */

	select Employee.Emp_id,Employee.Name,Department.Dept_Name
	from Employee
	left join Department on Employee.Dept_id= Department.Dept_id;

/* right join */

	select Employee.Emp_id,Employee.Name,Department.Dept_Name
	from Employee
	right join Department on Employee.Dept_id= Department.Dept_id;

/* full join */

	select Employee.Emp_id,Employee.Name,Department.Dept_Name
	from Employee
	full join Department on Employee.Dept_id= Department.Dept_id;

/*48*/

	select Name,Address from Employee where Salary between 10000 and 20000;

/*49*/

	select Employee.Emp_id,Employee.Name,Department.Dept_Name
	from Employee
	full join Department on Employee.Dept_id= Department.Dept_id
	where Department.Floor ='1st';

/*50*/

	select * from Department where Floor='2nd';

/* 51*/
	
	select Employee.Name,Employee.Address,Department.Dept_Name
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Employee.Address='pokhara';

/*52*/

	select Emp_id,Name from Employee where salary>10000 and Address='Kathmandu';

/*53*/
	
	alter table Employee
	add Age int;

	update Employee set Age=50 where Dept_id=1;
	update Employee set Age=40 where Dept_id=2;
	update Employee set Age=25 where Dept_id=3;
	update Employee set Age=30 where Dept_id=4;

	
	select Employee.Name,Department.Dept_Name,Department.Floor
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Employee.Name like 'R%'
	and Employee.Age>30;
	 
	
/*54*/

	select Employee.Emp_id,Department.Dept_Name
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Department.Floor='1st'
	order by Employee.Salary;

/*55*/
	 select count(Employee.Name) as Total_Employee,Department.Dept_Name
	 from Employee
	 full join Department on Employee.Dept_id=Department.Dept_id
	 group by Department.Dept_Name;

/*56*/

	select max(Employee.Salary) as Salary,Department.Floor
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Department.Dept_Name='IT'
	group by Department.Floor;

/*57*/

	select Employee.Name,Department.Dept_Name
	from Employee 
	full join Department on Employee.Dept_id=Department.Dept_id
	where Employee.Salary>(select avg(Salary) from Employee);

/*58*/

	select Employee.Name,Employee.Address
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Department.Floor='2nd' and Employee.Salary between 20000 and 30000;

/*59*/

	select Employee.Name,Department.Dept_Name
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Employee.Age=(select min(Age) from Employee);
	

/*60*/

	select sum(Employee.Salary) as Sum_of_salary
	from Employee
	full join Department on Employee.Dept_id=Department.Dept_id
	where Employee.Name like '%s' and Department.Dept_Name='Account';