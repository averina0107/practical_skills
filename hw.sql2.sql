Домашнее задание №5
Тема:SQL
Выполнила:
студентка 26 группы
Тютюнник В.С.
--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.

create table employees(
	id serial primary key,
	employee_name varchar(50) not null 
);

select * from employees;

insert into employees(employee_name)
values ('Linda_Howard'),
	   ('Todd_Brown'),
	   ('Fred_Caldwell'),
	   ('Clarence_Torres'),
	   ('William_Hunt'),
	   ('Amanda_Garcia'),
	   ('Helen_Brewer'),
	   ('Charles_Mack'),
	   ('Joseph_Howard'),
	   ('Juan_Norris'),
	   ('Leah_Vega'),
	   ('Felicia_Lewis'),
	   ('Neil_Davis'),
	   ('Daniel_Banks'),
	   ('Stanley_Adams'),
	   ('Joseph_Riley'),
	   ('Emma_Shelton'),
	   ('Mary_Ford'),
	   ('Mark_Dixon'),
	   ('Michael_Clark'),
	   ('Sandra_Williams'),
	   ('Angela_Wright'),
	   ('David_Webb'),
	   ('Patrick_Goodwin'),
	   ('Sue_Gordon'),
	   ('Travis_King'),
	   ('Antonio_Hardy'),
	   ('William_Anderson'),
	   ('Joseph_Simon'),
	   ('Evelyn_Walters'),
	   ('Eric_Johnson'),
	   ('Michael_Morgan'),
	   ('Charles_Austin'),
	   ('Violet_Sanders'),
	   ('Jaime_Moore'),
	   ('David_Watson'),
	   ('Marjorie_Hawkins'),
	   ('Betty_Taylor'),
	   ('Monica_Williams'),
	   ('Jenny_Bass'),
	   ('Denise_Miller'),
	   ('Sarah_Evans'),
	   ('Gary_Hunter'),
	   ('Marvin_Harris'),
	   ('Gertrude_Dixon'),
	   ('Glenda_Glover'),
	   ('Stacey_Murray'),
	   ('Mary_Blake'),
	   ('Bob_Watson'),
	   ('Raymond_Reynolds'),
	   ('Edward_Ryan'),
	   ('Mary_Berry'),
	   ('Betty_Joseph'),
	   ('Bernice_Stewart'),
	   ('Thomas_Stephens'),
	   ('Robert_Thomas'),
	   ('Rebecca_Green'),
	   ('Nicholas_Reese'),
	   ('Louise_Garrett'),
	   ('Eva_Bennett'),
	   ('Guy_Zimmerman'),
	   ('Patricia_Gonzales'),
	   ('Reginald_Martinez'),
	   ('Daniel_Hart'),
	   ('Jimmy_Meyer'),
	   ('Christy_Coleman'),
	   ('Luis_Hampton'),
	   ('Charlotte_Moore'),
	   ('Elizabeth_Burns'),
       ('Rita_Taylor');
       
select * from employees;

--Таблица salary
--
--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:

create table salary(
	id serial primary key,
	monthly_salary int not null
);


select * from salary;

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

	  
	select * from salary;

--Таблица employee_salary
--
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);


select * from employee_salary;
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id,salary_id)
values	(1, 12),
        (3, 15),
        (2, 9),
        (5, 1),
        (4, 10),
        (52, 4),
        (19, 8),
        (11, 14),
        (7, 3),
        (8, 2),
        (10, 11),
        (21, 4),
        (29, 6),
        (6, 13),
        (25, 7),
        (20, 5),
        (13, 9),
        (57, 3),
        (17, 12),
        (28, 2),
        (9, 4),
        (71, 13),
        (26, 6),
        (84, 11),
        (22, 1),
        (81, 5),
        (15, 14),
        (105, 13),
        (27, 12),
        (77, 7),
        (12, 15),
        (69, 6),
        (24, 8),
        (30, 3),
        (80, 1),
        (190, 7),
        (16, 4),
        (23, 13),
        (18, 6),
        (14, 11);
	
select * from employee_salary;


--Таблица roles
--
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int unique not null
);

select * from roles;

--Поменять тип столба role_name с int на varchar(30)

alter table roles --изменить тип данных у столбца
alter column role_name type varchar(30) using role_name::varchar(30);

select * from roles;

--Наполнить таблицу roles 20 строками

insert into roles(role_name)
values ('Junior_Python_developer'),
	   ('Middle_Python_developer'),
	   ('Senior_Python_developer'),
	   ('Junior_Java_developer'),
	   ('Middle_Java_developer'),
	   ('Senior_Java_developer'),
	   ('Junior_JavaScript_developer'),
	   ('Middle_JavaScript_developer'),
	   ('Senior_JavaScript_developer'),
	   ('Junior_Manual_QA_engineer'),
	   ('Middle_Manual_QA_engineer'),
	   ('Senior_Manual_QA_engineer'),
	   ('Project_Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales_manager'),
	   ('Junior_Automation_QA_engineer'),
	   ('Middle_Automation_QA_engineer'),
	   ('Senior_Automation_QA_engineer');

select * from roles;

--Таблица roles_employee
--
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roless, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
		foreign key (employee_id)
		references employees(id),
		foreign key (role_id)
		references roles(id)
);

select * from roles_employee;

--Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id,role_id)
values (1, 15),
	   (3, 13),
	   (5, 1),
	   (7, 3),
	   (9, 6),
	   (11, 7),
	   (14, 10),
	   (17, 9),
	   (20, 2),
	   (23, 4),
	   (26, 6),
	   (29, 11),
	   (32, 8),
	   (35, 9),
	   (38, 14),
	   (2, 1),
	   (4, 3),
	   (6, 4),
	   (8, 8),
	   (10, 9),
	   (12, 14),
	   (40, 12),
	   (16, 2),
	   (18, 4),
	   (21, 5),
	   (24, 8),
	   (27, 11),
	   (30, 1),
	   (33, 3),
	   (36, 5),
	   (39, 7),
	   (13, 10),
	   (15, 12),
	   (19, 13),
	   (22, 15),
	   (25, 2),
	   (28, 5),
	   (31, 6),
	   (34, 7),
	   (37, 10);
	  
select * from roles_employee;
			   
