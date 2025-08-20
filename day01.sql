create database day1;
use day1;
CREATE TABLE departments (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(10)
);
INSERT INTO departments
VALUES (1, 'hr'), (2, 'it'), (3, 'sales');
select * from departments;

CREATE TABLE employees (
    empid INT PRIMARY KEY,
    empname VARCHAR(10),
    deptid INT,
    salary INT,
    hiredate DATE,
    FOREIGN KEY (deptid) REFERENCES departments(deptid)
);
INSERT INTO employees
VALUES 
  (101, 'john', 1, 50000, '2018-02-12'),
  (102, 'alice', 2, 60000, '2019-07-10'),
  (103, 'bob', 1, 55000, '2020-05-05'),
  (104, 'carol', 3, 45000, '2017-09-20');

select * from employees;

/*display all records from the employee table*/
select * from employees;
/* display only empname and salary of all employees*/
select empname,salary from employees;
/*find all employees who belong to it department*/
SELECT * from employees JOIN departments ON employees.deptid = departments.deptid WHERE departments.deptname = 'it';
/*list employees whose salary greater than 50000*/
select * from employees where salary>50000;
/*find employees hired before 2020-01-01*/
select * from employees where hiredate < '2020-01-01';
/* display employees in desc order of salary*/
select * from employees order by salary desc;
/* counnt total number of employees*/
select count(*) from employees;
/* find average salary from employees*/
select avg(salary) from employees;
/* find the maximum salary in each department*/
SELECT deptname,max(salary) from employees JOIN departments ON employees.deptid = departments.deptid  group by deptname ;
/*find departments having more than 1 employee*/
SELECT deptname from employees JOIN departments ON employees.deptid = departments.deptid  group by deptname having count(employees.empname)>1;




