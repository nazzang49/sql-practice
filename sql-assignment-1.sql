-- [과제 1]
use employees;
desc employees;
desc salaries;
desc departments;
desc dept_manager;
desc titles;

select count(*) from titles;

-- 주석은 ctrl+numlock 옆에 있는 /키

select concat(first_name," ",last_name) as "full_name" from employees where emp_no=10944;
select last_name "이름", gender "성별", hire_date "입사일" from employees order by hire_date asc;
select count(*) from employees where gender="M";
select count(*) from employees where gender="F";
select count(*) from salaries where emp_no is not null;
select count(distinct dept_no) from dept_manager;
select dept_name from departments order by length(dept_name) desc;
select count(*) from salaries where salary > 120000;
select distinct title from titles order by length(title) desc;
select count(*) from titles where title="Engineer";
select * from titles where emp_no=13250 order by from_date;