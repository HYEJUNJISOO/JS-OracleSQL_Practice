--select 

select * from employees;

select * from departments;



select e.name employee,
           d.name department,
           e.job,
           d.location
from departments d, employees e
--where d.deptno = e.deptno(+)
where d.name=e.name(+) --(+)�� ���̸� ����� �÷������̾�� department�� ������� ������
order by e.name;

--��Į�� ��������(�������鿡�� ��Į�� ���������� ����ϴ°� ����)
select e.name employee,
          (select name from departments d 
           where d.deptno = e.deptno) department,
           e.job
from employees e
order by e.name;
