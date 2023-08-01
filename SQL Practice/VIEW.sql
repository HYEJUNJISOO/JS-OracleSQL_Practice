--쿼리문장이 복잡해졌을때 해당 쿼리문장에 명칭을 주는것을 VIEW 라고함
--실무에서는 핵심적인 쿼리문 제외하고는 뷰를 거의 안쓰게된다고함
--이유는 나중에 변동되는 컬럼이 생기면 그부분을 뷰에서도 수정해줘야되기때문에..
select ol.* , ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
order by coffee;

select *
from v_order_list_cust_info
where cust_id='ID2'
;