--문제1.
--매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요

select count(manager_id) "haveMngCnt"
from employees;
/*
문제2.
직원중에 최고임금(salary)과 최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력
해 보세요. 두 임금의 차이는 얼마인가요? “최고임금 – 최저임금”이란 타이틀로 함께 출력
해 보세요
*/

select  max(salary) "최고임금",
        min(salary) "최저임금", 
        max(salary)-min(salary) "최고임금-최저임금"
from employees;
/*
문제3.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
select to_char(max(hire_date),'yyyy"년"mm"월"dd"일"' ) 
from employees;

/*
문제4.
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다
*/
select  department_id,
        avg(salary),
        MAX(salary),
        MIN(salary)        
from employees
group by department_id
order by department_id desc;

/*
문제5.
업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 정렬
순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것
*/
select  job_id,
        round(avg(salary),0),
        max(salary),
        min(salary)
from employees
group by job_id
order by min(salary) desc, avg(salary) asc;
/*
문제6.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2001-01-13 토요일
*/
select to_char(min(hire_date),'yyyy-mm-dd day')
from employees;
/*
문제7.
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 그리
고 (평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
select  department_id, 
        avg(salary), 
        min(salary),
        avg(salary) - min(salary)
from employees
group by department_id
having avg(salary) - min(salary) < 2000
order by avg(salary) - min(salary) desc;