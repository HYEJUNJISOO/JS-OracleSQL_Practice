--����Ŭ12���� �̻���� ���� �����Ҷ� C## �ٿ��ߵǴ°� �Ⱥٿ��� �ǰ��ϴ� ���๮
alter session set "_ORACLE_SCRIPT"=true;

--��������
CREATE USER "LIVESQL2" IDENTIFIED BY "768523"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

--LIVESQL �� ROLE �߰�

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

--�ο��� �� : �������� ������ ���������
--�ý��� ���� : ������ ����
--Ŀ��Ʈ �� ���ҽ� �ѿ� ���Ե� ������ ���¹�
select*from dba_sys_privs
where grantee in ('CONNECT','RESOURCE')
order by 1
;

