--DELETE 기본구조
--DELETE 테이블명
--WHERE 검색조건(= , IN, LIKE , Exist)

--DELETE 문에 Subquery 사용하기 (굉장히 유용함**)
--DELETE 테이블명
--SET(컬럼,컬럼) = (select 컬럼명 from table 명 where 조건문)
--WHERE 검색조건 (= , IN , LIKE , Exist )
--           검색조건=(select 컬럼명 from table 명 where 조건문)

delete from order_list
where cust_id='ID5'
;

--order_list에 없는 컬럼의 대상을 삭제할때 subquery 활용
delete from order_list
where 1=1
and cust_id=(select cust_id from cust_info where email='email4@hong.com')
;


select*
from order_list
where 1=1
and cust_id=(select cust_id from cust_info where email='email4@hong.com')
;