--alter table : ������ ����Ͽ� ���̺��� ������ �� �߰� ���� �߰��� �� �ִ�
--���̺��� ������µ�, �־���� �÷��̾����� �߰�����
--�߰��� �÷��� ���ﶩ add -> drop 

alter table EMPLOYEES 
add country_code varchar2(2);

select*from EMPLOYEES;