-- =, <>
-- = �ش� ���뿡 �ش�Ǵ� �����͵��� ������
-- <> : �ش� ������ ������ �����͵��� ������ ( != �� ��밡��)

select *
from order_list
where coffee='īǪġ��'
;

select *
from order_list
--where coffee <>'īǪġ��'
where coffee !='īǪġ��'
;

--in , not in
--in : ���̺����� �������� �����͸� �����ö� ���
--not in : ���̺����� �ش系���� ������ �����͸� �����ö� ���

select *
from order_list
where coffee in ('īǪġ��' , '�׸�Ƽ')
;

select *
from order_list
where coffee not in ('īǪġ��', '�׸�Ƽ')
;

--like , not like
--�տ� ���ڸ� �ɾ���� ���α׷� �ӵ��� ����(�ε����� ���ڸ� �޾Ƽ�..?)
select*
from order_list
where coffee like 'īǪ%'
;

select*
from order_list
where coffee not like '%ġ��'
;

--����
select*
from order_list
--where price=4000
--where price<4000
--where price < '4000' --�ڵ����� ���ڷ� ����ȯ��
where price < to_number('4000')--������ �������� ���� �̷��� ����ȯ���ִ°� ����
;

--��¥
select*
from order_list
;

--�Ⱓ�˻�
select coffee_no,coffee,price,to_char(reg_day,'yyyy.mm.dd hh24:mi:ss')
from order_list
--where reg_day <= to_date('20230731' , 'yyyymmdd') --yyyymmdd �ڿ� �ð��� 0���� �ν��ؼ� 0731�� �����͸� ���ҷ���
where reg_day <  to_date('20230731' , 'yyyymmdd')+1 --�׷��� +1�� ���ְ� 0218���� �۰� ó���ϸ� 0731�� �����͸� �ҷ��ü��ִ�
;

select to_char(to_date('20230731','yyyymmdd'), 'yyyy.mm.dd hh24:mi:ss')--2023.07.31 00:00:00 
from dual;

