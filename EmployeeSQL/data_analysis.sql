-- List the employee number, first and last name, sex and salary

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e inner join salaries as s on e.emp_no = s.emp_no

-- List first and last name and hire date for employees hired in 1986

select first_name, last_name, hire_date from employees 
where hire_date >= '1/1/1986' and hire_date < '12/31/1986'

-- List manager dept number, dept name, employee number and first and last name

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager as dm 
inner join departments as d on dm.dept_no = d.dept_no
inner join employees as e on dm.emp_no = e.emp_no

-- List department of each employee with employee number, first and last name and dept name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join employees as e on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no

-- List first and last name and sex for employees named 'Hercules' with last names beginning with 'B'
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%'

-- List all employees in the sales dept including employee number, first and last name and dept name
select de.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp as de
inner join departments as d on d.dept_no = de.dept_no and dept_name = 'Sales'
inner join employees as e on de.emp_no = e.emp_no

-- List all employees from the sales and development depts including employee number, first and last name and dept name
select de.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp as de
inner join departments as d on d.dept_no = de.dept_no 
and dept_name = 'Sales' or dept_name = 'Development'
inner join employees as e on de.emp_no = e.emp_no

-- List how many employees share the same last name in descending order
select last_name, count(*) as same
from employees
group by last_name
order by same desc

-- Search employee id
select first_name, last_name, emp_no from employees
where emp_no = 499942