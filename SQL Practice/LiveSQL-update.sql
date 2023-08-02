--update

update employees
set country_code = 'US';


update employees
set commission = 2000
where  name = 'Sam Smith';


select name, country_code, salary, commission
from employees
order by name;

select*from employees;