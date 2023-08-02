--Delete
--delete or update 하기전에 항상 select를 먼저해서 데이터를 확인하는 버릇을 키우자
select*from employees
where name='Sam Smith';


delete from employees
where name = 'Sam Smith';

