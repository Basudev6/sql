/*1*/
create database indreni_dbms;
use indreni_dbms;
create table Class
(
	class_id int identity(1,1) primary key not null,
	class_teacher varchar(50) not null
	
);

create table Student
(
	student_id int constraint PK_Student primary key identity(1,1)  not null,
	name varchar(50) not null,
	constraint UC_Student unique (name),
	address varchar(100) not null constraint df_Student default 'Birtamode',
	class_id int not null,
	constraint FK_ClassStudent foreign key (class_id) references class(class_id),
	section varchar(50),
	Age int not null constraint df_Age default 16,
	check(Age>=15)
);

/*2*/
alter table Student
drop constraint PK_Student;

/*3*/
alter table Student
drop constraint FK_ClassStudent;

/*4*/
alter table Student
add constraint PK_Student primary key (student_id);

/*5*/

alter table Student
add constraint FK_ClassStudent
foreign key (class_id) references Class(class_id);

/*6*/

alter table Student
drop constraint UC_Student; 



/*7*/

/*alter table Student
alter column Age drop default; */

alter table Student
drop constraint df_Age;


/*8*/
alter table Student
add constraint UC_Student unique (section);

/*9*/


alter table Student
add constraint df_Age
default 18 for Age;

/*10*/

exec sp_rename 'Student.address', 'location', 'COLUMN';

/*11*/
alter table Student
add email varchar(255) not null;

/*12*/
alter table Student
drop constraint UC_Student;

alter table Student
drop column section ;

/*13*/
alter table Student
add contact int;

/*14*/
alter table Student
alter column contact varchar(10) ;

alter table Student
add constraint UC_Student unique (contact);

/*15*/

alter table Student
drop constraint df_Student;

alter table Student
add constraint df_address
default 'kathmandu' for address;

/*16*/

insert into class (class_teacher) values('hari sharma');
insert into class (class_teacher) values('ram bhattarai');
insert into class (class_teacher) values('ashok sapkota');
insert into class (class_teacher) values('alex poudel');
insert into class (class_teacher) values('ajaya subedi');

insert into Student (name,address,class_id,Age,email,contact) values('ram prasad','ktm',1,20,'ram@gmail.com','9845256101');
insert into Student (name,address,class_id,Age,email,contact) values('shyam poudel','pokhara',2,21,'shyam@gmail.com','9845724590');
insert into Student (name,address,class_id,Age,email,contact) values('sita sapkota','birtamode',3,18,'sita@gmail.com','9808732918');
insert into Student (name,address,class_id,Age,email,contact) values('ashok basel','dolpa',4,22,'ashok@gmail.com','9864210483');
insert into Student (name,address,class_id,Age,email,contact) values('ajaya bhattarai','pokhara',5,19,'ajaya@gmail.com','9863910235');
  

 /* 17*/

 update Student set name='prakash adhikari', address='chitwan' where student_id=5;  

 /* 18*/

 delete from Student where Age>20;

 /*19 */

 update Student set Age=25 where address='birtamode'; 

 /* 20 */

  delete from Student where student_id=1;

  /* 21*/

  select * from Student;
  
  /* 22 */

  select * from Student where Student_id=3;
  
  /*23 */

  select name, address from Student where Age>21;
  
  /* 24*/
  
  select student_id, name from Student where address='Birtamode' ;

  /* 25*/

  select * from Student where class_id=5 and address='kathmandu' ;

  /* 26*/
  
  select max(Age) from Student;

  /*27 */

  select min(Age) from Student where address='Birtamode';

  /* 28 */

  select count(name) from Student where class_id=5 and Age>19 ;

  /* 29*/

  alter table Student
  add section varchar(20);

 
  update Student set section='A' where class_id=3;
  update Student set section='B' where class_id=5;


  select avg(Age) from Student where class_id=5 and section='B' ;

   /*30*/

	select * from Student where address like 'B%'  ;

 /* 31*/

 select count(name) from Student where name like '%R';

 /*32 */

 select name, Age from Student where address='birtamode' or address='kathmandu';

 /*33 */

 select sum(Age) from Student where student_id<=3;

  /* 34*/

  select * from Student where Age between 18 and 22;

   /* 35*/

   select count(student_id) as TotalStudent, Age
   from Student 
   group by Age;

    /*36 */

	select class_id, name, max(Age) as Max_age from Student 
	group by name,class_id;

	/*37*/

	select * from Student order by student_id desc;

	/*38*/
	select student_id, name from Student where Age>20 order by name ; 

	/*39*/

	select * from Student where Age=(select max(Age) from Student);

	/*40*/

	select student_id, name from Student where student_id= (select max(student_id) from Student);

	/*41*/

	select name, Age from Student where Age<(select avg(Age) from Student);

	/*42*/

	select * from Student 
	except
	select * from Student where address='Birtamode' or address='kathmandu' order by Age;

	/*43*/

	select * from Student
	except
	select * from Student where address='Birtamode';

	/*44*/

	select address from Student where name='ram prasad';


	/*45*/

	select * from Student where address='Birtamode';

