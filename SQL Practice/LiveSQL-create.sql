--[테이블 생성]
--primary key 가 생성되면 자동으로 인덱스가 생성됨
--foreign key 는 자동으로 인덱스가 생성되지않음

create table DEPARTMENTS (  
  deptno        number,  
  name          varchar2(50) not null,  
  location      varchar2(50),  
  constraint pk_departments primary key (deptno)  
);


create table EMPLOYEES (  
  empno             number,  
  name              varchar2(50) not null,  
  job               varchar2(50),  
  manager           number,  
  hiredate          date,  
  salary            number(7,2),  
  commission        number(7,2),  
  deptno           number,  
  constraint pk_employees primary key (empno),  
  constraint fk_employees_deptno foreign key (deptno) 
      references DEPARTMENTS (deptno)  
);

CREATE USER LIVESQL IDENTIFIED BY 768523;

grant connect, resource to LIVESQL;

drop table EMPLOYEES cascade constraints;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

----------------------------------------------------------------------------
--[트리거]
--어떤 테이블의 어떤 이벤트(insert,update,delete 등)이 발생했을때 어떠한 작업을 할수있도록
--만드는것.. 

create or replace trigger  DEPARTMENTS_BIU
    before insert or update on DEPARTMENTS
    for each row
begin
    if inserting and :new.deptno is null then
        :new.deptno := to_number(sys_guid(), 
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/

create or replace trigger EMPLOYEES_BIU
    before insert or update on EMPLOYEES
    for each row
begin
    if inserting and :new.empno is null then
        :new.empno := to_number(sys_guid(), 
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/



