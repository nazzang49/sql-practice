-- [과제 4_서브쿼리]

use employees;


-- 문제1.
-- 현재, 평균 연봉보다 많은 월급을 받는 직원 수
select count(*) "현재 연봉 > 평균 연봉 직원 수"
from employees e, salaries s
where e.emp_no=s.emp_no
and s.to_date > now()
and s.salary > (select avg(salary) from salaries);

desc employees;
desc dept_emp;

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서, 연봉을 조회 (연봉 내림차순)
select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", d.dept_no "부서", s.salary "현재 연봉"
from employees e, dept_emp d, salaries s
where e.emp_no=d.emp_no
and d.emp_no=s.emp_no
and d.to_date > now()
and s.to_date > now()
and (s.salary,d.dept_no) in (select max(s.salary), d.dept_no
							 from salaries s, dept_emp d
							 where d.emp_no=s.emp_no
							 and d.to_date > now()
							 and s.to_date > now()
							 group by d.dept_no)
order by s.salary desc;

desc dept_manager;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번, 이름과 연봉 조회
select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", s.salary "현재 연봉"
from employees e, salaries s, dept_emp d
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and s.to_date > now()
and s.salary > (select round(avg(s.salary))
				from salaries s, dept_emp de
				where s.emp_no=de.emp_no
				and d.dept_no=de.dept_no
                and s.to_date > now()
				and de.to_date > now());

-- 부서번호, 부서 이름
desc departments;
-- 부서번호, 부서별 매니저의 사원번호
desc dept_manager;
desc employees;
desc dept_emp;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력
select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", concat(m.first_name," ",m.last_name) "매니저 이름", d.dept_name "부서 이름"
from employees e, employees m, dept_emp de, departments d, dept_manager dm
where e.emp_no=de.emp_no
and de.dept_no=d.dept_no
and d.dept_no=dm.dept_no
and dm.emp_no=m.emp_no
and de.to_date > now()
and dm.to_date > now();


-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회 및 연봉 순 출력
select e.emp_no "사번", concat(e.first_name," ",e.last_name) "이름", t.title "직책", s.salary "현재 연봉"
from employees e, salaries s, titles t, dept_emp d
where d.dept_no=(select d.dept_no
				 from salaries s, dept_emp d
				 where s.emp_no=d.emp_no
				 and s.to_date > now()
				 and d.to_date > now()
				 group by d.dept_no
				 order by avg(s.salary) desc
				 limit 0,1)
and e.emp_no=s.emp_no
and s.emp_no=t.emp_no
and e.emp_no=d.emp_no
and s.to_date > now()
and t.to_date > now()
order by s.salary desc;

-- 문제6.
-- 역대 평균 연봉이 가장 높은 부서
select d.dept_no "부서번호", round(avg(s.salary)) "평균 연봉"
from salaries s, dept_emp d
where s.emp_no=d.emp_no
group by d.dept_no
order by avg(s.salary) desc
limit 0,1;

-- 문제7.
-- 역대 평균 연봉이 가장 높은 직책
select t.title "직책", round(avg(s.salary)) "평균 연봉"
from salaries s, titles t
where s.emp_no=t.emp_no
group by t.title
order by avg(s.salary) desc
limit 0,1;


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원의 부서 이름, 사원 이름, 연봉, 매니저 이름, 매니저 연봉 순 출력
select f.dept_name "부서이름", a.first_name "사원이름", d.salary "연봉", g.first_name "매니저 이름", e.salary "매니저 연봉"
from employees a, dept_emp b, dept_manager c, salaries d, salaries e, departments f, employees g
where a.emp_no = b.emp_no
and c.dept_no = b.dept_no
and a.emp_no = d.emp_no
and c.emp_no = e.emp_no
and c.dept_no = f.dept_no
and c.emp_no = g.emp_no
and b.to_date > now()
and c.to_date > now()
and d.to_date > now()
and e.to_date > now()
and d.salary > e.salary;


-- 매니저 이름 추출
select e.first_name, e.last_name, m.first_name, m.last_name
from employees e, employees m, dept_emp de, dept_manager dm
where e.emp_no=de.emp_no
and de.dept_no=dm.dept_no
and m.emp_no=dm.emp_no;


-- 부서번호, 부서 이름
desc departments;
-- 부서번호, 부서별 매니저의 사원번호
desc dept_manager;
desc employees;
desc dept_emp;