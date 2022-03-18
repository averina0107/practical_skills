Домашнее задание №6
Тема:SQL
Выполнила:
студентка 26 группы
Тютюнник В.С.

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary
from 
employees inner join employee_salary
	on employees.id=employee_salary.employee_id
inner join salary 
	on salary.id=employee_salary.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary 
from employees 
join employee_salary
	on employees.id=employee_salary.employee_id
join salary
	on salary.id=employee_salary.salary_id 
where monthly_salary < 2000
order by monthly_salary asc;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary
from salary 
left join employee_salary
	on salary.id=employee_salary.salary_id
left join employees
	on employees.id=employee_salary.employee_id 
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_name
from salary 
right join employee_salary
	on salary.id=employee_salary.salary_id
left join employees
	on employees.id=employee_salary.employee_id
where employee_name is null and monthly_salary<2000
order by monthly_salary asc;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary 
from salary 
left join employee_salary
	on salary.id=employee_salary.salary_id
right join employees
	on employee_salary.employee_id=employees.id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name 
from roles 
inner join roles_employee
	on roles.id=roles_employee.role_id
inner join employees
	on employees.id=roles_employee.employee_id
order by role_name asc;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name 
from roles
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Java_developer%'
order by role_name asc;

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name 
from roles
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Python_developer%'
order by role_name asc;

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name 
from roles right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%QA%'
order by role_name asc;
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name 
from roles 
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Manual_QA%'
order by role_name asc;
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name 
from roles 
right join roles_employee
	on roles.id=roles_employee.role_id
left join employees
	on employees.id=roles_employee.employee_id
where role_name like '%Automation_QA%'
order by role_name asc;

-- 12. Вывести имена и зарплаты Junior специалистов
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

-- 13. Вывести имена и зарплаты Middle специалистов
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

-- 14. Вывести имена и зарплаты Senior специалистов
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

-- 15. Вывести зарплаты Java разработчиков
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

-- 16. Вывести зарплаты Python разработчиков
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

-- 17. Вывести имена и зарплаты Junior Python разработчиков
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

-- 18. Вывести имена и зарплаты Middle JS разработчиков
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

-- 19. Вывести имена и зарплаты Senior Java разработчиков
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

-- 20. Вывести зарплаты Junior QA инженеров
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

-- 21. Вывести среднюю зарплату всех Junior специалистов
--зп с разбивкой по категориям
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

--общая сумма без разбивки по категориям
select avg(monthly_salary) 
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
--вывод суммы по JS разработчикам по каждой ступени
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

--вывод общей суммы по js разработчикам
select sum(monthly_salary) 
from roles_employee re
join employee_salary es 
	on es.employee_id=re.employee_id 
join roles r
	on r.id=re.role_id
join salary s 
	on s.id=es.salary_id 
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
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

-- 24. Вывести максимальную ЗП QA инженеров
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
-- 25. Вывести количество QA инженеров
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

-- 26. Вывести количество Middle специалистов.
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

-- 27. Вывести количество разработчиков
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
--28. Вывести фонд (сумму) зарплаты разработчиков.
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

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
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

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
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

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
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


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
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