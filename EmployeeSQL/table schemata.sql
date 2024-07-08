CREATE TABLE departments (
    dept_no varchar   NOT NULL PRIMARY KEY,
    dept_name varchar   NOT NULL
    
     )

CREATE TABLE titles (
    title_id varchar   NOT NULL PRIMARY KEY ,
    title varchar   NOT NULL
     )


CREATE TABLE employees (
    emp_no int   NOT NULL PRIMARY KEY,
    emp_title_id varchar   NOT NULL,
    birth_date date    NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
    )

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)



CREATE TABLE salaries (
    emp_no int   NOT NULL PRIMARY KEY,
    salary int   NOT NULL
)

select * from departments
select * from salaries
select * from titles	
select * from employees
select * from dept_manager
select * from dept_emp