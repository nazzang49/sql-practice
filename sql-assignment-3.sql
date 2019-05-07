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

select concat(e.first_name," ",e.last_name) "이름", d.dept_name "부서명", t.title "직책"
from employees e, departments d, titles t, dept_emp de
where e.emp_no=t.emp_no
and e.emp_no=de.emp_no
and de.dept_no=d.dept_no
and e.last_name like "S%";

select concat(e.first_name," ",e.last_name) "이름", s.salary "평균 연봉"
from employees e, salaries s, titles t
where e.emp_no=s.emp_no
and s.emp_no=t.emp_no
and s.salary > 40000
and s.to_date > now()
order by s.salary desc;

select t.title "직책", avg(s.salary) "직책별 평균 연봉"
from salaries s, titles t
where s.emp_no=t.emp_no
and t.to_date > now()
and s.to_date > now()
group by t.title
having avg(s.salary) > 50000
order by avg(s.salary) desc;

select d.dept_no "부서번호", de.dept_name "부서명", avg(s.salary) "부서별 평균 연봉"
from dept_emp d, departments de, salaries s
where d.emp_no=s.emp_no
and d.dept_no=de.dept_no
and d.to_date > now()
and s.to_date > now()
group by d.dept_no, de.dept_name
order by avg(s.salary) desc;

select t.title "직책", avg(s.salary) "직책별 평균 연봉"
from salaries s, titles t
where s.emp_no=t.emp_no
and t.to_date > now()
and s.to_date > now()
group by t.title
order by avg(s.salary) desc;