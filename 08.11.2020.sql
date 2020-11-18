-- 1 Найти все различные имена пользователей
-- 2 Найти самого молодого пользователя
-- 3 Отобразить 2 телефона, слудующие за двумя самыми дорогими
-- 1
SELECT DISTINCT
  first_name
FROM
  users;

-- 2
INSERT INTO users (first_name, last_name, email, birthday, address, phone_number)
  VALUES ('Vasia', 'Testovich', 'test8@test.test', '1950-01-01', 'Main street 1/11', '0999999999'),
  ('test11', 'Testovich2', NULL, '2011-01-01', 'Test street, 13/14', '0689999998');

SELECT
  *
FROM
  users
ORDER BY
  birthday DESC
LIMIT 1;

-- 3
SELECT
  *
FROM
  phones
ORDER BY
  price DESC
LIMIT 3 OFFSET 3;

-- WHERE
SELECT
  *
FROM
  phones
WHERE
  price > 4.00;

INSERT INTO phones (brand, model, price)
  VALUES ('Samsung', '7', 2.44);

SELECT
  *
FROM
  phones
WHERE
  price > 4.00
  AND brand = 'Samsung';

SELECT
  *
FROM
  phones
WHERE
  5.44 <> price;

-- 4<=price<=6
SELECT
  *
FROM
  phones
WHERE
  price >= 4
  AND price <= 6;

SELECT
  *
FROM
  phones
WHERE
  price BETWEEN 4 AND 6;

-- price < 3 OR price > 6
SELECT
  *
FROM
  phones
WHERE
  price NOT BETWEEN 3 AND 6;

-- user 2000-01-01 2005-01-01
SELECT
  *
FROM
  users
WHERE
  birthday BETWEEN '2000-01-01'
  AND '2005-01-01';

-- LIKE
-- % 0..n
-- _ 1

SELECT *
FROM
  users
WHERE
  first_name LIKE 't%';

SELECT date '2020-11-08'+6;  

SELECT date '2020-11-08'+interval '1 hour';  

SELECT interval '1 month';  

SELECT age(date '2010-11-08');

SELECT last_name||' '||first_name AS "Full name", age(birthday) AS "User age" FROM users
ORDER BY "Full name";

-- 1 Отобразить все телефоны марки, название которой начинается на Х и содержит в себе еще Х 

SELECT * FROM phones 
WHERE model LIKE 'X%X%';

-- 2 Отобразить всех пользователей, которые родились раньше 2000 года и упорядочить их по фамилии.
-- Если фамилия одинаковая, то по имени

SELECT * FROM users
where birthday<'2000-01-01'
ORDER BY last_name, first_name;

-- 3 Отобразить имя, фамилию и возраст пользователей, имя которых начинается с Т, а фамилия содержит v,
-- упорядоченные по возрасту от младшего к старшему

SELECT first_name, last_name, age(birthday) FROM users
WHERE first_name LIKE 'T%' AND last_name ILIKE '%v%'
ORDER BY birthday DESC;

-- 4 Отобразить всех пользователей, которые родились в 1960 году
SELECT * FROM users
where EXTRACT(YEAR from birthday)=1960;


-- 5 Отобразить 2 самых старших пользователей в возрасте от 15 до 18 лет


-- 6 Отобразить пользователей без email, которые родились в январе

SELECT * FROM users
WHERE email IS NULL AND EXTRACT(MONTH from birthday)=1;

-- 7 Отобразить инфо о телефонах дороже 6 у.е. марки IPhone  или модели 5

SELECT * FROM phones
WHERE price>6 AND (brand = 'IPhone' OR model = '5');

-- Сочетания таблиц UNION, EXCEPT, INTERSECT

CREATE TABLE employees (
  id serial PRIMARY KEY,
  email varchar(32) UNIQUE NOT NULL,
  gender varchar(6)
)

INSERT INTO employees (email, gender)
VALUES ('test@test.test','male'),
('test2@test.test','male'),
('test2@test.gmail','female');

SELECT email FROM users
INTERSECT
SELECT email FROM employees;

SELECT email FROM users
UNION
SELECT email FROM employees;

