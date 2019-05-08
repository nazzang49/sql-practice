use employees;

desc employees;
desc salaries;
desc dept_emp;

-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력
select e.emp_no "사번", concat(e.first_name," ", e.last_name) name
from employees e, dept_emp d, departments de
where e.emp_no=d.emp_no
and d.dept_no=de.dept_no
and d.to_date > now()
and d.dept_no=(select c.dept_no from employees a, dept_emp c where a.emp_no=c.emp_no and c.to_date='9999-01-01' and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
               
-- 서브쿼리 문제의 경우 서브쿼리 안에 들어갈 내용을 먼저 작성 후 테스트 해본다
-- 단일행 실습문제
-- 1) order by, limit 활용
select round(avg(s.salary)) avg_sal, t.title
from salaries s, titles t
where s.emp_no=t.emp_no
and s.to_date>now()
and t.to_date>now()
group by t.title
order by avg_sal asc
limit 0,1;

-- 2) 서브쿼리 활용


-- 다중행 실습문제

-- 연봉이 50000이하인 현재 사원 모두 출력
-- 1) 서브쿼리 활용
select *
from employees
where emp_no
in (select emp_no from salaries where salary<50000 and to_date>now());

-- 2) 조인 활용
select e.first_name, s.salary
from employees e, salaries s
where e.emp_no=s.emp_no
and s.to_date > now()
and s.salary > 50000;


select d.dept_no, max(s.salary) max_sal
from employees e, salaries s, dept_emp d
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and s.to_date > now()
and d.to_date > now()
group by c.dept_no;

-- 각 부서별 최고 연봉 직원 이름, 연봉 출력
-- 1) where절 서브쿼리 활용(권고)
select d.dept_no, s.salary, e.first_name
from employees e, salaries s, dept_emp d
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and s.to_date > now()
and d.to_date > now()
-- 두 개의 한 쌍으로서 데이터 비교
and (d.dept_no, s.salary) in (select d.dept_no, max(s.salary) max_sal
from employees e, salaries s, dept_emp d
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and s.to_date > now()
and d.to_date > now()
group by d.dept_no);

-- 2) from절 서브쿼리 활용(차선)
-- from절에 서브쿼리 활용 시 전체 where절에 조건 추가
select d.dept_no, s.salary, e.first_name
from employees e, salaries s, dept_emp d, (select d.dept_no, max(s.salary) max_sal
from employees e, salaries s, dept_emp d
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and s.to_date > now()
and d.to_date > now()
group by d.dept_no) a
where e.emp_no=s.emp_no
and s.emp_no=d.emp_no
and d.dept_no=a.dept_no
and s.to_date > now()
and d.to_date > now()
and s.salary=a.max_sal;

-- DDL 데이터베이스 정의
-- 생성
create table member(
	no int primary key auto_increment,
    email varchar(50) default "default",
    passwd varchar(64) not null,
    name varchar(20),
    dept_name varchar(20)
);
drop table member;
desc member;
-- 삽입
-- 정보 입력 시 비밀번호는 암호화 실시
insert into member(passwd, name, dept_name) values(password("1234"),"jyp","연구개발팀");
select * from user;
-- 추가(필요 시 타입+제약조건)
alter table member add juminbunho varchar(13) not null;
desc member;
alter table member drop juminbunho;
alter table member add join_date datetime not null;
-- 변경(필요 시 타입+제약조건)
alter table member change no no int auto_increment;
alter table member change dept_name department_name varchar(20);
alter table member change name name varchar(25);
alter table member rename user;
desc user;

-- 갱신
update user set join_date = now() where no=1;
insert into user(passwd, name, department_name, join_date) values(password("3456"),"진영","연구개발팀",now());
update user set join_date = now(), name="진구" where no=2;

-- 삭제
delete member where no=3;