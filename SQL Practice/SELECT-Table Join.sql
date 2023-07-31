--order_list 에는 이메일 컬럼이없음 -> cust_info 에 이메일 컬럼이있으므로
-- cust_info 테이블을 조인하여 데이터를 가져올수있음
-- 테이블 이름이 너무길어 가독성이떨어질땐, 얼라이어스를 주면됨 -> 이때 나머지 문장의 테이블명
-- 도 반드시 수정해줘야함
-- 두 테이블을 join시 연결점은 같은 키값을 한개만 연결하면됨(쿼리는 속도가 중요하기때문)

select ol.*, ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ol.coffee='카푸치노'
and ol.price <=3000
;

select ol.*, ci.email
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ci.role='MEMBER'
;

select ol.*, ci.email, ci.reg_day --custinfo 테이블의 고객등록날짜
from order_list ol, cust_info ci
where ol.cust_id=ci.cust_id
and ci.role='MEMBER'
order by ol.reg_day -- reg_day 가 어느 테이블것인지 인식못하기에 앞에 꼭 얼라이어스 입력
;

--3개 테이블 JOIN
select ol.*, ci.email, ci.reg_day, cm.kind --custinfo 테이블의 고객등록날짜
from order_list ol, cust_info ci, coffee_menu cm
where ol.cust_id=ci.cust_id
and ol.coffee_no=cm.no
and cm.kind='에이드'
;

select * 
from coffee_menu
where coffee='오렌지'
;

select ol.*
from order_list ol
where ol.coffee='카푸치노'
and ol.price <= 3000
;