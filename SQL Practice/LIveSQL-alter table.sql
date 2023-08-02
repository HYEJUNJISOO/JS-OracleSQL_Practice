--alter table : 구문을 사용하여 테이블을 생성한 후 추가 열을 추가할 수 있다
--테이블을 만들었는데, 넣어야할 컬럼이없을때 추가가능
--추가한 컬럼을 지울땐 add -> drop 

alter table EMPLOYEES 
add country_code varchar2(2);

select*from EMPLOYEES;