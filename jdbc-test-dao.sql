select emp_no, first_name, last_name, hire_date
from employees
where first_name like '%a%'
or last_name like '%a%';

use employees;
desc employees;

select first_name
from employees
where emp_no=10001;
