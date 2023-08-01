--SELECT - Subquery
select ol.*,
            (select ci.email from cust_info ci where ol.cust_id = ci.cust_id) as email,
            cm.kind
from order_list ol, coffee_menu cm
where 1=1
and ol.coffee_no=cm.no
--and cm.kind='에이드'
;

--Table join
select ol.*, ci.email, ci.reg_day, cm.kind --custinfo 테이블의 고객등록날짜
from order_list ol, cust_info ci, coffee_menu cm
where ol.cust_id=ci.cust_id
and ol.coffee_no=cm.no
--and cm.kind='에이드'
;


--Table join
select ol.*, ci.email, ci.reg_day, cm.kind --custinfo 테이블의 고객등록날짜
from order_list ol, cust_info ci, coffee_menu cm
where ol.cust_id=ci.cust_id
and ol.coffee_no=cm.no
and cm.kind='에이드'
;

--SELECT - Subquery
select ol.*,
            (select ci.email from cust_info ci where ol.cust_id = ci.cust_id) as email,
            cm.kind
from order_list ol, 
            (select*from coffee_menu where kind='에이드') cm
where 1=1
and ol.coffee_no=cm.no
;

--SELECT - Subquery(2)
select ol.*,
            (select ci.email from cust_info ci where ol.cust_id = ci.cust_id) as email,
            (select x.kind from coffee_menu x where ol.coffee_no=x.no) as kind
from order_list ol
where 1=1
and ol.cust_id='ID3'
--and (select kind from coffee_menu cm where kind='에이드' and ol.coffee_no=cm.no)='에이드'
;