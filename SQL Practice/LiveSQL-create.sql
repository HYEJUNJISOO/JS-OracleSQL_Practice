--[���̺� ����]
--primary key �� �����Ǹ� �ڵ����� �ε����� ������
--foreign key �� �ڵ����� �ε����� ������������

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
--[Ʈ����]
--� ���̺��� � �̺�Ʈ(insert,update,delete ��)�� �߻������� ��� �۾��� �Ҽ��ֵ���
--����°�.. 

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

insert into departments (name,location) values
    ('Finance','New York');
    
insert into departments (name, location) values
    ('Development','San Jose');
    
select*from departments; --insert�� name,location ���� Ʈ���ŷ����� deptno�� ������


insert into EMPLOYEES
        (name, job,salary,deptno)
        values
        ('Sam Smith','Programmer',
        5000,
        (select deptno
        from departments
        where name = 'Development'));
        
insert into EMPLOYEES
        (name,job,salary,deptno)
        values
        ('Mara Martin','Analyst',
        6000,
        (select deptno
        from departments
        where name ='Finance'));
        
insert into EMPLOYEES
        (name,job,salary,deptno)
        values
        ('Yun Yates','Analyst',
        5500,
        (select deptno
        from departments
        where name = 'Development'));
        
select*from EMPLOYEES;
    



