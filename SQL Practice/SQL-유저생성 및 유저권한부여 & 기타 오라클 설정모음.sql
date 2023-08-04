--오라클12버전 이상부터 유저 생성할때 C## 붙여야되는것 안붙여도 되게하는 실행문
alter session set "_ORACLE_SCRIPT"=true;

--유저생성
CREATE USER "LIVESQL2" IDENTIFIED BY "768523"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

--LIVESQL 에 ROLE 추가

-- USER SQL
-- USER SQL
ALTER USER "LIVESQL2"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "LIVESQL2" QUOTA UNLIMITED ON "USERS";

-- ROLES
ALTER USER "LIVESQL2" DEFAULT ROLE "SELECT_CATALOG_ROLE","CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES

--부여된 롤 : 여러가지 권한을 묶어놓은것
--시스템 권한 : 각각의 권한
--커넥트 와 리소스 롤에 포함된 권한을 보는법
select*from dba_sys_privs
where grantee in ('CONNECT','RESOURCE')
order by 1
;

