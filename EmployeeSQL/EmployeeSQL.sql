CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR
);

SELECT * FROM departments;

drop table dept_emp;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE	
);

SELECT * FROM dept_manager

CREATE TABLE employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE	
);

SELECT * FROM employees

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

SELECT * FROM salaries

CREATE TABLE titles(
	emp_no INT,
	titles VARCHAR,
	from_date DATE,
	to_date DATE
);

SELECT * FROM titles

--List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,
dept_manager.from_date, dept_manager.to_date
FROM dept_manager INNER JOIN departments
	ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees
	ON (dept_manager.emp_no = employees.emp_no)


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees INNER JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
	ON (dept_emp.dept_no = departments.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
	ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales'


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
	ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "Last Name Count"
from employees
GROUP BY last_name 
Order by "Last Name Count" DESC