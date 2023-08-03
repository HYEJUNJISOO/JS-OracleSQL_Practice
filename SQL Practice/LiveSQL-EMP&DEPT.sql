--EMP ���̺��� ���� ���̺��� �� DEPT ���̺��� ����
create table cept(   
  ceptno     number(2,0),   
  cname      varchar2(14),   
  loc        varchar2(13),   
  constraint pk_cept primary key (ceptno)   
);

--DEPT ���̺� ���� �ܷ� Ű ������ �ִ� EMP ���̺��� ����
--�ܷ� Ű�� ����Ϸ��� EMP ���̺��� DEPTNO�� DEPT ���̺��� DEPTNO ���� �־����
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

--alter table �� �÷��߰�
alter table cept add(memo varchar2(20));
alter table cept drop(memo);

--���̺� �÷����� �ְ� values �� ���� �ֱ�
--alter�� �÷��� �߰��Ǵ°�찡�ֱ⋚����, �ظ��ϸ� insert�������� �ڿ� �÷����� �Է����ִ°� ����
insert into cept(ceptno,cname,loc)-- O
values(10,'ACCOUNTING','NEW YORK');

insert into cept -- X
values(20,'RESEARCH','DALLAS')

insert into cept   
values(30, 'SALES', 'CHICAGO')

insert into cept  
values(40, 'OPERATIONS', 'BOSTON')

select*from emp;

--emp�� ���� �ֱ�
--TO_DATE �Լ��� ����Ͽ� ���ڿ� ���ͷ��� 
--oracle DATE �������� ��ȯ�Ͽ� EMP ���� �����Ѵ�

insert into emp   
values(   
 7839, 'KING', 'PRESIDENT', null,   
 to_date('17-11-1981','dd-mm-yyyy'),  -->��¥������ �Ųٷ� �־ ��
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

DECLARE --DECLARE BEGIN - END �����ȿ� ���� ��� INSERT���� �Ѳ����� ���డ��
BEGIN     --PL/SQL ���ν���
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

BEGIN --�ش� insert���� ������ �߻��ص� nulló���ϰ� ������ insert���� ������Ѷ�
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
--CEPT ���̺� CEPTNO�� �⺻ Ű�� EMP ���̺��� CEPTNO �ܷ� Ű�� ������� �ϴ�
--CEPT�� EMP ���̺� ���� ������ �ڿ� ����
select ename, cname, job, empno, hiredate, loc   
from emp, cept   
where emp.ceptno = cept.ceptno   
order by ename
;

--SQL ���� GROUP BY ���� �׷�ȭ���� ���� ���� ���� �Լ��� �����
--������ ���� �����̹Ƿ� ������ ���� �μ��� ǥ�õ��� �ʴ´�
--select���� ���� : from -> where -> group by -> -> having count(*) -> select -> order by
--order by �� ���α׷��� �ӵ������� �ֿ��� / ���� ���ǰ� �ʿ��ϴ�
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