--UPDATE �⺻����
--UPDATE ���̺��
--SET �÷�=��, �÷�=��
--WHERE �˻����� (= , IN, LIKE , Exist )

--UPDATE ���� Subquery ����ϱ� (������ ������**)
--UPDATE ���̺��
--SET(�÷�,�÷�) = (select �÷��� from table �� where ���ǹ�)
--WHERE �˻����� (= , IN , LIKE , Exist )
--           �˻�����=(select �÷��� from table �� where ���ǹ�)

update order_list
set name='ȫ�漺��2', price=3300
where cust_id='ID2'
;

select*
from order_list
where cust_id='ID2'
;

--Subquery UPDATE��
update order_list ol
set name=(select x.name from cust_info x where x.cust_id=ol.cust_id)
where reg_day > sysdate-100
;

select*
from order_list
where reg_day > sysdate-100
;

--��ü�ǽ�
update order_list ol
set (coffee,price) = (select x.coffee, x.price from coffee_menu x where x.no=ol.coffee_no)
where reg_day > sysdate-100
;

select*
from order_list
where cust_id='ID2'
;
