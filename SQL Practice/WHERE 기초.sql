-- =, <>
-- = 해당 내용에 해당되는 데이터들을 가져옴
-- <> : 해당 내용을 제외한 데이터들을 가져옴 ( != 도 사용가능)

select *
from order_list
where coffee='카푸치노'
;

select *
from order_list
--where coffee <>'카푸치노'
where coffee !='카푸치노'
;

--in , not in
--in : 테이블내에서 여러가지 데이터를 가져올때 사용
--not in : 테이블내에서 해당내용을 제외한 데이터를 가져올때 사용

select *
from order_list
where coffee in ('카푸치노' , '그린티')
;

select *
from order_list
where coffee not in ('카푸치노', '그린티')
;

--like , not like
--앞에 글자를 걸어줘야 프로그램 속도가 향상됨(인덱스가 글자를 받아서..?)
select*
from order_list
where coffee like '카푸%'
;

select*
from order_list
where coffee not like '%치노'
;

--숫자
select*
from order_list
--where price=4000
--where price<4000
--where price < '4000' --자동으로 숫자로 형변환함
where price < to_number('4000')--하지만 가독성을 위해 이렇게 형변환해주는게 좋음
;

--날짜
select*
from order_list
;

--기간검색
select coffee_no,coffee,price,to_char(reg_day,'yyyy.mm.dd hh24:mi:ss')
from order_list
--where reg_day <= to_date('20230731' , 'yyyymmdd') --yyyymmdd 뒤에 시간이 0으로 인식해서 0731일 데이터를 못불러옴
where reg_day <  to_date('20230731' , 'yyyymmdd')+1 --그래서 +1을 해주고 0218보다 작게 처리하면 0731일 데이터를 불러올수있다
;

select to_char(to_date('20230731','yyyymmdd'), 'yyyy.mm.dd hh24:mi:ss')--2023.07.31 00:00:00 
from dual;

