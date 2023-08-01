--UPDATE 기본구조
--UPDATE 테이블명
--SET 컬럼=값, 컬럼=값
--WHERE 검색조건 (= , IN, LIKE , Exist )

--UPDATE 문에 Subquery 사용하기 (굉장히 유용함**)
--UPDATE 테이블명
--SET(컬럼,컬럼) = (select 컬럼명 from table 명 where 조건문)
--WHERE 검색조건 (= , IN , LIKE , Exist )
--           검색조건=(select 컬럼명 from table 명 where 조건문)

update order_list
set name='홍길성형2', price=3300
where cust_id='ID2'
;

select*
from order_list
where cust_id='ID2'
;

--Subquery UPDATE문
update order_list ol
set name=(select x.name from cust_info x where x.cust_id=ol.cust_id)
where reg_day > sysdate-100
;

select*
from order_list
where reg_day > sysdate-100
;

--자체실습
update order_list ol
set (coffee,price) = (select x.coffee, x.price from coffee_menu x where x.no=ol.coffee_no)
where reg_day > sysdate-100
;

select*
from order_list
where cust_id='ID2'
;
