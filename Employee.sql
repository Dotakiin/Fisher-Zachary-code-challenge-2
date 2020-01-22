Create Table Department(
ID int identity primary key,
Name varchar(20) not null,
Location varchar(20) not null
)
go
Create Table Employee(
ID int identity primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
SSN varchar(9) unique not null check(len (SSN)=9),
DeptId int foreign key references Department(ID)
)
go
Create Table EmpDetails(
ID int identity primary key,
EmployeeID int foreign key references Employee(ID),
Salary int not null,
"Address 1" varchar(50),
"Address 2" varchar(50),
City varchar(50),
State varchar(50),
Country varchar(50)
)
go
insert into Department (Name, Location) VALUES ('Mail', 'Arlington');
insert into Department (Name, Location) values ('IT', 'Arlington');
insert into Department (Name, Location) values ('Admin', 'Arlington');
insert into Employee ( FirstName, LastName, SSN, DeptId) values ('Bob', 'Jones', '111223333',2)
insert into Employee ( FirstName, LastName, SSN, DeptId) values ('Phil', 'Curtis', '111223334',3)
insert into Employee ( FirstName, LastName, SSN, DeptId) values ('John', 'Smith', '111223335',1)
insert into EmpDetails( EmployeeID, Salary, [Address 1], City, State, Country) values (1, 45000, '1 1st St', 'Arlington', 'Texas', 'United States')
insert into EmpDetails( EmployeeID, Salary, [Address 1], City, State, Country) values (2, 45000, '3 1st St', 'Arlington', 'Texas', 'United States')
insert into EmpDetails( EmployeeID, Salary, [Address 1], City, State, Country) values (3, 45000, '5 1st St', 'Arlington', 'Texas', 'United States')
insert into Employee( FirstName, LastName, SSN, DeptId) values ('Tina', 'Smith', '111223336',1)
insert into Department (Name, Location) VALUES ('Marketing', 'Arlington');
insert into EmpDetails( EmployeeID, Salary, [Address 1], City, State, Country) values (4, 45000, '7 1st St', 'Arlington', 'Texas', 'United States')
go
Select * from Employee join Department on Employee.DeptId = Department.ID where Department.Name = 'Marketing'
go
Select sum(Salary) as 'Total Marketing Salary' from EmpDetails join Employee on EmployeeID = Employee.ID join Department on Employee.DeptId = Department.ID where Department.Name ='Marketing'
go
Select Department.Name as 'Department Name', Count(*) as 'Total Employees' from Employee join Department on Employee.DeptId = Department.ID Group By department.name 
go

update EmpDetails set Salary = 90000 where EmployeeID = (select ID from Employee where FirstName = 'Tina' and LastName = 'Smith')


--drop table EmpDetails
--go
--drop table Employee
--go
--drop table Department