use employees;

desc employees;
desc dept_emp;
desc departments;

-- 각 사원별 평균 연봉 
select emp_no "사번", avg(salary) "평균연봉"
from salaries
group by emp_no
order by avg(salary) desc;

-- 매니저 직책의 평균 연봉
select distinct t.title, avg(s.salary) avg_sal
from titles t join salaries s
on t.emp_no = s.emp_no
where title="Manager";

-- 각 사원별 평균 연봉 50000 이상 추출
select emp_no "사번", avg(salary) "평균연봉 > 50000"
from salaries
group by emp_no
having avg(salary) > 50000
order by avg(salary) desc;

-- 엔지니어 직책의 평균 연봉 20000 이상 추출(암시적 조인)
select s.emp_no "사번", avg(s.salary) "평균연봉", t.title "직책"
from salaries s, titles t
where t.title="Engineer" and s.emp_no = t.emp_no
group by s.emp_no, t.title
having avg(s.salary) > 20000
order by avg(s.salary) desc;

select concat(e.first_name," ",e.last_name) "이름", t.title "직책"
from employees e, titles t
where e.gender="F"
and e.emp_no = t.emp_no;

select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", d.dept_no "부서", de.dept_name "부서명"
from employees e, dept_emp d, departments de
where e.emp_no = d.emp_no
and d.dept_no = de.dept_no
and d.to_date > now();

-- left outer join 예시
select a.first_name, b.dept_no
from employees a left outer join dept_emp b on a.emp_no=b.emp_no
join departments c on b.dept_no=c.dept_no
where b.to_date > now()
and b.dept_no is null;

