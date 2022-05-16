/************
select문
    select 절
    from 절
************/

--모든 컬럼 조회화기
select *
from employees;

select *
from departments;

--원하는 컬럼만 조회하기
select employee_id, first_name, last_name
from employees;

--예제)
--사원의 이름 (first_name)과 전화번호 입사일 연봉을 출력하세요

select first_name, phone_number, hire_date, salary
from employees;
--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select  first_name, 
        last_name, 
        salary,
        phone_number, 
        email, 
        hire_date
from employees;

--출력할때 컬럼명 별명 사용허기
--사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요
select  first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select  first_name as 이름,
        last_name 성,
        salary as "Salary",
        phone_number "hp",
        email "이 메 일",
        hire_date 입사일
from employees;

--연결연산자(컬럼을 붙이기)

select  first_name,
        last_name
from employees;

select  first_name || ' ' || last_name
from employees;

select first_name || 'hire date is' || hire_date 입사일
from employees;

--산술연산자
select  first_name,
        salary,
        salary*12,
        (salary+300)*12
from employees;

select job_id
from employees;

select  first_name || '-' ||last_name 성명,
        salary 급여,
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from employees;

/*where절*/

select first_name
from employees
where department_id = 10;

select  first_name
        salary
from employees
where salary >= 15000;

select  first_name,
        hire_date
from employees
where hire_date >'07/01/01';

select salary
from employees
where first_name = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
--연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하시오
select  first_name,
        salary
from employees
where salary >= 14000
and salary <=17000;

select  first_name,
        salary
from employees
where salary <= 14000
or salary >=17000;

select  first_name,
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--BETWEEN 연산자로 특정구간 값 출력하기
select  first_name,
        salary
from employees
where salary BETWEEN 14000 AND 17000;

--in  연산자로 여러 조건을 검사하기

select  first_name,
        last_name,
        salary
from employees
where first_name in ('Neena','Lex','John');

--연봉이 2100, 3100,4100, 5100인 사원의 이름과 연봉을 구하시오

select  first_name,
        salary
from employees
where salary in (2100, 3100 ,4100 ,5100);

select  first_name,
        salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

--Like 연산자로 비슷한것들 모두 찾기
select  first_name,
        last_name,
        salary
from employees
where first_name like 'L%';

select  first_name,
        last_name,
        salary
from employees
where first_name like 'L___';

--이름에 am을 포함한 사원의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select  first_name,
        salary
from employees
where first_name like '_a%';
--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name,
        salary
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name,
        salary
from employees
where first_name like '__a_';
--null
select first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary BETWEEN 13000 AND 15000;
--is null , is nou null
select first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where commission_pct is not null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name,
        salary ,
        commission_pct    
from employees
where commission_pct is not null;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요

select  first_name,
        salary,
        commission_pct
from employees
where manager_id is null
and commission_pct is null;

select  first_name,
        salary
from employees
where salary >= 10000;

--order by 절을 사용해 보기 좋게 정렬하기
select  first_name,
        salary
from employees
where salary >=9000
order by salary asc; --desc

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select  department_id,
        salary,
        first_name
from employees
order by department_id asc;
--급여가 10000이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name,
        salary
from employees
where salary >=10000
order by salary desc;
--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 
--부서번호 급여 이름을 출력하세요  
select  department_id,
        salary,
        first_name
from employees
order by department_id asc, salary desc, first_name desc;
/*
단일행 함수
*/
--문자함수 - INITCAP(컬럼명)
--부서번호 100인 직원의 이메일 주소와 부서번호를 출력하세요
select  email,
        INITCAP(email) "email2",
        department_id
from employees
where department_id = 100;
--문자함수 – LOWER(컬럼명) / UPPER(컬럼명)
select  first_name,
        upper(first_name),
        lower(first_name)
from employees
where department_id = 100;
--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name,
        substr(first_name,1,4),
        substr(first_name,-3,2)
from employees
where department_id = 100;
--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees
where department_id = 100;
--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name,'a' , '*'),
        replace(first_name,substr(first_name,2,3),'***')
from employees
where department_id = 100;

select replace('abcdefg','bc','******')
from dual;

select SUBSTR('981020-1234234',8,1)
from dual;
--숫자함수 – ROUND(숫자, 출력을 원하는 자리수) 반올림
select  ROUND(123.346,2) r2,
        ROUND(123.456,0) r0,
        ROUND(123.456,-1) "r-1"
from dual;
--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수) 버림
select  trunc(123.346, 2) r2,
        trunc(123.456, 0) r0,
        trunc(123.456, -1) "r-1"
from dual;
--날짜함수 – SYSDATE()
select sysdate
from dual;
--단일함수>날짜함수 – MONTH_BETWEEN(d1, d2) 
select MONTHS_BETWEEN(SYSDATE,hire_date)
from employees
where department_id = 110;
--TO_CHAR(숫자, ‘출력모양’)  숫자형문자형으로 변환하기
select  first_name,
        to_char(salary*12, '099999')
from employees
where department_id = 110;

select  to_char(9876, '99999'),
        to_char(9876, '099999'),
        to_char(9876, '$99999'),
        to_char(9876, '9999.99'),
        to_char(987654321, '999,999,999'),
        to_char(987654321, '999,999,999,999.999')
from dual;
--변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜문자형으로 변환하기

select  sysdate,
        to_char(sysdate, 'YYYY-MM-DD'),
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),
        to_char(sysdate, 'YYYY"년"MM"월"DD"일" HH24:MI:SS'),
        to_char(sysdate, 'YYYY'),
        to_char(sysdate, 'YY'),
        to_char(sysdate, 'MM'),
        to_char(sysdate, 'MONTH'),
        to_char(sysdate, 'DD'),
        to_char(sysdate, 'DAY'),
        to_char(sysdate, 'HH24'),
        to_char(sysdate, 'MI'),
        to_char(sysdate, 'SS')
from dual;
