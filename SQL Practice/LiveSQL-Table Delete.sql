--Table Delete
--cascade constraints = ���̺� ���ǵ� ��� ���� ���ǵ� �����Ѵ�

drop table departments cascade constraints;

drop table employees cascade constraints;


--���̺� ���� ���
--RECYCLEBIN �ʱ�ȭ �Ű������� ON(10g�� �⺻��)���� ������ ��� �� ���̺��� �����ϸ� �����뿡 ��ġ�˴ϴ�. 
--���̺� ������ ����� �� �ִ��� Ȯ���Ϸ��� ���� ������ ���� ������ �����մϴ�.

select object_name, 
       original_name, 
       type, 
       can_undrop, 
       can_purge
from recyclebin; -- recyclebin=������

--���̺� ������ ����Ϸ��� flashback ����� ����մϴ�. ���� ��� ������ �����ϴ�.

flashback table DEPARTMENTS to before drop;
flashback table EMPLOYEES to before drop;
select count(*) departments 
from departments;
select count(*) employees
from employees;

select*from DEPARTMENTS;

select*from EMPLOYEES;