-- Data Analysis
-- 1 List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.Emp_no,
	e.Last_name,
	e.First_name,
	e.Sex,
	ROUND(s.Salary, 2) AS Salary
FROM Employees AS e 
	INNER JOIN Salaries AS s ON e.Emp_no = s.Emp_no;
	

-- 2 List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	First_name,
	Last_name,
	Hire_date
FROM Employees
WHERE 
	Hire_date >= '1986-01-01' 
	AND Hire_date < '1987-01-01';


-- 3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.Dept_no, 
    d.Dept_name, 
    e.Emp_no, 
    e.Last_name, 
    e.First_name
FROM 
    Departments AS d
	JOIN Dept_manager AS dm ON d.dept_no = dm.dept_no
	JOIN Employees as e ON e.emp_no = dm.emp_no;

-- 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name, 
	Departments.dept_no, 
	Departments.dept_name
FROM Employees
	JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
	JOIN Departments ON Dept_emp.dept_no = Departments.dept_no;
	
	
-- 5 List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	First_name,
	Last_name,
	Sex
FROM Employees
WHERE
	First_name like 'Hercules'
	AND Last_name like 'B%';


-- 6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name
FROM Employees AS e
	JOIN Dept_emp AS de ON e.emp_no = de.emp_no
	JOIN Departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- 7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM Employees AS e
	JOIN Dept_emp AS de ON e.emp_no = de.emp_no
	JOIN Departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';


-- 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name,
	COUNT(*) as frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;