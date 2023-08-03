--Triger
--create or replace trigger 트리거이름 
--before or alter ---> 트리거의 발생 시점, 보통 before을 많이 사용
--delete or insert or update on 테이블명 --> 3개를 선택해서 사용
--referencing new as new old as old --> new,old 에 대한 alias 사용가능
--for each row [statement] --> 생략될 경우 statement 실행 / statement : 해당 이벤트에 한번만 실행됨
--when(new.column='~~') --> 트리거의 조건을 생성

--declare --> PL/SQL 구문
--  n number; --> 변수선언
--begin
--  new : 새로 추가되거나 변경된 후의 값에 트러가가 적용
-- old : 변경 전의 값에 트리거가 적용(update : 수정 전 값, delete : 삭제할 값)
-- if inserting then ~~; --> insert 이벤트 실행
--elsif updating then ~~; --> update 이벤트 실행
--elsif deleting then ~~; --> delete 이벤트 실행
--end if;
--end

--triger 적용을 위해 임의 샘플 테이블 생성
create table DEPT(   
  deptno     number(2,0),   
  dname      varchar2(14),   
  loc        varchar2(13),   
  constraint pk_dept primary key (deptno)   
)

--히스토리 테이블 생성
 CREATE TABLE "LIVESQL"."DEPT_HIS" 
   (	HISDAY DATE DEFAULT sysdate,
        his_flag varchar2(10),
        "DEPTNO" NUMBER(5,0), 
        "DNAME" VARCHAR2(14 BYTE), 
        "LOC" VARCHAR2(13 BYTE), 
        "MEMO" VARCHAR2(200 BYTE)
    );
    
--이벤트 테이블 생성
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

--Trigger 생성 & 특정값일때 insert update delete 제어
CREATE OR REPLACE TRIGGER TG_DEPT
    BEFORE
    INSERT OR UPDATE OR DELETE ON DEPT
    FOR EACH ROW
    
    DECLARE
        n number;
    BEGIN
        --insert시 detno가 1000 이상일시  못들어오게 막고 오류를 발생시킨다
        IF INSERTING THEN   DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - INSERT');
             if : new.deptno>1000 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - deptno size Error');
                end if;
        
        ELSIF UPDATING THEN   DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - UPDATE');
                 if : new.deptno>1000 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - deptno size Error');
                end if;
        --delete 는 new 가 아니라 old
        ELSIF DELETING THEN  DBMS_OUTPUT.put_line('TG_DEPT_BEFORE - DELETE');
                 if : old.deptno=10 then       
                RAISE_APPLICATION_ERROR(-20001,' NO - remove deptno - 10');
                end if;
        
        END IF;
        
        END;
        
--언제 어떤값이 테이블에 들어오는지 확인하기위한 Trigger (BEFORE)
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
        
--언제 어떤값이 테이블에 들어오는지 확인하기위한 Trigger (AFTER)
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
        
--이벤트 테이블 / for each row 가 없으면 작업수와 상관없이 history에 한개만남음(BEFORE)
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
            values(sysdate, vFlag, 'Event 발생');
                 
          
        ELSIF DELETING THEN
               insert into event (HISDAY,HISFLAG,MEMO)
               values(sysdate, vFlag, 'Event 발생');
       
        END IF;
        
        END;
        

--객체이름이 이미 존재해서 트리거 생성불가할때 트리거 이름변경
alter trigger tg_dept
rename to tg_new_dept;

select*from dept;
select*from dept_his order by hisday;
select*from event order by hisday;

--데이터값 insert
insert into DEPT (DEPTNO, DNAME, LOC) values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept
values(60,'OPERATIONS', 'BOSTON','고객-기업등록, InsertDept.java');

update dept set loc='한국-부산' , memo='고객-기업수정, com.sample.spring.Service.Update.java' where deptno=60;

update dept set deptno=10001 where deptno=10;

update dept set loc='England' , memo='일괄적업2';

delete from dept where deptno=50;

insert into dept  values(20, 'RESEARCH', 'DALLAS');
