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
SELECT u.first_name, u.last_name, o.created_at, ptoo.quantity
FROM users AS u INNER JOIN orders AS o ON u.id=o.id_user 
JOIN phones_to_orders AS ptoo ON ptoo.id_order=o.id