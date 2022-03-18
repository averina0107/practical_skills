�������� ������� �6
����:SQL
���������:
��������� 26 ������
�������� �.�.

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employees.employee_name, salary.monthly_salary
from 
employees inner join employee_salary
	on employees.id=employee_salary.employee_id
inner join salary 
	on salary.id=employee_salary.salary_id;

--2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary 
from employees 
join employee_salary
	on employees.id=employee_salary.employee_id
join salary
	on salary.id=employee_salary.salary_id 
where monthly_salary < 2000
order by monthly_salary asc;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select employee_name, monthly_salary
from salary 
left join employee_salary
	on salary.id=employee_salary.salary_id
left join employees
	on employees.id=employee_salary.employee_id 
where employee_name is null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary, employee_name
from salary 
right join employee_salary
	on salary.id=employee_salary.salary_id
left join employees
	on employees.id=employee_salary.employee_id
where employee_name is null and monthly_salary<2000
order by monthly_salary asc;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select employee_name, monthly_salary 
from salary 
left join employee_salary
	on salary.id=employee_salary.salary_id
right join employees
	on employee_salary.employee_id=employees.id
where monthly_salary is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name 
from roles 
inner join roles_employee
	on roles.id=roles_employee.role_id
inner join employees
	on employees.id=roles_employee.employee_id
order by role_name asc;

-- 7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name 
from roles
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Java_developer%'
order by role_name asc;

-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name 
from roles
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Python_developer%'
order by role_name asc;

-- 9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name 
from roles right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%QA%'
order by role_name asc;
-- 10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name 
from roles 
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Manual_QA%'
order by role_name asc;
-- 11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name 
from roles 
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Automation_QA%'
order by role_name asc;

-- 12. ������� ����� � �������� Junior ������������
select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id
where role_name like '%Junior%'
order by salary asc;

-- 13. ������� ����� � �������� Middle ������������
select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id  
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Middle%'
order by salary asc;

-- 14. ������� ����� � �������� Senior ������������
select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id =roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Senior%'
order by salary asc;

-- 15. ������� �������� Java �������������
select monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id =roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Java_developer%'
order by salary asc;

-- 16. ������� �������� Python �������������
select monthly_salary, role_name 
from employee_salary es 
join salary s 
	on s.id=es.salary_id 
join roles_employee re 
	on re.employee_id=es.employee_id 
join roles r 
	on r.id=re.role_id 
where role_name like '%Python%'
order by monthly_salary asc;

-- 17. ������� ����� � �������� Junior Python �������������
select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id  
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Junior_Python_developer%'
order by salary asc;

select employee_name, monthly_salary, role_name 
from employee_salary es 
join salary s 
	on s.id=es.salary_id 
join roles_employee re 
	on re.employee_id=es.employee_id 
join roles r 
	on r.id=re.role_id
join employees e 
	on e.id=re.employee_id 
where role_name like '%Junior_Python_developer%'
order by monthly_salary asc;

-- 18. ������� ����� � �������� Middle JS �������������
select employee_name , monthly_salary, role_name 
from employee_salary es 
join salary s 
	on s.id=es.salary_id 
join roles_employee re 
	on re.employee_id=es.employee_id 
join roles r 
	on r.id=re.role_id 
join employees e 
	on e.id=es.employee_id 
where role_name like 'Middle_JavaScript%'
order by monthly_salary asc;

select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id  
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id  
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Middle_JavaScript_developer%'
order by salary asc;

-- 19. ������� ����� � �������� Senior Java �������������
select employee_name , monthly_salary, role_name 
from employee_salary es 
join salary s 
	on s.id=es.salary_id 
join roles_employee re 
	on re.employee_id=es.employee_id 
join roles r 
	on r.id=re.role_id 
join employees e 
	on e.id=es.employee_id 
where role_name like 'Senior_Java_d%'
order by monthly_salary asc;

select employee_name, monthly_salary, role_name 
from roles_employee 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id  
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id  
join salary
	on salary.id=employee_salary.salary_id 
where role_name like '%Senior_Java_developer%'
order by monthly_salary asc;

-- 20. ������� �������� Junior QA ���������
select monthly_salary, role_name 
from roles_employee
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id 
join salary
	on salary.id=employee_salary.salary_id 
join roles
	on roles.id=roles_employee.role_id 
where role_name like '%Junior%QA%'
order by monthly_salary asc;

-- 21. ������� ������� �������� ���� Junior ������������
--�� � ��������� �� ����������
select role_name, avg(monthly_salary) as avg_salary_junior 
from roles_employee re 
join employee_salary es 
	on es.employee_id=re.employee_id
join roles r 
	on r.id=re.role_id 
join salary s 
	on s.id=es.salary_id 
join employees e 
	on e.id=re.employee_id 
where role_name like '%Junior%'
group by r.role_name;

--����� ����� ��� �������� �� ����������
select avg(monthly_salary) 
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%Junior%';

-- 22. ������� ����� ������� JS �������������
--����� ����� �� JS ������������� �� ������ �������
select role_name, sum(monthly_salary)
from roles_employee re 
join employee_salary es 
	on es.employee_id=re.employee_id
join roles r 
	on r.id=re.role_id 
join salary s 
	on s.id=es.salary_id 
join employees e 
	on e.id=re.employee_id  
where role_name like '%JavaScript%'
group by r.role_name;

--����� ����� ����� �� js �������������
select sum(monthly_salary) 
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%JavaScript%';

-- 23. ������� ����������� �� QA ���������
select min(monthly_salary), role_name 
from roles_employee re 
join employee_salary es 
	on es.employee_id=re.employee_id
join roles r 
	on r.id=re.role_id 
join salary s 
	on s.id=es.salary_id 
join employees e 
	on e.id=re.employee_id  
where role_name like '%QA%'
group by r.role_name; 

select min(monthly_salary) as min_salary_qa
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%QA%';

-- 24. ������� ������������ �� QA ���������
select max(monthly_salary), role_name 
from roles_employee re 
join employee_salary es 
	on es.employee_id=re.employee_id
join roles r 
	on r.id=re.role_id 
join salary s 
	on s.id=es.salary_id 
join employees e 
	on e.id=re.employee_id  
where role_name like '%QA%'
group by r.role_name; 

select max(monthly_salary) as max_salary_qa
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%QA%';
-- 25. ������� ���������� QA ���������
select count(role_name) as count_qa
from roles
join roles_employee
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like '%QA%';

select role_name, count(role_name) as count_qa
from roles_employee
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like '%QA%'
group by role_name
order by count_qa asc;

-- 26. ������� ���������� Middle ������������.
select count(role_name) as count_middle
from roles
join roles_employee
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like 'Middle%';

select role_name, count(role_name) as count_qa
from roles_employee
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like 'Middle%'
group by role_name
order by count_qa asc;

-- 27. ������� ���������� �������������
select count(role_name) as count_dev
from roles
join roles_employee
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like '%developer%';

select role_name, count(role_name) as count_qa
from roles_employee
join roles
	on roles.id=roles_employee.role_id 
join employees
	on employees.id=roles_employee.employee_id 
where role_name like '%developer%'
group by role_name
order by count_qa asc;
--28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary) 
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%developer%';

select role_name, sum(monthly_salary)
from roles_employee re 
join employee_salary es 
	on es.employee_id=re.employee_id
join roles r 
	on r.id=re.role_id 
join salary s 
	on s.id=es.salary_id 
join employees e 
	on e.id=re.employee_id  
where role_name like '%developer%'
group by r.role_name;

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name, role_name, monthly_salary 
from roles_employee
full join employees
	on employees.id=roles_employee.employee_id 
full join roles
	on roles.id=roles_employee.role_id 
full join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id 
full join salary 
	on salary.id=employee_salary.salary_id
order by employee_name asc;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary 
from roles_employee
join employees
	on employees.id=roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employee_salary
	on employee_salary.employee_id =roles_employee.employee_id 
join salary 
	on salary.id=employee_salary.salary_id
where monthly_salary >= 1700 and monthly_salary <= 2300
order by monthly_salary;

select employee_name, role_name, monthly_salary 
from roles_employee
join employees
	on employees.id=roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employee_salary
 on employee_salary.employee_id=roles_employee.employee_id 
join salary 
	on salary.id=employee_salary.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name, role_name, monthly_salary 
from roles_employee
join employees
	on employees.id=roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id 
join salary 
	on salary.id=employee_salary.salary_id
where monthly_salary < 2300
order by monthly_salary asc;


-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary 
from roles_employee
join employees
	on employees.id=roles_employee.employee_id 
join roles
	on roles.id=roles_employee.role_id 
join employee_salary
	on employee_salary.employee_id=roles_employee.employee_id 
join salary 
	on salary.id=employee_salary.salary_id
where monthly_salary in(1100,1500,200)
order by monthly_salary;