--Below are the eight queries requested, from the data of the employees found.  

--List the employee number, last name, first name, sex, and 
--salary of each employee
SELECT emp.emp_no as "Employee No.", emp.first_name as "First Name", 
	emp.last_name as "Last Name", emp.sex as "Gender", s.salary as "Salary"
FROM public.employees emp
JOIN public.salaries s
ON (emp.emp_no = s.emp_no);


--List the first name, last name, 
--and hire date for the employees who were hired in 1986
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM public.employees
WHERE hire_date >= '01/01/1986' AND hire_date <= '12/31/86';

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
SELECT dm.emp_no as "Employee No.", emp.first_name as "First Name", 
	emp.last_name as "Last Name", dpt.dept_name as "Dept. Name", dm.dept_no as "Dept. Number"
FROM public.deptmanager dm
JOIN public.employees emp
ON (dm.emp_no = emp.emp_no) 
JOIN public.departments dpt
ON(dm.dept_no = dpt.dept_no);

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
SELECT emp.emp_no as "Employee Number", emp.first_name as "First Name", 
	emp.last_name as "Last Name", de.dept_no as "Dept. Number", dpt.dept_name as "Dept. Name"
FROM public.employees emp
JOIN public.deptemployees de
ON (emp.emp_no = de.emp_no) 
JOIN public.departments dpt
ON(de.dept_no = dpt.dept_no);

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B
SELECT emp.first_name as "First Name", 
	emp.last_name as "Last Name", emp.sex as "Gender"
FROM public.employees emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, 
--last name, and first name
SELECT emp.emp_no as "Employee Number", emp.first_name as "First Name", 
	emp.last_name as "Last Name"
FROM public.employees emp
JOIN public.deptemployees de
ON (emp.emp_no = de.emp_no) 
JOIN public.departments dpt
ON(de.dept_no = dpt.dept_no)
WHERE dpt.dept_name='Sales';

--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name
SELECT emp.emp_no as "Employee No.", emp.first_name as "First Name", 
	emp.last_name as "Last Name", dpt.dept_name as "Department Name"
FROM public.employees emp
JOIN public.deptemployees de
ON (emp.emp_no = de.emp_no) 
JOIN public.departments dpt
ON(de.dept_no = dpt.dept_no)
WHERE dpt.dept_name='Sales' OR dpt.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) 
SELECT emp.last_name as "Last Name", COUNT(emp.last_name) as "Last Name Count"
FROM public.employees emp
GROUP BY emp.last_name
ORDER BY "Last Name Count" DESC;


