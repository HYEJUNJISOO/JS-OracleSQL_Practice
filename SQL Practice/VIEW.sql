--���������� ������������ �ش� �������忡 ��Ī�� �ִ°��� VIEW �����
--�ǹ������� �ٽ����� ������ �����ϰ�� �並 ���� �Ⱦ��Եȴٰ���
--������ ���߿� �����Ǵ� �÷��� ����� �׺κ��� �信���� ��������ߵǱ⶧����..
select ol.* , ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
order by coffee;

select *
from v_order_list_cust_info
where cust_id='ID2'
;