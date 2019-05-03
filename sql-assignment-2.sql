-- [과제 2]

desc employees;

select birth_date from employees where emp_no=10001;
select now();

select max(salary) "최고임금", min(salary) "최저임금", max(salary)-min(salary) "최고임금-최저임금" from salaries;
select date_format(max(hire_date), "%Y년 %m월 %d일") "최근 신입사원 입사일" from employees;
select date_format(hire_date,"%Y년 %m월 %d일") "입사일", max(period_diff(date_format(now(),"%Y%m"), date_format(hire_date,"%Y%m"))) "최장 근속일수" from employees;
select avg(salary) "현재 평균 연봉" from salaries where to_date > now();
select min(salary) "현재 최저 연봉", max(salary) "현재 최고 연봉" from salaries where to_date > now();
select min(floor((cast(replace(curdate(),'-','') as signed)-cast(replace(birth_date,'-','') as signed))/10000)) "최연소자", max(floor((cast(replace(curdate(),'-','') as signed)-cast(replace(birth_date,'-','') as signed))/10000)) "최연장자" from employees;

-- 현재시간의 대시 기호를 공백으로 변경
-- as type (지정된 type으로 자료형 변경) e.g) signed의 경우 연산결과에 맞는 지정된 수 / unsigned의 경우 미지정된 수
select cast(replace(curdate(),'-','') as unsigned);
select max(cast(replace(birth_date,'-','') as unsigned)) from employees;