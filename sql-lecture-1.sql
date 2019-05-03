-- 왼쪽을 -로 채움
select lpad("123456", 10, "-");
-- 오른쪽을 -로 채움 
select rpad("123456", 10, "-");
-- 트림의 경우 입력하는 시점에 적어주는 것이 좋음(공백이 의도치 않게 포함되는 상황을 미연에 방지)
-- 왼쪽 공백 잘라내기
select ltrim(" 123456 ");
-- 오른쪽 공백 잘라내기
select rtrim(" 123456 ");
-- 양쪽 끝 공백 다 잘라내기
select trim(" 123456 ");
-- 절대값
select abs(1), abs(-1);
-- 입력된 수보다 작은 수중 가장 가까운 정수
select floor(1.2345), floor(-1.2345);
-- 입력된 수보다 큰 수중 가장 가까운 정수
select ceiling(1.2345), ceiling(-1.2345);
-- 반올림
select round(1.2345), round(-1.2345);
-- 양수 1, 음수 -1, 0은 0 출력
select sign(10), sign(-10), sign(0);
-- 가장 큰 값 리턴(아스키)
select greatest("a", "b", "c");
-- 가장 작은 값 리턴(아스키)
select least("a", "b", "c");
-- 날짜형 함수 + 금일
select curdate(), current_date();
-- 날짜형 함수 + 금일 + 시간
select now(),sysdate(),current_timestamp();
-- now()는 쿼리 실행 이전 미리 상수 형태로 값 계산(고정)
select now(),sleep(2),now();
-- sysdate는 쿼리 실행 도중 값 계산 반영(유동)
select sysdate(),sleep(2),sysdate();
-- W = 요일, M = 월, Y = 연도(소문자와 대문자 출력 결과 다름)
select date_format(curdate(),'%W %M %Y');
select date_format(now(),'%Y년 %M월 %W요일') "현재시간";
select date_format(now(),'%Y-%m-%d %h:%i:%s') "현재시간";
-- 두 시점 간의 차이 구하기
select period_diff(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(hire_date, '%Y%m')) FROM employees;
-- 입사 후 5개월이 지난 직원 출력
select first_name, hire_date, date_add(hire_date, interval 5 month) from employees;
select now(), cast(now() as date);
select cast(1-2 as unsigned);