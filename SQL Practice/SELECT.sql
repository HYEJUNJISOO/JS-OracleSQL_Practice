--SELECT���� �⺻ ����
--SELECT �÷��� FROM ���̺�� WHERE �˻�����(= , IN, LIKE, Exist)
--ORDER BY �÷� ����(ASC,DESC)

--SELECT������ ������ ����Ǵ� ����
-- 3. SELECT �÷���
-- 1. FROM ���̺��
-- 2. WHERE �˻�����(=. IN,LIKE,Exist)
-- 4. ORDER BY �÷� ����(ASC,DESC)

-- IN �� WHERE ������ �������� ������ SELECT �ؼ� �ҷ��ö� ���
-- SELECT �ڿ� *�� ��� �÷��� ������ / * ���� �� �÷����� �Է½� �ش� �÷��鸸 ������
-- order by asc = �������� / order by desc = ��������
-- �÷���տ� as ���̸� �÷��� ��������


select*
from coffee_menu
--where kind='Ŀ��'
where  kind in ('Ŀ��','��Ŀ��')
;

select coffee,kind,price
from coffee_menu
where kind in('Ŀ��','���̵�')
;

select coffee,kind,price
from coffee_menu
where kind in('Ŀ��','���̵�')
order by price asc;

select coffee as coffeename,kind,price
from coffee_menu
where kind in('Ŀ��','���̵�')
order by coffeename desc;

select coffee as coffeename,kind,price -- �����߻��� -> ������ �о�ü��� ����
from coffee_menu
where coffeename='īǪġ��'
order by coffeename desc;

select coffee as coffee,kind,price
from coffee_menu
where coffee='īǪġ��'
order by coffee desc;

--to_char(reg_day,'yyyy.mm.dd hh24:mm:ss') -> reg_day �� �ش� ������������ ������
select no,cust_id,name,email,role,to_char (reg_day,'yyyy.mm.dd hh24:mm:ss')
from cust_info;