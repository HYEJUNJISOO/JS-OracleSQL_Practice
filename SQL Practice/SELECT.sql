--SELECT문의 기본 구조
--SELECT 컬럼명 FROM 테이블명 WHERE 검색조건(= , IN, LIKE, Exist)
--ORDER BY 컬럼 정렬(ASC,DESC)

--SELECT문에서 쿼리가 진행되는 순서
-- 3. SELECT 컬럼명
-- 1. FROM 테이블명
-- 2. WHERE 검색조건(=. IN,LIKE,Exist)
-- 4. ORDER BY 컬럼 정렬(ASC,DESC)

-- IN 은 WHERE 문에서 여러가지 조건을 SELECT 해서 불러올때 사용
-- SELECT 뒤에 *는 모든 컬럼을 가져옴 / * 말고 각 컬럼명을 입력시 해당 컬럼들만 가져옴
-- order by asc = 오름차순 / order by desc = 내림차순
-- 컬러명앞에 as 붙이면 컬럼명 수정가능


select*
from coffee_menu
--where kind='커피'
where  kind in ('커피','논커피')
;

select coffee,kind,price
from coffee_menu
where kind in('커피','에이드')
;

select coffee,kind,price
from coffee_menu
where kind in('커피','에이드')
order by price asc;

select coffee as coffeename,kind,price
from coffee_menu
where kind in('커피','에이드')
order by coffeename desc;

select coffee as coffeename,kind,price -- 오류발생함 -> 순서상 읽어올수가 없음
from coffee_menu
where coffeename='카푸치노'
order by coffeename desc;

select coffee as coffee,kind,price
from coffee_menu
where coffee='카푸치노'
order by coffee desc;

--to_char(reg_day,'yyyy.mm.dd hh24:mm:ss') -> reg_day 를 해당 문자형식으로 가져옴
select no,cust_id,name,email,role,to_char (reg_day,'yyyy.mm.dd hh24:mm:ss')
from cust_info;