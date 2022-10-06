select  first_name||' '||last_name "이름",
        salary "월급",
        phone_number "전화번호",
        hire_date "입사일"
from employees
order by hire_date asc;

select  job_title,
        max_salary
from jobs
order by max_salary desc;

select  first_name||' '||last_name,
        manager_id,
        commission_pct,
        salary
from employees
where commission_pct is null
and manager_id is not null
and salary > 3000;

select  job_title,
        max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;

select  first_name,
        salary,
        nvl(commission_pct,0)
from employees
where salary >=10000
and salary < 14000
order by salary desc;

select  first_name,
        salary,
        to_char(hire_date,'YYYY-MM'),
        department_id
from employees
where department_id = 10
or department_id = 90
or department_id = 100;

select  first_name,
        salary
from employees
where first_name like 'S%'
or first_name like 's%';

select *
from departments
order by length(department_name) desc;