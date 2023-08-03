--EMP 테이블의 상위 테이블이 될 DEPT 테이블을 생성
create table cept(   
  ceptno     number(2,0),   
  cname      varchar2(14),   
  loc        varchar2(13),   
  constraint pk_cept primary key (ceptno)   
);

--DEPT 테이블에 대한 외래 키 참조가 있는 EMP 테이블을 생성
--외래 키를 사용하려면 EMP 테이블의 DEPTNO가 DEPT 테이블의 DEPTNO 열에 있어야함
create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  ceptno   number(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_ceptno foreign key (ceptno) references cept (ceptno)   
);

select*from cept;

--alter table 로 컬럼추가
alter table cept add(memo varchar2(20));
alter table cept drop(memo);

--테이블에 컬럼값을 넣고 values 로 값을 넣기
--alter로 컬럼이 추가되는경우가있기떄문에, 왠만하면 insert구문에선 뒤에 컬럼값을 입력해주는게 좋음
insert into cept(ceptno,cname,loc)-- O
values(10,'ACCOUNTING','NEW YORK');

insert into cept -- X
values(20,'RESEARCH','DALLAS')

insert into cept   
values(30, 'SALES', 'CHICAGO')

insert into cept  
values(40, 'OPERATIONS', 'BOSTON')

select*from emp;

--emp에 값을 넣기
--TO_DATE 함수를 사용하여 문자열 리터럴을 
--oracle DATE 형식으로 변환하여 EMP 행을 삽입한다

insert into emp   
values(   
 7839, 'KING', 'PRESIDENT', null,   
 to_date('17-11-1981','dd-mm-yyyy'),  -->날짜형식을 거꾸로 넣어도 들어감
 5000, null, 10   
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-07-87','dd-mm-rr') - 85,  
 3000, null, 20  
);

insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

DECLARE --DECLARE BEGIN - END 구절안에 으면 모든 INSERT문을 한꺼번에 실행가능
BEGIN     --PL/SQL 프로시저
insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-07-87', 'dd-mm-rr') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

BEGIN --해당 insert문에 오류가 발생해도 null처리하고 나머지 insert문은 실행시켜라
insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);
Exception when others then
    null;
END;

END;

--select
--CEPT 테이블 CEPTNO의 기본 키와 EMP 테이블의 CEPTNO 외래 키를 기반으로 하는
--CEPT와 EMP 테이블 간의 간단한 자연 조인
select ename, cname, job, empno, hiredate, loc   
from emp, cept   
where emp.ceptno = cept.ceptno   
order by ename
;

--SQL 문의 GROUP BY 절은 그룹화되지 않은 열의 집계 함수를 허용함
--조인은 내부 조인이므로 직원이 없는 부서는 표시되지 않는다
--select문의 순서 : from -> where -> group by -> -> having count(*) -> select -> order by
--order by 는 프로그램의 속도저하의 주원인 / 사용시 주의가 필요하다
select cname, count(*) count_of_employees 
from cept, emp 
where cept.ceptno = emp.ceptno 
group by CNAME 
order by 2 desc
-- == 
select cname, count(*) count_of_employees 
from cept, emp 
where cept.ceptno = emp.ceptno 
group by CNAME 
order by count_of_employees  desc