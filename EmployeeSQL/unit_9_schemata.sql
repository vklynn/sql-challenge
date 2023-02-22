-- drop table departments;
create table departments(
    dept_no varchar(10),
    dept_name varchar(30),
    PRIMARY KEY (dept_no));

-- drop table titles;
create table titles(
    title_id varchar,
    title varchar(30),
    PRIMARY KEY (title_id));
-- select *  from titles

-- drop table employees;
create table employees(
    emp_no int,
    emp_title_id varchar(10),
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(2),
    hire_date date,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

-- drop table dept_emp ;
create table dept_emp(
    emp_no int,
    dept_no varchar(10),
	primary key (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

-- drop table dept_manager ;
create table dept_manager(
    dept_no varchar(10),
    emp_no int,
	primary key (dept_no,emp_no),
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

-- drop table salaries;
create table salaries(
    emp_no int,
    salary  int,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));