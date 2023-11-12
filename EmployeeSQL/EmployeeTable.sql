--Below is the table schema, which creates the tables neccessary to read in the csv data files.
--Primary keys and foreign keys are also created in this schema.

CREATE TABLE Titles (
    title_id varchar(10) NOT NULL,
    title varchar(50) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no int NOT NULL,
    emp_title_id varchar(50) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    sex varchar(2) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Departments (
    dept_no varchar(20) NOT NULL,
    dept_name varchar(200) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE DeptEmployees (
    emp_no int NOT NULL,
    dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE DeptManager (
    dept_no varchar NOT NULL,
    emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);