create table department (
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);
create table title (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

create table employees (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);