--DELETE �⺻����
--DELETE ���̺��
--WHERE �˻�����(= , IN, LIKE , Exist)

--DELETE ���� Subquery ����ϱ� (������ ������**)
--DELETE ���̺��
--SET(�÷�,�÷�) = (select �÷��� from table �� where ���ǹ�)
--WHERE �˻����� (= , IN , LIKE , Exist )
--           �˻�����=(select �÷��� from table �� where ���ǹ�)

delete from order_list
where cust_id='ID5'
;

--order_list�� ���� �÷��� ����� �����Ҷ� subquery Ȱ��
delete from order_list
where 1=1
and cust_id=(select cust_id from cust_info where email='email4@hong.com')
;


select*
from order_list
where 1=1
and cust_id=(select cust_id from cust_info where email='email4@hong.com')
;