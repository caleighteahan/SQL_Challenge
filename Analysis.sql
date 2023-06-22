-- 1.List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on 
salaries.emp_no = employees.emp_no
order by salaries.emp_no
;
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
select last_name, first_name, hire_date 
from employees
where hire_date like '%%1986'
;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join department
on dept_manager.dept_no= department.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no DESC
;
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, department.dept_name, department.dept_no, dept_emp.emp_no
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join department
on department.dept_no = dept_emp.dept_no
;
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.last_name, employees.first_name
from employees
where first_name = 'Hercules' and last_name like 'B%'
order by employees.last_name
;
-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join department
on dept_emp.dept_no = department.dept_no
where dept_name = 'Sales'
;
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join department
on dept_emp.dept_no = department.dept_no
where department.dept_name = 'Sales' or department.dept_name = 'Development'
;
-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as frequencies 
from employees 
group by last_name
order by frequencies DESC
;