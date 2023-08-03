--Triger
--create or replace trigger Ʈ�����̸� 
--before or alter ---> Ʈ������ �߻� ����, ���� before�� ���� ���
--delete or insert or update on ���̺�� --> 3���� �����ؼ� ���
--referencing new as new old as old --> new,old �� ���� alias ��밡��
--for each row [statement] --> ������ ��� statement ���� / statement : �ش� �̺�Ʈ�� �ѹ��� �����
--when(new.column='~~') --> Ʈ������ ������ ����

--declare --> PL/SQL ����
--  n number; --> ��������
--begin
--  new : ���� �߰��ǰų� ����� ���� ���� Ʈ������ ����
-- old : ���� ���� ���� Ʈ���Ű� ����(update : ���� �� ��, delete : ������ ��)
-- if inserting then ~~; --> insert �̺�Ʈ ����
--elsif updating then ~~; --> update �̺�Ʈ ����
--elsif deleting then ~~; --> delete �̺�Ʈ ����
--end if;
--end

--triger ������ ���� ���� ���� ���̺� ����
create table DEPT(   
  deptno     number(2,0),   
  dname      varchar2(14),   
  loc        varchar2(13),   
  constraint pk_dept primary key (deptno)   
)

--�����丮 ���̺� ����
 CREATE TABLE "LIVESQL"."DEPT_HIS" 
   (	HISDAY DATE DEFAULT sysdate,
        his_flag varchar2(10),
        "DEPTNO" NUMBER(5,0), 
        "DNAME" VARCHAR2(14 BYTE), 
        "LOC" VARCHAR2(13 BYTE), 
        "MEMO" VARCHAR2(200 BYTE)
    );
    
--�̺�Ʈ ���̺� ����
create table event(
    hisday date,
    hisflag varchar2(10),
    memo varchar2(20)
    );

ALTER TABLE DEPT
MODIFY DEPTNO NUMBER(5,0);

alter table dept
add (memo varchar2(200));

drop table dept;
drop table dept_his;

--Trigger ���� & Ư�����϶� insert update delete ����
CREATE OR REPLACE TRIGGER TG_DEPT
    BEFORE
    INSERT OR UPDATE OR DELETE ON DEPT
    FOR EACH ROW
    
    DECLARE
        n number;
    BEGIN
        --insert�� detno�� 1000 �̻��Ͻ�  �������� ���� ������ �߻���Ų��
        IF INSERTING THEN   DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - INSERT');
             if : new.deptno>1000 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - deptno size Error');
                end if;
        
        ELSIF UPDATING THEN   DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - UPDATE');
                 if : new.deptno>1000 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - deptno size Error');
                end if;
        --delete �� new �� �ƴ϶� old
        ELSIF DELETING THEN  DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - DELETE');
                 if : old.deptno=10 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - remove deptno - 10');
                end if;
        
        END IF;
        
        END;
        
--���� ����� ���̺� �������� Ȯ���ϱ����� Trigger (BEFORE)
CREATE OR REPLACE TRIGGER TG_DEPT
    BEFORE
    INSERT OR UPDATE OR DELETE ON DEPT
    FOR EACH ROW
    
    DECLARE
       vFlag varchar2(10);
    BEGIN
    
        IF INSERTING THEN vFlag :='INS';
        elsIF UPDATING THEN vFlag :='UPD';
        elsIF DELETING THEN vFlag :='DEL';
        End IF;
        
   
        IF INSERTING or UPDATING THEN  
            insert into dept_his (HISDAY,HIS_FLAG, DEPTNO, DNAME, LOC, MEMO)
            values(sysdate, vFlag, :new.DEPTNO,  :new.DNAME, :new.LOC, :new.MEMO);
                 
          
        ELSIF DELETING THEN
            insert into dept_his (HISDAY, HIS_FLAG,DEPTNO, DNAME, LOC, MEMO)
            values(sysdate, vFlag, :old.DEPTNO, :old.DNAME, :old.LOC, :old.MEMO);
       
        END IF;
        
        END;
        
--���� ����� ���̺� �������� Ȯ���ϱ����� Trigger (AFTER)
CREATE OR REPLACE TRIGGER TG_DEPT
    AFTER
    INSERT OR UPDATE OR DELETE ON DEPT
    FOR EACH ROW
    
    DECLARE
       vFlag varchar2(10);
    BEGIN
    
        IF INSERTING THEN vFlag :='INS';
        elsIF UPDATING THEN vFlag :='UPD';
        elsIF DELETING THEN vFlag :='DEL';
        End IF;
        
   
        IF INSERTING or UPDATING THEN  
            insert into dept_his (HISDAY,HIS_FLAG, DEPTNO, DNAME, LOC, MEMO)
            values(sysdate, vFlag, :new.DEPTNO,  :new.DNAME, :new.LOC, :new.MEMO);
                 
          
        ELSIF DELETING THEN
            insert into dept_his (HISDAY, HIS_FLAG,DEPTNO, DNAME, LOC, MEMO)
            values(sysdate, vFlag, :old.DEPTNO, :old.DNAME, :old.LOC, :old.MEMO);
       
        END IF;
        
        END;
        
--�̺�Ʈ ���̺� / for each row �� ������ �۾����� ������� history�� �Ѱ�������(BEFORE)
CREATE OR REPLACE TRIGGER TG_DEPT
    BEFORE
    INSERT OR UPDATE OR DELETE ON DEPT
   -- FOR EACH ROW
    
    DECLARE
       vFlag varchar2(10);
    BEGIN
    
        IF INSERTING THEN vFlag :='INS';
        elsIF UPDATING THEN vFlag :='UPD';
        elsIF DELETING THEN vFlag :='DEL';
        End IF;
        
   
        IF INSERTING or UPDATING  THEN  
            insert into event (HISDAY,HISFLAG,MEMO)
            values(sysdate, vFlag, 'Event �߻�');
                 
          
        ELSIF DELETING THEN
               insert into event (HISDAY,HISFLAG,MEMO)
               values(sysdate, vFlag, 'Event �߻�');
       
        END IF;
        
        END;
        

--��ü�̸��� �̹� �����ؼ� Ʈ���� �����Ұ��Ҷ� Ʈ���� �̸�����
alter trigger tg_dept
rename to tg_new_dept;

select*from dept;
select*from dept_his order by hisday;
select*from event order by hisday;

--�����Ͱ� insert
insert into DEPT (DEPTNO, DNAME, LOC) values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept
values(60,'OPERATIONS', 'BOSTON','��-������, InsertDept.java');

update dept set loc='�ѱ�-�λ�' , memo='��-�������, com.sample.spring.Service.Update.java' where deptno=60;

update dept set deptno=10001 where deptno=10;

update dept set loc='England' , memo='�ϰ�����2';

delete from dept where deptno=50;

insert into dept  values(20, 'RESEARCH', 'DALLAS');
