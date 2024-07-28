use mydb;

create table Batches (
	batch_id int unique,
    batch_name varChar(50)
);
insert into batches (batch_id, batch_name) values(1, 'SQL'),(2, 'DSA'),(3,'LLD');

create table students (
	student_id int auto_increment primary key,  
    first_name varchar(50),
    last_name varchar(20),
    batch_id int,
    foreign key(batch_id) references batches(batch_id) 
    on delete set null 
    on update cascade # if we ignore this line then on updating batch table we get following Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE SET NULL)
);
insert into students (first_name,last_name,batch_id) values('Mark','Zuckerberg',1),('Bill', 'Gates', 2),('Jeff','Bezos',3);


select * from students;
select * from batches;

delete from batches where batch_id = 1;
update batches set batch_id = 5 where batch_id = 1;

drop table students;
drop table batches;