SELECT email FROM employees
EXCEPT
SELECT email FROM users;

-- Агрегатные функции, группировка

SELECT count(*) FROM users;

SELECT avg(price) FROM phones
WHERE brand='IPhone';

SELECT * FROM phones
ORDER BY brand;

SELECT brand, avg(price) FROM phones
GROUP BY brand;

-- Добавить столбец
ALTER TABLE phones ADD COLUMN pcount integer CHECK (pcount >=0);
ALTER TABLE phones ALTER COLUMN pcount SET DEFAULT 0;

UPDATE phones SET pcount=5;

UPDATE phones SET pcount=10
WHERE id=4;

-- count, sum, avg, min, max

SELECT brand, sum(pcount) FROM phones
GROUP BY brand;

SELECT brand, model, price*pcount AS "Total price" FROM phones;

-- 1 Отобразить суммарную стоимость товара каждой марки 
SELECT brand, sum(price*pcount)
FROM phones
GROUP BY brand;

SELECT brand, sum(price*pcount)
FROM phones
WHERE price>5
GROUP BY brand;


SELECT brand, sum(pcount) FROM phones
GROUP BY brand
HAVING sum(pcount)>20;

-- 1 Добавить юзерам пол и зарплату
-- 2 Заполнить из данными 
-- 3 Посчитать среднюю зарплату для мужчин и женщин

SELECT gender, avg(salary) FROM users
WHERE gender<>'unknown'
GROUP BY gender;

-- 4 Посчитать максимальную зарлату для юзеров с почтой Гугл

SELECT max(salary) FROM users
WHERE email LIKE '%@gmail.com';

-- 5 Посчитать количество юзеров

SELECT count(*) FROM users;

-- 6 Посчитать количество женщин, мужчин и без явного указания пола

-- 7 Вывести минимальную зарплату срежи мужчин и женщин, рожденных до 2002 года
-- 8 Вывести минимальную зарплату для людей, рожденных в разные годы, при условии, 
-- что эта минимальная зарплата больше 5000, а люди пользуются услугами оператора Водафон
SELECT EXTRACT(YEAR from birthday) AS year, min(salary) FROM users
WHERE phone_number LIKE '099%'
GROUP BY year
HAVING min(salary)>5000;


ALTER TABLE users ADD COLUMN gender varchar(7) CHECK(gender='male' OR gender='female' OR gender='unknown');
ALTER TABLE users ADD COLUMN salary numeric CHECK(salary>=0);
UPDATE users SET gender = 'unknown' WHERE id=6;
UPDATE users SET salary = 12000 WHERE id<8 ;


CREATE TABLE test (
  id serial PRIMARY KEY,
  avg_mark real
);

INSERT INTO test (avg_mark)
  VALUES (3.5), (4.5), (NULL);

SELECT
  avg(avg_mark)::numeric(2, 1)
FROM
  test;

SELECT
  to_char(avg(avg_mark), '9D9')
FROM
  test;

--3.5..5.0
--WHERE
--GROUP BY + агрегатные ф-и
-- мат 4,5
-- фил 4,0
-- фв  3,5
--HAVING условие на группу
ORDER BY
  birthday,
  last_name CREATE TABLE students (
    id serial PRIMARY KEY,
    is_male boolean)
INSERT INTO students (
  is_male)
  VALUES (
    TRUE), (
    FALSE), (
    NULL
);

SELECT
  *
FROM
  students;

-- CASE
SELECT
  CASE WHEN is_male IS TRUE THEN
    'male'
  WHEN is_male IS FALSE THEN
    'female'
  ELSE
    'unknown'
  END AS gender
FROM
  students;

SELECT
  CASE is_male
  WHEN TRUE THEN
    'male'
  WHEN FALSE THEN
    'female'
  ELSE
    'unknown'
  END AS gender
FROM
  students;

--COALESCE
SELECT
  COALESCE(avg_mark, 2.0)
FROM
  test;

--NULLIF
--GREATEST, LAEST
CREATE TABLE tasks (
  id serial PRIMARY KEY,
  deadline date
);

