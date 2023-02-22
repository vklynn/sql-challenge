-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SSELECT dept_manager.dept_no, 
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, 
employees.first_name
FROM dept_manager
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no;
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select departments.dept_no,
employees.emp_no,
employees.last_name,
employees.first_name, 
departments.dept_name
from employees 
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments 
on dept_emp.dept_no = departments.dept_no
order by departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, 
employees.last_name, 
employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND Left (employees.last_name, 1) = 'B';
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name,
COUNT(*)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC;

-- test
-- select * from employees
-- WHERE employees.last_name = 'Sadowsky'


-- Extras 
-- select employees.emp_no,
-- employees.last_name,
-- employees.first_name, 
-- departments.dept_name
-- from employees 
-- inner join dept_emp
-- on employees.emp_no = dept_emp.emp_no
-- inner join departments 
-- on dept_emp.dept_no = departments.dept_no
-- order by employees.emp_no;