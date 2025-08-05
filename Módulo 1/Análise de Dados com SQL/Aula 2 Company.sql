-- drop schema company;
drop schema company_constraints;
create schema if not exists company;
use company;
create schema if not exists company_constraints;
use company_constraints;

-- restrição  atribuida a um domínio
-- create domain D_num as int check(D_num> 0 and D_num < 21);

create table employee(
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar(15) NOT NULL,
	Ssn char(9) NOT NULL,
	Bdate DATE,
	Address varchar(30),
	Sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int NOT NULL,
    constraint chk_salary_employee check (Salary> 2000.0), -- Menor salario é 2000.00
	constraint pk_employee primary key (Ssn)
);

alter table employee -- atualização automatica
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;


desc employee;


create table department(
	Dname varchar(15) NOT NULL,
	Dnumber int NOT NULL,
	Mgr_ssn char(9),
	Mgr_start_date date,
    Dept_create_date date,
    constraint chk_data_dept check(Dept_create_date < Mgr_start_date),
	constraint pk_dept primary key(Dnumber),
	constraint unique_name_dept unique(Dname),
	foreign key(Mgr_ssn) references employee(Ssn)
);

-- 'def', 'company_constraints', 'department_ibfk_1', 'company_constraints', 'department', 'FOREIGN KEY', 'YES'
alter table department drop constraint department_ibfk_1;
alter table department
	add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
	on update cascade;
    
desc department;

create table dept_locations(
	Dnumber int NOT NULL,
	Dlocation varchar(15) NOT NULL,
	constraint pk_dept_locations primary key(Dnumber, Dlocation),
	constraint fk_dept_locations foreign key(Dnumber) references department(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;

alter table dept_locations
	add constraint fk_dept_locations foreign key(Dnumber) references department(Dnumber)
    on delete cascade
	on update cascade;
    
create table project(
	 Pname varchar(15) NOT NULL,
	 Pnumber int NOT NULL,
	 Plocation varchar(15),
	 Dnum int NOT NULL,
	 primary key(Pnumber),
	 constraint unique_project unique(Pname),
	 constraint fk_project foreign key(Dnum) references department(Dnumber)
);

create table works_on(
	Essn char(9) NOT NULL,
	Pno int NOT NULL,
	Hours decimal(3,1) NOT NULL,
	primary key(Essn, Pno),
	constraint fk_employee_works_on foreign key(Essn) references employee(Ssn),
	constraint fk_project_works_on foreign key(Pno) references project(Pnumber)
);

-- drop table dependent;
create table dependent(
	Essn char(9) NOT NULL,
	Dependent_name varchar(15) NOT NULL,
	Sex char, -- F OU M
	Bdate date,
	Relationship varchar(8),
	primary key(Essn, Dependent_name),
	constraint fk_dependent foreign key(Essn) references employee(Ssn)
);

show tables;
desc employee;

select * from information_schema.table_constraints
where constraint_schema='company';
select * from information_schema.referential_constraints
where constraint_schema='company';
select * from information_schema.table_constraints
where constraint_schema='company_constraints';