INSERT INTO tasks (deadline)
  VALUES ('2018/01/01'), ('2020/11/14'), ('2022/01/01');

SELECT
  *
FROM
  tasks;

-- EXPIRED, TODAY, FUN) YOU HAVE SOME TIME
SELECT
  id,
  CASE WHEN deadline < CURRENT_DATE THEN
    'EXPIRED'
  WHEN deadline = CURRENT_DATE THEN
    'TODAY'
  ELSE
    'FUN) YOU HAVE '||make_interval(0,0,0,deadline-CURRENT_DATE)
  END
FROM
  tasks;

-- Подзапросы (скалярные)

SELECT * FROM phones
WHERE price > (
  SELECT avg(price) FROM phones
  )
  
  -- Вывести телефоны, которых продано больше, чем IPhone XAX4
SELECT * FROM phones
WHERE pcount>(
  SELECT pcount FROM phones
  WHERE brand='IPhone' AND model='XAX4'
)


-- отобразить тел с ценой 2,44 3,44 8,44
SELECT * FROM phones
WHERE price IN (2.44, 3.44, 8.44)

-- stud m:n subject
-- phones m:n orders
-- users 1:m orders

-- campus 1:1 great_admin
-- CAMPUSES(id, address, admin_name, admin_tel)

CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  id_user integer NOT NULL REFERENCES users(id),
  created_at timestamp NOT NULL CHECK(created_at <=CURRENT_TIMESTAMP) DEFAULT CURRENT_TIMESTAMP, 
  is_delivered boolean DEFAULT false 
)
SELECT * from users;

INSERT INTO orders(id_user, created_at)
VALUES (1, '2020/11/01'),
        (2, '2020/10/01'),
        (3, '2019/08/01'),
        (1, '2019/01/01');

CREATE TABLE phones_to_orders(
  id_phone integer REFERENCES phones,
  id_order integer REFERENCES orders(id),
  quantity integer NOT NULL CHECK(quantity>0),
  PRIMARY KEY(id_phone, id_order)
);

INSERT INTO phones_to_orders(id_order, id_phone, quantity)
VALUES (1, 2, 3), (1,4, 1), (2, 6, 2),(3,5,2), (4,10,3);

--users 1,2,3
--orders (1,1), (2,1), (3,4)

--phones(1,2,3)
--orders(7,8,9)
--phones_to_orders(1,9),(1,8),(2,7)
-- phones 1:m phones_to_orders n:1 orders

drop table phohes_to_orders

--student m:n subject
--student m:1 campus

DROP TABLE students;

CREATE TABLE campus(
  id serial PRIMARY KEY,
  address text
)

-- Если связь 1:m, то зависимая таблица ссылается на главную
CREATE TABLE students(
  id serial PRIMARY KEY,
  id_campus INTEGER REFERENCES campus
)

-- Если m:n, то появляется дополнительная таблица, которая
-- ссылается на две другие

CREATE TABLE subjects(
  id serial PRIMARY KEY,
  caption varchar(60)
)

CREATE TABLE subjects_to_students(
  id_student integer REFERENCES students,
  id_subject integer REFERENCES subjects,
  PRIMARY KEY(id_student, id_subject)
)

SELECT * FROM orders;

SELECT u.first_name, u.last_name, count(o.id)
FROM users AS u, orders AS o
WHERE u.id=o.id_user
GROUP BY u.id;


SELECT id_user, count(*)
From orders
GROUP BY id_user

SELECT u.first_name, u.last_name, o.created_at
FROM users AS u, orders AS o
WHERE u.id=o.id_user;

-- INNER JOIN (JOIN)

SELECT u.first_name, u.last_name, o.created_at, ptoo.quantity FROM users AS u INNER JOIN orders AS o ON u.id=o.id_user JOIN phones_to_orders AS ptoo ON ptoo.id_order=o.id


SELECT u.first_name||' '||u.last_name as User, sum(p.price * ptoo.quantity) 
FROM  users u JOIN orders o ON u.id=o.id_user
  JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
  JOIN phones p on ptoo.id_phone=p.id
GROUP BY u.id