--Oracle 데이터 사전 쿼리
--테이블 메타 데이터는 Oracle 데이터 사전에서 액세스할 수 있다
--다음 쿼리는 데이터 사전 테이블을 쿼리하는 방법을 보여줌

select table_name, tablespace_name, status
from user_tables
where table_Name = 'EMPLOYEES';

select column_id, column_name , data_type
from user_tab_columns
where table_Name = 'EMPLOYEES'
order by column_id;