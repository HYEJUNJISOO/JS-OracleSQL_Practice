--Oracle ������ ���� ����
--���̺� ��Ÿ �����ʹ� Oracle ������ �������� �׼����� �� �ִ�
--���� ������ ������ ���� ���̺��� �����ϴ� ����� ������

select table_name, tablespace_name, status
from user_tables
where table_Name = 'EMPLOYEES';

select column_id, column_name , data_type
from user_tab_columns
where table_Name = 'EMPLOYEES'
order by column_id;