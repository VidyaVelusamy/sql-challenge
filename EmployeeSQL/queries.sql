--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
	from employees as e 
	join salaries as s on e.emp_no = s.emp_no
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name,hire_date
	from employees where EXTRACT(YEAR FROM hire_date) = 1986;
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name 
	from departments as d join dept_manager as dm on dm.dept_no = d.dept_no
	join employees as e on dm.emp_no = e.emp_no
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no,e.emp_no,e.last_name,e.first_name,dept_name
	from employees as e join dept_emp as de on e.emp_no = de.emp_no
	join departments as d on d.dept_no = de.dept_no
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name,last_name,sex from employees where first_name ='Hercules' and last_name like 'B%'
--List each employee in the Sales department, including their employee number, last name, and first name.
select emp_no,last_name ,first_name from employees 
	where emp_no in (select emp_no from dept_emp 
	where dept_no in (select dept_no from departments where dept_name ='Sales')) 
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no,last_name ,first_name from employees 
	where emp_no in (select emp_no from dept_emp 
	where dept_no in (select dept_no from departments where dept_name in('Sales','Development')))
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, COUNT(*) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC