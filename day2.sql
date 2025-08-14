create database day2;
use day2;
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



/*display employees whose names start with 'a'*/
select empname from employees where empname like 'a%';
/*find employees whose salary between 45000 and 60000*/
select * from employees where salary between 45000 and 60000;
/*show the deptname by using join query*/
select deptname,empname from departments join employees on employees.deptid=departments.deptid ;
/*find number of employees in each dept*/
select deptname,count(empname) from departments join employees on employees.deptid=departments.deptid group by deptname;
/* display all employees icluding those without a department*/
select * from employees left join departments on employees.deptid = departments.deptid;
