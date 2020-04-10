-- 1. List the following details of each employee: 
----employee number, last name, first name, gender, and salary.
select 
	"employees".emp_no,
	"employees".last_name,
	"employees".first_name,
	"employees".gender,
	"salaries".salary
from "employees"
inner join "salaries" on "employees".emp_no = "salaries".emp_no;

--2. List employees who were hired in 1986.
select *
from "employees"
where hire_date between '1986-01-01'
and '1986-12-31' ;
---or

select first_name,last_name,hire_date
from "employees"
where hire_date between '1986-01-01'
and '1986-12-31' ;

-- 3.List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name, 
---and start and end employment dates.

select "departments".dept_no,"departments".dept_name,"dept_manager".emp_no,"employees".last_name,
"employees".first_name,"employees".hire_date as "Start of Employment","dept_manager".to_date as "End of Employment"
from "dept_manager"
left join "departments"
on "departments".dept_no="dept_manager".dept_no
left join "employees"
on "dept_manager".emp_no="employees".emp_no;


--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select "employees".emp_no,"employees".last_name,"employees".first_name,"departments".dept_name
from "employees"
left join "dept_emp"
on "dept_emp".emp_no = "employees".emp_no
left join"departments"
on "dept_emp".dept_no="departments".dept_no
--5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM "employees"
WHERE
	first_name = 'Hercules'
	AND last_name like 'B%'
--  Or

SELECT first_name,last_name
FROM "employees"
WHERE
	first_name = 'Hercules'
	AND last_name like 'B%'
	
---6.List all employees in the Sales department, 
---including their employee number, last name, first name, and department name.
	
select "dept_emp".emp_no,last_name,first_name,"departments".dept_name
from "employees"
inner join "dept_emp" on "dept_emp".emp_no = "employees".emp_no
inner join "departments" on "departments".dept_no = "dept_emp".dept_no
where dept_name = 'Sales';

--7.List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

select "dept_emp".emp_no,last_name,first_name,"departments".dept_name
from "employees"
inner join "dept_emp" on "dept_emp".emp_no = "employees".emp_no
inner join "departments" on "departments".dept_no = "dept_emp".dept_no
where dept_name in ('Sales','Development');

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last_Name_Count"
FROM "employees"
GROUP BY last_name
ORDER BY "Last_Name_Count" DESC;




