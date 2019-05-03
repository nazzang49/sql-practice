-- 집계함수

-- 10060번 직원의 그간 연봉 평균 및 합계
select avg(salary) "연봉 평균", sum(salary) "연봉 합계" from salaries where emp_no = 10060;
-- 각 직원별 연봉 평균 및 합계(emp_no을 기준으로 하나의 각 그룹 형성)
select avg(salary) "연봉 평균", sum(salary) "연봉 합계" from salaries group by emp_no;
-- 1985년에 입사한 사람들의 연봉 평균 및 합계(where 선, group by 후)
select avg(salary) "연봉 평균", sum(salary) "연봉 합계", from_date from salaries where from_date like "1985%" group by emp_no;
-- 1985년에 입사한 사람들의 연봉 평균 및 합계 중 평균이 1000 넘는 직원 추출(having에 있는 avg는 컬럼명으로 이해)
select avg(salary) "연봉 평균", sum(salary) "연봉 합계", from_date from salaries where from_date like "1985%"
group by emp_no having avg(salary) > 1000;
