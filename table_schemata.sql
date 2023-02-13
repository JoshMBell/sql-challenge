-- SET DATE FORMAT
SET datestyle TO 'ISO, MDY';


-- CREATE TABLE TEMPLATES
CREATE TABLE Titles (
    Title_id VARCHAR(30) PRIMARY KEY,
	Title CHAR(20) NOT NULL
);

CREATE TABLE Employees (
    Emp_no INT PRIMARY KEY,
    Emp_title_id VARCHAR(30),
    Birth_date DATE NOT NULL,
    First_name VARCHAR(30) NOT NULL,
    Last_name VARCHAR(30) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Hire_date DATE NOT NULL,
	FOREIGN KEY(Emp_title_id) REFERENCES Titles(Title_id)
);

CREATE TABLE Salaries (
    Emp_no INT NOT NULL,
	Salary DECIMAL (20, 4) NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

CREATE TABLE Departments (
	Dept_no VARCHAR(30) PRIMARY KEY,
	Dept_name CHAR(30) NOT NULL
);

CREATE TABLE Dept_manager (
	Emp_no INT NOT NULL,
	Dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
	FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

CREATE TABLE Dept_emp (
	Emp_no INT NOT NULL,
	Dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)
);


-- IMPORT CSV DATA
COPY Titles (Title_id, Title)
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/Titles.csv'
DELIMITER ','
CSV HEADER;

COPY Employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/EMPLOY~1.CSV' 
DELIMITER ',' 
CSV HEADER;

COPY Salaries (Emp_no, Salary)
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/Salaries.csv'
DELIMITER ','
CSV HEADER;

COPY Departments (Dept_no, Dept_name)
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/Departments.csv'
DELIMITER ','
CSV HEADER;

COPY Dept_manager (Dept_no, Emp_no)
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/Dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY Dept_emp ( Emp_no, Dept_no)
FROM 'C:/Users/joshm/OneDrive/Desktop/MODULE~4/SQL-CH~1/Data/Dept_emp.csv'
DELIMITER ','
CSV HEADER;


-- CREATE NEW PRIMARY KEY COL FOR Dept_manager and DEPT_emp TABLES
ALTER TABLE Dept_manager ADD COLUMN Dept_emp_id VARCHAR(30);
UPDATE Dept_manager SET Dept_emp_id = Emp_no || Dept_no;
ALTER TABLE Dept_emp ADD COLUMN Dept_emp_id VARCHAR(30);
UPDATE Dept_emp SET Dept_emp_id = Emp_no || Dept_no;
ALTER TABLE Dept_manager ADD PRIMARY KEY (Dept_emp_id);
ALTER TABLE Dept_emp ADD PRIMARY KEY (Dept_emp_id);
