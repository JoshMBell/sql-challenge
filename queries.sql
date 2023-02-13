-- Data Analysis
-- 1
SELECT
	e.Emp_no,
	e.Last_name,
	e.First_name,
	e.Sex,
	ROUND(s.Salary, 2) AS Salary
FROM Employees AS e 
INNER JOIN Salaries AS s
	ON e.Emp_no = s.Emp_no;


-- 2
SELECT
	First_name,
	Last_name,
	Hire_date
FROM Employees
WHERE Hire_date >= '1986-01-01' AND Hire_date < '1987-01-01';


-- 3
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

-- 4
