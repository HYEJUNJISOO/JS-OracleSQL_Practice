--order_list ���� �̸��� �÷��̾��� -> cust_info �� �̸��� �÷��������Ƿ�
-- cust_info ���̺��� �����Ͽ� �����͸� �����ü�����
-- ���̺� �̸��� �ʹ���� �������̶�������, ����̾�� �ָ�� -> �̶� ������ ������ ���̺��
-- �� �ݵ�� �����������
-- �� ���̺��� join�� �������� ���� Ű���� �Ѱ��� �����ϸ��(������ �ӵ��� �߿��ϱ⶧��)

select ol.*, ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ol.coffee='īǪġ��'
and ol.price <=3000
;

select ol.*, ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ci.role='MEMBER'
;

select ol.*, ci.email, ci.reg_day --custinfo ���̺��� ����ϳ�¥
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ci.role='MEMBER'
order by ol.reg_day -- reg_day �� ��� ���̺������ �νĸ��ϱ⿡ �տ� �� ����̾ �Է�
;

--3�� ���̺� JOIN
select ol.*, ci.email, ci.reg_day, cm.kind --custinfo ���̺��� ����ϳ�¥
from order_list ol, cust_info ci, coffee_menu cm
where ol.cust_id=ci.cust_id
and ol.coffee_no=cm.no
and cm.kind='���̵�'
;

select * 
from coffee_menu
where coffee='������'
;

select ol.*
from order_list ol
where ol.coffee='īǪġ��'
and ol.price <= 3000
;