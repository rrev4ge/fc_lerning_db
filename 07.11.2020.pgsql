-- DDL: CREATE DROP

INSERT INTO users(first_name, last_name, email, birthday, address, phone_number)
VALUES ('Test', 'Testovich', 'test@test.test', '2001-01-01', 'Test street, 13/13', '0999999999'),
       ('Test2', 'Testovich2', NULL, '2001-01-01', 'Test street, 13/14', '0999999998');

SELECT * FROM users;       

CREATE TABLE phones( id serial PRIMARY KEY,
  brand varchar(20) NOT NULL,
  model varchar(20) NOT NULL,
  price numeric(7,2) NOT NULL CHECK(price>=0),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp,
  UNIQUE (brand, model)
);

INSERT INTO phones(brand, model, price)
VALUES ('IPhone', 'XXX', 0.44);

INSERT INTO phones(brand, model, price)
VALUES ('IPhone', 'XXX', 1.44);

INSERT INTO phones(brand, model, price)
VALUES ('IPhone', 'XXX1', 3.44);

INSERT INTO phones(brand, model, price)
VALUES ('IPhone', 'XXX2', 8.44);

INSERT INTO phones(brand, model, price)
VALUES ('IPhone', 'XAX4', 5.44);

-- DQL: SELECT

-- Пагинация LIMIT OFFSET

SELECT * FROM users
LIMIT 2 -- сколько отобразить
OFFSET 2; -- сколько пропустить

INSERT INTO users(first_name, last_name, email, birthday, address, phone_number)
VALUES ('Test3', 'Testovich', 'test3@test.test', '2001-01-01', 'Test street, 13/13', '0999999999'),
       ('Test4', 'Testovich2', NULL, '2001-01-01', 'Test street, 13/14', '0999999998');

-- Проекция
SELECT  first_name, last_name FROM users;  

-- Перееменование заголовков столбцов в результате запроса на выборку
SELECT  first_name AS name, last_name AS surname FROM users; 

-- Упорядочивание ORDER BY (ASC, DESC)

SELECT * FROM phones
ORDER BY price DESC, model;

SELECT * FROM phones
ORDER BY price
LIMIT 1;

SELECT * FROM phones
ORDER BY model;

-- DISTINCT

SELECT DISTINCT address FROM users;


SELECT * FROM phones WHERE model LIKE 'X%X%';

SELECT * FROM users


CREATE TABLE employees (
  id serial PRIMARY KEY,
  email varchar(32) UNIQUE NOT NULL,
  gender varchar(6)
)

INSERT INTO employees (email, gender)
VALUES ('test@test.test','male'),
('test2@test.test','male'),
('test2@test.gmail','female');



INSERT INTO users(gender)
VALUES ('male','female', 'indefinite');


ALTER TABLE users ADD COLUMN gender varchar(10) CHECK(gender='male' OR gender='male' OR gender='indefinite');
ALTER TABLE users ADD COLUMN salary numeric CHECK(salary>=0);

