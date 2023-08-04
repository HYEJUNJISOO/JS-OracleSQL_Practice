--CREATE TABLE

--REGIONS 테이블은 위치에 대한 지역 정보를 보유한다
CREATE TABLE regions  
    ( region_id      NUMBER   
                     CONSTRAINT region_id_nn NOT NULL 
    ,                CONSTRAINT reg_id_pk  
                        PRIMARY KEY (region_id) 
    , region_name    VARCHAR2(25)   
    )
    DROP TABLE regions CASCADE CONSTRAINTS PURGE;
    
--COUNTRIES 테이블은 고객 및 회사 위치에 대한 국가 정보를 보유한다
--OE.CUSTOMERS 테이블과 HR.LOCATIONS에는 이 테이블에 대한 외래 키가 있다
CREATE TABLE countries   
    ( country_id      CHAR(2)   
                      CONSTRAINT country_id_nn NOT NULL 
    ,                 CONSTRAINT country_c_id_pk   
        	         PRIMARY KEY (country_id) 
    , country_name    VARCHAR2(40)   
    , region_id       NUMBER   
    ,                 CONSTRAINT countr_reg_fk  
        	         FOREIGN KEY (region_id)  
          	         REFERENCES regions (region_id)   
    )   
    ORGANIZATION INDEX
    ;
    
select*from countries;
DROP TABLE countries CASCADE CONSTRAINTS PURGE;



--LOCATIONS 테이블에는 회사 부서의 주소 정보가 들어 있습니다.
CREATE TABLE locations  
    ( location_id    NUMBER(4)  NOT NULL 
                     CONSTRAINT loc_id_pk  
       		        PRIMARY KEY  
    , street_address VARCHAR2(40)  
    , postal_code    VARCHAR2(12)  
    , city           VARCHAR2(30)  
	             CONSTRAINT loc_city_nn  NOT NULL  
    , state_province VARCHAR2(25)  
    , country_id     CHAR(2)  
    ,                CONSTRAINT loc_c_id_fk  
       		        FOREIGN KEY (country_id)  
        	        REFERENCES countries(country_id) 
    )
    ;
    DROP TABLE locations CASCADE CONSTRAINTS PURGE;
    
    --LOCATIONS 테이블에 대한 후속 행 추가에 유용하다(시퀀스 생성)
    --시퀀스는 데이터베이스에서 순차적으로 증가하는 숫자를 생성하는데 사용
    --start with : 시퀀스가 처음 생성될 때의 값
    --increment by : 시퀀스가 증가하는 값
    --maxvalue : 시퀀스가 생성할수있는 최대값
    --nocache : 시퀀스가 캐시되지않음 -> 시퀀스마다 값을 계산함
    --nocycle : 시퀀스가 최대값에 도달하면 순환하지않음 -> 더 이상 시퀀스가 값을 생성하지않음
    CREATE SEQUENCE locations_seq  
 START WITH     3300  
 INCREMENT BY   100  
 MAXVALUE       9900  
 NOCACHE  
 NOCYCLE
     ;
     
     drop sequence locations_seq;
     
--DEPARTMENTS 테이블에는 회사 부서 정보가 들어 있다
CREATE TABLE departments  
    ( department_id    NUMBER(4) 
                       CONSTRAINT dept_id_pk  
       		          PRIMARY KEY 
    , department_name  VARCHAR2(30)  
	               CONSTRAINT dept_name_nn  NOT NULL  
    , manager_id       NUMBER(6)  
    , location_id      NUMBER(4)  
    ,                  CONSTRAINT dept_loc_fk  
       		          FOREIGN KEY (location_id)  
        	          REFERENCES locations (location_id)  
    )
    ;
   DROP TABLE departments CASCADE CONSTRAINTS PURGE;
    
--  DEPARTMENTS 테이블에 대한 후속 행 추가에 유용(시퀀스 생성)
CREATE SEQUENCE departments_seq  
 START WITH     280  
 INCREMENT BY   10  
 MAXVALUE       9990  
 NOCACHE  
 NOCYCLE
 ;
 drop SEQUENCE departments_seq;
 --JOBS 테이블은 회사 내에서 다양한 직무 역할 이름을 보유
CREATE TABLE jobs  
    ( job_id         VARCHAR2(10)  
                     CONSTRAINT job_id_pk  
      		        PRIMARY KEY 
    , job_title      VARCHAR2(35)  
	             CONSTRAINT job_title_nn  NOT NULL  
    , min_salary     NUMBER(6)  
    , max_salary     NUMBER(6)  
    )
    ;
    DROP TABLE jobs CASCADE CONSTRAINTS PURGE;
    select*from jobs;
