-- Inserção de dados no bd company

use company_constraints;
show tables;

-- load data infile 'path' into table emplyee;

select * from employee;
insert into employee values ('John','B', 'Smith',123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5);

insert into employee values ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 123456789, 5),
							('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
							('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, null, 4),
							('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 987654321, 5),
							('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
							('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 123456789, 4),
							('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, 333445555, 1);
                            
insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
							 (333445555, 'Joy', 'F', '1958-05-03', 'Spouse' ),
							 (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
							 (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
							 (123456789, 'Alice', 'F', '1988-12-30', 'Daughter' ),
							 (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
                             
insert into department values ('Research', 5, 333445555, '1988-05-22', '1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
							   ('Headquarters', 1, 888665555, '1981-06-19', '1980-06-19');

insert into dept_locations values (1, 'Houston'),
								  (4, 'Stafford'),
								  (5, 'Bellaire'),
								  (5, 'Sugarland'),
								  (5, 'Houston');
							
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
						   ('Computerization', 10, 'Stafford', 4),
						   ('Reorganization', 20, 'Houston', 1),
						   ('Newbenefits', 30, 'Stafford', 4);
                           
insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
							(666884444, 3, 40.0),
							(453453453, 1, 20.0),
							(453453453, 2, 20.0),
							(333445555, 2, 10.0),
							(333445555, 3, 10.0),
							(333445555, 10, 10.0),
							(333445555, 20, 10.0),
							(999887777, 30, 30.0),
							(999887777, 10, 10.0),
							(987987987, 10, 35.0),
							(987987987, 30, 5.0),
							(987654321, 30, 20.0),
							(987654321, 20, 15.0),
							(888665555, 20, 0.0);
							
select * from employee;

-- Geresente e seu departamento
select Ssn, Fname, Dname from employee e, department d where (e.Ssn=d.Mgr_ssn);

-- recuperando dependentes dos empregrados
select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

--
select Bdate, Address from employee where Fname = 'John' and Minit='B' and Lname='Smith';

-- recuperando departamento específico
select * from departament where Dname = 'Research';

select Fname, Lname, Address from employee, departament where Dname='Research' and Dnumber=Dno;

desc works_on;
select * from project;

select Pname, Essn, Fname, Hours
from project, works_on, employee
where Pnumber = Pno and Essn = Ssn;

-- QUERIES COM ALIAS

select * from departament;
select * from dept_locations;

-- retira a ambiguidade através do alias ou AS Statement
select Dname as Department_name
from departament as d, dept_locations as l
where Dnumber = Dnumber;

select Dname, l.Dlocation as Department_name
from departament as d, dept_locations as l
where d.Dnumber = number = l.Dnumber;

select concat(Fname, ' ', Lname) as Employee from employee;

--
--
-- Expressões e alias

-- Recolhendo valor do INSS
select Fname, Lname, Salary, Salary*0.011 from employee;
select Fname, Lname, Salary, Salary*0.011 as INSS from employee;
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee; -- round serve para atrinuir casas decimais

-- Definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
desc project;
desc works_on;
select * from employee e, works_on as w, project as p where (e.Ssn=w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
select concat(Fname, ' ', Lname) as Complete_name, Salary, round(Salary*1.1,2) as increased_salary from employee e, works_on as w, project as p where (e.Ssn=w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');

-- definindo alias para legibilidade da consulta
select concat(e.Fname, ' ', e.Lname) as Name, e.Address from employee e, department d where d.Dname='Research' and d.Dnumber=e.Dno;


--
--
-- Expressões e concatenação de strings

desc dept_locations;
select * from dept_locations;

-- Recuperando informações dos departamentos presentes em Stafford
select Dname as Department_Name, Mgr_ssn as Manager, Address from department d, dept_locations l, employee e where d.Dnumber=l.Dnumber and Dlocation='Stafford';

-- Recuperando todos os gerentes que trabalham em Stafford
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager from department d, dept_locations l, employee e where d.Dnumber=l.Dnumber and Dlocation='Stafford' and Mgr_ssn=e.Ssn;

desc dept_locations;
desc department;
-- Recuperando todos os gerentes, departamentos e seus nomes
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager, Dlocation from department d, dept_locations l, employee e where d.Dnumber=l.Dnumber and Mgr_ssn=e.Ssn;

-- Recuperando todos os gerentes que trabalham em Stafford
select Pnumber, Dnum, Lname, Address, Bdate, p.Plocation from department d, project p, employee e where d.Dnumber=p.Dnum and p.Plocation='Stafford' and Mgr_ssn=e.Ssn;

/*
| Parte        | Interpretação                                                           |
| ------------ | ----------------------------------------------------------------------- |
| `\_`         | Escapa `_` → significa o caractere **underscore** real, não um curinga  |
| `\%`         | Escapa `%` → significa o caractere **porcentagem** real, não um curinga |
| `ESCAPE '\'` | Define que a barra `\` é usada para "escapar" caracteres especiais      |

SELECT * FROM tabela WHERE coluna LIKE 'AB\_CD\%EF' ESCAPE '\';
*/

/*
SELECT * FROM produtos WHERE preco BETWEEN 10 AND 50;
Portanto:
Pega o 10 ✅
Pega o 50 ✅
Pega tudo entre 10 e 50 ✅
*/

/*
-- Quatro letras, começando com 'j'
SELECT * FROM usuarios WHERE nome LIKE 'j___';

-- Segunda letra é 'a'
SELECT * FROM usuarios WHERE nome LIKE '_a__';
*/

/*
-- Começa com 'jo'
SELECT * FROM usuarios WHERE nome LIKE 'jo%';

-- Termina com 'ão'
SELECT * FROM usuarios WHERE nome LIKE '%ão';

-- Contém 'ar'
SELECT * FROM usuarios WHERE nome LIKE '%ar%';
*/

-- like e bitween
select * from project;
select * from employee;
select * from department;
select * from project;

select concat(Fname,' ',Lname) as Complete_name, Dname as Department_Name, Address from employee, department where(Dno=Dnumber and Address like '%Houston%');

select concat(Fname,' ',Lname) as Complete_name, Address from employee where(Address like '%Houston%');

select Fname, Lname, Salary from employee where (Salary>30000 and Salary<40000);
select Fname, Lname, Salary from employee where (Salary between 20000 and 40000);

--
--
-- Operadores lógicos

select Bdate, Address from employee where Fname='John' and Minit='B' and Lname='Smith';

select * from department;
select * from department where Dname='Research' or Dname='Administration';

select Fname, Lname from employee, department where Dname='Research' and Dnumber=Dno;
select concat(Fname, ' ',Lname) as Complete_name from employee, department where Dname='Research' and Dnumber=Dno;

-- UNION, EXCEPT E INTERSECT
(SELECT DISTINCT Pnumber FROM PROJECT, DEPARTMENT, EMPLOYEE WHERE Dnum = Dnumber AND Mgr_ssn = Ssn and Lname = 'Smith')
UNION
(SELECT DISTINCT Pnumber FROM PROJECT, WORKS_ON, EMPLOYEE WHERE Pnumber = Pno AND Essn = Ssn and Lname = 'Smith');

--
--
-- Subqueries

select * from employee;
 
select distinct Pnumber 
from project 
where Pnumber in(
		select distinct Pno
		from works_on, employee
		where (Essn=Ssn and Lname='Smith')
	)
    or
    (
		select Pnumber
		from project, department, employee
		where (Mgr_ssn=Ssn and Lname='Smith' and Dnum=Dnumber)
    );

select distinct *
from works_on
where (Pno,Hours) IN(
	select Pno, Hours
    from works_on
    where Essn='123456789'); 

--
--
-- Cláusulas com exists e unique

-- Quais employees possuem dependentes?
select Fname, Lname
from employee as e
where exists(
	select *
    from dependent as d
    where e.Ssn=d.Essn and Relationship='Daughter');

-- Quais empregados não posuem dependentes
select Fname, Lname
from employee as e
where not exists(
	select *
    from dependent as d
    where e.Ssn=d.Essn);

-- 
select Fname, Lname
from employee as e, department d
where (e.Ssn=d.Mgr_ssn) and exists(
	select *
    from dependent as d
    where e.Ssn=d.Essn);

desc dependent;

select Fname, Lname
from employee
where (
select count(*)
from dependent
where Ssn=Essn)>=2;

select distinct Essn, Pno
from works_on
where Pno in (1,2,3);


--
--
-- Cláusulas de ordenação

select *
from employee
order by Dno;

select *
from employee
order by Fname;

select *
from employee
order by Fname, Lname;

-- Nome do departamento, nome do gerente do departamento
select distinct d.Dname, concat(e.Fname,' ',e.Lname) as Manager, Address
from department as d, employee e, works_on as w, project p
where (d.Dnumber=e.Dno and e.Ssn=d.Mgr_ssn and w.Pno=p.Pnumber)
order by d.Dname, Manager;

-- Recupero todos os empregados e seus projetos em andamento
select d.Dname as Department, concat(e.Fname,' ',e.Lname) as Employee, p.Pname as Project_Name, Address
from department as d, employee e, works_on w, project p
where(d.Dnumber=e.Dno and e.Ssn=w.Essn and w.Pno=p.Pnumber)
order by d.Dname desc, Employee asc;

-- recupero todos os empregados e seus projetos em andamento
select d.Dname as Department, concat(e.Fname,' ',e.Lname) as Employee, p.Pname as Project_Name, Address
from department as d, employee e, works_on w, project p
where(d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
order by d.Dname desc, Employee asc;

/*
SELECT <attribute list>
FROM <table list>
[ WHERE <condition>
[ ORDER BY <attribute list> ];
*/

--
--
-- Funções e cláusulas de agrupamento


select * 
from employee;

select count(*) 
from employee;

select count(*) 
from employee, department
where Dno=Dnumber and Dname='Research';

select Dno, count(*) as Number_of_employees, round(avg(Salary),2) as Salary_avg 
from employee
group by Dno;

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber=Pno
group by Pnumber, Pname;

select count(distinct Salary)
from employee;

select sum(Salary) as Total_salary, max(Salary) as Max_salary, min(Salary) as Min_salary, round(avg(Salary),2) as Avg_salary
from employee;

-- usando join
select sum(Salary) as Total_salary, max(Salary) as Max_salary, min(Salary) as Min_salary, round(avg(Salary),2) as Avg_salary
from (employee join department on Dno=Dnumber)
where Dname='Research';


select Lname, Fname
from employee
where(
	select count(*)
    from dependent
    where Ssn=Essn)>=2;


--
--
-- group by

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber=Pno
group by Pnumber, Pname;

show tables;

select Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) as AVG_Salary
from project, works_on, employee
where Pnumber=Pno and Ssn=Essn
group by Pnumber, Pname;

select Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) as AVG_Salary
from project, works_on, employee
where Pnumber=Pno and Ssn=Essn
group by Pnumber
order by count(*);

select Pnumber, Pname, count(*) AS Number_of_register, round(avg(Salary),2) as AVG_Salary
from project, works_on, employee
where Pnumber=Pno and Ssn=Essn
group by Pnumber
order by avg(Salary) desc;

--
--
-- having

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber=Pno
group by Pnumber, Pname
having count(*)>2;

select Dno, count(*)
from employee
where Salary>30000
group by Dno
having count(*)>=2;

select Dno as Department, count(*) as Number_of_Employees
from employee
where Salary>20000 and Dno in (
	select Dno
    from employee
    group by Dno
    having count(*)>=2)
group by Dno;


--
--
-- case statement
show tables;

select Fname, Salary, Dno from employee;

update employee set Salary=
	case
		when Dno=5 then Salary+2000
        when Dno=4 then Salary+1500
        when Dno=1 then Salary+3000
        else Salary+0
    end;

/*
EXEMPLO QUERRY

SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) as tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) as non_tornado_precipitation
FROM station_data
GROUP BY year, month;
*/

/*
SELECT e.fname, e.Iname, d.name
FROM employee e JOIN department d; 

Tabelas de exemplo:
--employee
| emp_id  | fname | Iname | dept_id  |
| ------- | ----- | ----- | -------- |
| 1       | Maria | Silva | 1        |
| 2       | João  | Souza | 2        |

--department
| dept_id  | name       |
| -------- | ---------- |
| 1        | RH         |
| 2        | Financeiro |
| 3        | Marketing  |

==Resultado do produto cartesiano:
| fname | Iname | name       |
| ----- | ----- | ---------- |
| Maria | Silva | RH         |
| Maria | Silva | Financeiro |
| Maria | Silva | Marketing  |
| João  | Souza | RH         |
| João  | Souza | Financeiro |
| João  | Souza | Marketing  |

O CROSS JOIN FAZ A MESMA COISA 
*/

--
--
-- JOIN STATEMENT
desc employee;
desc works_on;

select * from employee, works_on where Ssn=Essn;
select * from employee join works_on on Ssn=Essn;

select * from employee join department on Ssn=Mgr_ssn;

select Fname, Lname, Address
from (employee join department on Dno=Dnumber)
where Dname='Research';

-- JOIN
select * from employee join works_on;

-- JOIN ON -> INNER JOIN ON (é o join com condicional)
desc project;
desc department;
show tables;
desc dependent;
desc dept_locations;

select * from employee join works_on on Ssn=Essn;
select * from employee join department on Ssn=Mgr_ssn;

select Fname, Lname, Address
from (employee join department on Dno=Dnumber)
where Dname='Research';

select * from dept_locations; -- Address e Dnumber
select * from department;     -- Dname, Dept_create_date

select Dname as Department, Dept_create_date as StartDate, Dlocation as Location
from department join dept_locations using(Dnumber)
order by StartDate;

-- CROSS JOIN - produto cartesiano

select * from employee cross join dependent;

--
--
-- JOIN com mais de 3 tables
desc project;
desc works_on;
-- project, works_on e employee
select concat(Fname,' ',Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName, Pno as ProjectNumber, Plocation as Location
from employee inner join works_on on Ssn=Essn
			  inner join project on Pno=Pnumber
where Pname like 'Product%'
order by Pnumber;

-- department, dept_location, employee
select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus
from department inner join dept_locations using(Dnumber)
				inner join employee on Ssn=Mgr_ssn
group by Dnumber
having count(*)>1;

select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus
from department inner join dept_locations using(Dnumber)
				inner join (dependent inner join employee on Ssn=Essn) on Ssn=Mgr_ssn
group by Dnumber;

-- department, project e employee
desc department;
desc project;
desc employee;

select * from project;

select concat(Fname, ' ', Lname) as Manager, Ssn
from employee inner join department on Ssn=Mgr_ssn
			  inner join project on Dnumber=Dnum
where Pname='ProductZ';

--
--
-- OUTER JOIN

select * from employee;
select * from dependent;

select * 
from employee inner join dependent on Ssn=Essn;

select * 
from employee left join dependent on Ssn=Essn;

select * 
from employee left outer join dependent on Ssn=Essn;
