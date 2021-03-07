-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY emp_no;

-- List the manager of each department with the following information: department number, department 
-- name, the manager's employee number, last name, first name.
SELECT DISTINCT ON (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager 
INNER JOIN departments 
ON dept_manager.dept_no= departments.dept_no
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_no;


-- List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names 
-- begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last 
-- name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share 
-- each last name.
SELECT last_name, COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;