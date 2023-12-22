--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
INTO da1
FROM employees as e
	LEFT JOIN salaries as s 
	ON s.emp_no = e.emp_no
ORDER BY e.emp_no
;

SELECT * FROM public.da1

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
INTO da2
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

SELECT * FROM public.da2

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
into da3
FROM departments as d
	JOIN dept_manager as dm  
	ON d.dept_no = dm.dept_no
	JOIN employees as e
	ON dm.emp_no = e.emp_no
;

SELECT * FROM public.da3

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
into da4
FROM dept_manager as dm
	JOIN departments as d
	ON d.dept_no = dm.dept_no
	JOIN employees as e 
	ON e.emp_no = dm.emp_no
;

SELECT * FROM public.da4

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
INTO da5
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name Like 'B%'
;

SELECT * FROM public.da5

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.last_name, e.first_name
INTO da6
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

SELECT * FROM public.da6

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
INTO da7
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development'
;

SELECT * FROM public.da7

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name,
COUNT(e.last_name) AS "frequency"
INTO da8
FROM employees as e
GROUP BY e.last_name
ORDER BY
COUNT(e.last_name) DESC
;

SELECT * FROM public.da8