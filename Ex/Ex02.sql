/************************
*그룹합수
************************/

select  sum(salary)
from employees;

--그룹합수 - count()
select  count(*),
        count(commission_pct), --commission_pct  컬럼의 nill은 카운트에서 제외
        COUNT(manager_id)
from employees;

select count(*)
from employees
where salary > 16000;
--그룹합수 - sum()
select  sum(salary),
        COUNT(salary)
from employees;
--그룹합수 - avg()
select  avg(salary),        --급여가 null인 사람은 평균계산 제외
        avg (nvl(salary,0)),--null인 값은 0으로 변경후 평균계산
        round(avg(salary),0), -- 급여 평균 반올림
        count(*),
        sum(salary)
from employees;


--그룹함수 - max() / min()
select  max(salary),
        min(salary),
        count(*)
from employees;

--GROUP BY 절
--절 구성
select *
from employees
where salary > 16000
order by salary desc;

select  department_id,
        avg(salary)  --department_id(부서별 평규ㅜㄴ)
from employees
group by department_id  --
order by department_id asc; --정렬

select  department_id,
        job_id,
        avg(salary), --department_id(부서별 평균
        sum(salary), -- --department_id(부서별 합계
        count(salary) -- --department_id(부서별 카운트
from employees
group by department_id, job_id
order by department_id asc;
--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select  department_id,
        count(*),
        sum(salary)
from employees
where sum(salary) >= 20000 --where 절에는 그룹합수를 쓸수없다
group by department_id;
--having 절
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 -- 그룹합수에서 또 다른 where 이라고 생각하면댐
and sum(salary) <= 100000
and department_id = 90;
--and hire_date >= '04/01/01'; --having 절에는 그룹함수와 group by에
                                --참여한 컴럼만 사용할수있다.

--CASE ~ END 문
select  employee_id,
        first_name,
        job_id,
        salary,
        case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
             when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
        END realSalary
from employees;
--DECODE 문
select  employee_id,
        first_name,
        job_id,
        salary,
        decode(job_id,  'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP', salary+salary*0.2,
                        'ST_CLERK',salary+salary*0.3,
                salary ) Bonus
from employees;

--직원의 이름, 부서, 팀을 출력하세요 팀은 코드로 결정하며 부서코드가
--10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’  
--110~150이면 ‘C-TEAM’ 
--나머지는 ‘팀없음’ 으로 출력하세요.

select  first_name,
        department_id,
        case when department_id>=10 and department_id<=50 then 'A팀'
             when department_id>=60 and department_id<=100 then 'B팀'
             when department_id>=110 and department_id<=150 then 'C팀'
             else '팀없음'
        end team
from employees;
