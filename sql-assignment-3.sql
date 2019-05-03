-- [과제 3]

use employees;
desc dept_emp;
desc employees;
desc departments;
desc titles;
desc salaries;

select e.emp_no "사번" , concat(e.first_name," ",e.last_name) "이름", s.salary "연봉"
from employees e join salaries s
on (e.emp_no=s.emp_no)
where s.to_date > now()
order by s.salary desc;

select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", t.title "현재 직책"
from employees e join titles t
on (e.emp_no=t.emp_no)
where t.to_date > now()
order by e.last_name;

select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", d.dept_no "현재 부서"
from employees e join dept_emp d
on (e.emp_no=d.emp_no)
where d.to_date > now()
order by e.last_name;

select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", s.salary "연봉", t.title "직책", d.dept_no "현재 부서"
from employees e, dept_emp d, salaries s, titles t
where e.emp_no=d.emp_no and e.emp_no=s.emp_no and e.emp_no=t.emp_no and d.to_date > now() and s.to_date > now() and t.to_date > now();

select distinct e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름"
from employees e join titles t
on e.emp_no=t.emp_no
where t.to_date!="9999-01-01" and t.title="Technique Leader";