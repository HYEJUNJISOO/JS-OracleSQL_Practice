--select 

select * from employees;

select * from departments;



select e.name employee,
           d.name department,
           e.job,
           d.location
from departments d, employees e
--where d.deptno = e.deptno(+)
where d.name=e.name(+) --(+)를 붙이면 공통된 컬럼내용이없어도 department의 내용들을 가져옴
order by e.name;

--스칼라 서브쿼리(가독성면에서 스칼라 서브쿼리를 사용하는게 좋음)
select e.name employee,
          (select name from departments d 
           where d.deptno = e.deptno) department,
           e.job
from employees e
order by e.name;