--EMPLOYEES 테이블에는 회사의 직원 인사 정보가 들어 있음
--UNIQUE : 중복을 방지하기위한 제약조건
--CHECK : 해당 값 이상or이하의 값이 들어오지못하게 CHECK하는 제약조건
--테이블을 만들면서 필요한 제약조건들을 걸어놓으면 테이블의 무결성을 보장할수있음
CREATE TABLE employees  
    ( employee_id    NUMBER(6)  
                     CONSTRAINT emp_emp_id_pk  
                        PRIMARY KEY 
    , first_name     VARCHAR2(20)  
    , last_name      VARCHAR2(25)  
	             CONSTRAINT emp_last_name_nn  NOT NULL  
    , email          VARCHAR2(25)  
	             CONSTRAINT emp_email_nn  NOT NULL  
    , CONSTRAINT     emp_email_uk  
                     UNIQUE (email)  
    , phone_number   VARCHAR2(20)  
    , hire_date      DATE  
	             CONSTRAINT emp_hire_date_nn  NOT NULL  
    , job_id         VARCHAR2(10)  
	             CONSTRAINT emp_job_nn  NOT NULL  
    , salary         NUMBER(8,2)  
                     CONSTRAINT emp_salary_min  
                        CHECK (salary > 0)  
    , commission_pct NUMBER(2,2)  
    , manager_id     NUMBER(6)  
    ,                CONSTRAINT emp_manager_fk  
                        FOREIGN KEY (manager_id)  
                        REFERENCES employees 
    , department_id  NUMBER(4)  
    ,                CONSTRAINT emp_dept_fk  
                        FOREIGN KEY (department_id)  
                        REFERENCES departments 
    )
    ;
    DROP TABLE employees CASCADE CONSTRAINTS PURGE;
 --기존에 외래키를 만들지않았을때 외래키를 테이블에 추가할수있다
ALTER TABLE departments  
   ADD (CONSTRAINT dept_mgr_fk  
      	FOREIGN KEY (manager_id)  
      	REFERENCES employees (employee_id)  
    )
    ;
DROP TABLE departments2 CASCADE CONSTRAINTS PURGE;
--직원 테이블에 대한 후속 행 추가에 유용(시퀀스 생성)
CREATE SEQUENCE employees_seq  
 START WITH     207  
 INCREMENT BY   1  
 NOCACHE  
 NOCYCLE
 ;
 DROP sequence employees_seq2;
 --JOB_HISTORY 테이블은 직원이 과거에 보유했던 작업 기록을 보유함
CREATE TABLE job_history  
    ( employee_id   NUMBER(6)  
	            CONSTRAINT jhist_employee_nn  NOT NULL  
    ,               CONSTRAINT jhist_emp_fk  
                       FOREIGN KEY (employee_id)  
                       REFERENCES employees  
    , start_date    DATE  
	            CONSTRAINT jhist_start_date_nn  NOT NULL  
    , end_date      DATE  
	            CONSTRAINT jhist_end_date_nn  NOT NULL  
    , job_id        VARCHAR2(10)  
	            CONSTRAINT jhist_job_nn  NOT NULL  
    ,               CONSTRAINT jhist_job_fk  
                       FOREIGN KEY (job_id)  
                       REFERENCES jobs  
    , department_id NUMBER(4)  
    ,               CONSTRAINT jhist_dept_fk  
                       FOREIGN KEY (department_id)  
                       REFERENCES departments 
    , CONSTRAINT    jhist_emp_id_st_date_pk  
                       PRIMARY KEY (employee_id, start_date) 
    , CONSTRAINT    jhist_date_interval  
                       CHECK (end_date > start_date)  
    ) 
    ;
    
    DROP TABLE job_history CASCADE CONSTRAINTS PURGE;
    
--EMP_DETAILS_VIEW는 직원, 작업, 부서, 작업, 국가 및 위치 
--테이블을 조인하여 직원에 대한 세부 정보를 제공한다
CREATE OR REPLACE VIEW emp_details_view  
  (employee_id,  
   job_id,  
   manager_id,  
   department_id,  
   location_id,  
   country_id,  
   first_name,  
   last_name,  
   salary,  
   commission_pct,  
   department_name,  
   job_title,  
   city,  
   state_province,  
   country_name,  
   region_name)  
AS SELECT  
  e.employee_id,   
  e.job_id,   
  e.manager_id,   
  e.department_id,  
  d.location_id,  
  l.country_id,  
  e.first_name,  
  e.last_name,  
  e.salary,  
  e.commission_pct,  
  d.department_name,  
  j.job_title,  
  l.city,  
  l.state_province,  
  c.country_name,  
  r.region_name  
FROM  
  employees e,  
  departments d,  
  jobs j,  
  locations l,  
  countries c,  
  regions r  
WHERE e.department_id = d.department_id  
  AND d.location_id = l.location_id  
  AND l.country_id = c.country_id  
  AND c.region_id = r.region_id  
  AND j.job_id = e.job_id   
WITH READ ONLY
;


 