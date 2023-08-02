--Table Delete
--cascade constraints = 테이블에 정의된 모든 제약 조건도 삭제한다

drop table departments cascade constraints;

drop table employees cascade constraints;


--테이블 삭제 취소
--RECYCLEBIN 초기화 매개변수가 ON(10g의 기본값)으로 설정된 경우 이 테이블을 삭제하면 휴지통에 배치됩니다. 
--테이블 삭제를 취소할 수 있는지 확인하려면 다음 데이터 사전 쿼리를 실행합니다.

select object_name, 
       original_name, 
       type, 
       can_undrop, 
       can_purge
from recyclebin; -- recyclebin=휴지통

--테이블 삭제를 취소하려면 flashback 명령을 사용합니다. 예를 들면 다음과 같습니다.

flashback table DEPARTMENTS to before drop;
flashback table EMPLOYEES to before drop;
select count(*) departments 
from departments;
select count(*) employees
from employees;

select*from DEPARTMENTS;

select*from EMPLOYEES;