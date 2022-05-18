/*****************
* Join
*****************/

select  employee_id,
        first_name,
        salary,
        department_name,
        em.department_id "e_did",
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;
--모든 직원이름 , 부서이름 , 업무명을 출력하세요
select  em.first_name,
        de.department_name,
        j.job_title,
        em.department_id,
        de.department_id,
        em.job_id,
        j.job_id,
        em.salary
from employees em,departments de,jobs j
where em.department_id = de.department_id
and em.job_id = j.job_id
and em.salary >= 7000
;
