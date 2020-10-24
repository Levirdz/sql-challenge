/* 1. List the following details of each employee: 
	- employee number 
	- last name 
	- first name 
	- sex 
	- salary*/
	
select	T1.emp_no,
		T1.last_name,
		T1.first_name, 
		T1.sex, 
		T2.salary
from employees as T1 
inner join salaries as T2 
on T1.emp_no = T2.emp_no;

/* 2. List first name, last name, and hire date for
	  employees who were hired in 1986.*/
	  
select 	T1.first_name,
		T1.last_name, 
		T1.hire_date
from employees as T1 
where date_part ('year', hire_date) = '1986';

/* 3. List the manager of each department with the 
	  following information: 
	  - department number
	  - department name
	  - manager's employee number
	  - last name
	  - first name*/
	  
select	T1.dept_no, 
		T1.dept_name,
		T2.emp_no,
		T3.last_name,
		T3.first_name 
from departments as T1 
inner join dept_manager as T2
on T1.dept_no = T2.dept_no
inner join employees as T3
on T2.emp_no = T3.emp_no;

/* 4. List the department of each employee with the 
	  following information: 
	  - employee number 
	  - last name 
	  - first name 
	  - department name*/

select	T1.emp_no, 
		T1.last_name, 
		T1.first_name,
		T3.dept_name
from employees as T1 
inner join dept_emp as T2 
ON T1.emp_no = T2.emp_no
inner join departments as T3
ON T2.dept_no = T3.dept_no;

/* 5. List first name, last name, and sex for employees 
	  whose first name is "Hercules" and last names begin 
	  with "B".*/

select 	first_name, 
		last_name, 
		sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

/* 6. List all employees in the Sales department, 
	  including: 
	  - employee number
	  - last name
	  - first name 
	  - department name*/
	  
select	T1.emp_no, 
		T1.last_name, 
		T1.first_name,
		T3.dept_name
from employees as T1 
inner join dept_emp as T2 
ON T1.emp_no = T2.emp_no
inner join departments as T3
ON T2.dept_no = T3.dept_no
where T3.dept_name = 'Sales';

/* 7. List all employees in the Sales and Development 
	  departments, including:  
	  - employee number 
	  - last name 
	  - first name
	  - department name*/
	  
select	T1.emp_no, 
		T1.last_name, 
		T1.first_name,
		T3.dept_name
from employees as T1 
inner join dept_emp as T2 
ON T1.emp_no = T2.emp_no
inner join departments as T3
ON T2.dept_no = T3.dept_no
where T3.dept_name = 'Sales'
or T3.dept_name = 'Development';

/* 8. In descending order, list the frequency count of
	  employee last names, i.e., how many employees 
	  share each last name.*/
	  
select last_name,
count(last_name) as "Frequency"
from employees
group by last_name
order by "Frequency" desc;