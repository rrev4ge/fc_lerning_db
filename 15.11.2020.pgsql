SELECT fruit_a FROM basket_a
INTERSECT
SELECT fruit_b FROM basket_b;

SELECT fruit_a FROM basket_a
EXCEPT
SELECT fruit_b FROM basket_b;

SELECT fruit_a FROM basket_b
EXCEPT
SELECT fruit_b FROM basket_a;

SELECT fruit_a FROM basket_b
UNION
SELECT fruit_b FROM basket_a;

-- Определить, какие клиенты делали заказы 

SELECT u.first_name, u.last_name FROM 
users u INNER JOIN orders o ON u.id=o.id_user
GROUP BY u.id;

SELECT u.first_name, u.last_name
FROM users u
WHERE u.id IN (SELECT id FROM users
INTERSECT
SELECT id_user FROM orders);

SELECT u.first_name, u.last_name
FROM users u
WHERE EXISTS (SELECT * FROM orders o WHERE o.id_user=u.id)

-- Определить, какие клиенты не делали заказов 

SELECT u.id, u.first_name, u.last_name
FROM users u
WHERE u.id NOT IN (SELECT id FROM users
INTERSECT
SELECT id_user FROM orders);

SELECT u.first_name, u.last_name FROM 
users u LEFT JOIN orders o ON u.id=o.id_user
WHERE o.id IS NULL

SELECT u.first_name, u.last_name
FROM users u
WHERE NOT EXISTS (SELECT * FROM orders o WHERE o.id_user=u.id)

-- Определить, какие телефоны ни разу не заказывали
-- Определить, какие телефоны заказывались хоть раз

-- Определить, какое количество телефонов купил каждый покупатель

SELECT u.first_name, u.last_name, sum(ptoo.quantity)
FROM users u JOIN orders o ON u.id=o.id_user JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
GROUP BY u.id

-- Определить суммарную стоимость каждого заказа
-- в телеге от Евгения

-- Определить, сколько потратил каждый покупатель на покупки телефонов

SELECT u.first_name||' '||u.last_name, sum(p.price*ptoo.quantity)
FROM users u JOIN orders o ON u.id=o.id_user 
  JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
  JOIN phones p ON ptoo.id_phone=p.id
  GROUP BY u.id

-- Определить, какие покупатели купили телефоны марки 'IPhone'

SELECT u.first_name||' '||u.last_name AS "user name"
FROM users u JOIN orders o ON u.id=o.id_user 
  JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
  JOIN phones p ON ptoo.id_phone=p.id
  WHERE p.brand='Samsung'
GROUP BY u.id  


-- Определить, кто купил меньше телефонов, чем Test Testovich

SELECT u.first_name||' '||u.last_name AS "user name"
FROM users u JOIN orders o ON u.id=o.id_user 
  JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
GROUP BY u.id
HAVING sum(ptoo.quantity)<(
        SELECT sum(ptoo.quantity)
      FROM users u JOIN orders o ON u.id=o.id_user 
        JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
      WHERE u.first_name = 'Test' AND u.last_name = 'Testovich'
)

-- Определить, кто купил больше телефонов, чем любой из клиентов, купивших телефоны марки 'Samsung'

SELECT u.first_name||' '||u.last_name AS "user name"
FROM users u JOIN orders o ON u.id=o.id_user 
  JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
GROUP BY u.id
HAVING sum(ptoo.quantity)< ALL(SELECT sum(ptoo.quantity)
      FROM users u JOIN orders o ON u.id=o.id_user 
          JOIN phones_to_orders ptoo ON o.id=ptoo.id_order  
          JOIN phones p ON ptoo.id_phone=p.id
      WHERE u.id IN (  SELECT u.id
              FROM users u JOIN orders o ON u.id=o.id_user 
                JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
                JOIN phones p ON ptoo.id_phone=p.id
              WHERE p.brand='Samsung')
      GROUP BY u.id)


-- Определить, количество заказов в каждом месяце

-- Определить, на какую сумму были сделаны заказы в разные годы

-- Вывести, каким оператором мобильной связи пользуются клиенты, покупавшие IPhone 

-- *Определить, в каком месяце продажи были лучше, чем в декабре
-- *Определить, в каком месяце продажи были лучше, чем в каждый из зимних месяцев
-- *Определить, какой телефон чаще всего присутствовал в заказах


CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  id_user integer NOT NULL REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  created_at timestamp NOT NULL CHECK(created_at <=CURRENT_TIMESTAMP) DEFAULT CURRENT_TIMESTAMP, 
  is_delivered boolean DEFAULT false 
)

CREATE TABLE phones_to_orders(
  id_phone integer REFERENCES phones ON DELETE RESTRICT ON UPDATE CASCADE,
  id_order integer REFERENCES orders(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  quantity integer NOT NULL CHECK(quantity>0),
  PRIMARY KEY(id_phone, id_order)
);

CREATE VIEW joining_tables AS 
SELECT u.first_name, u.last_name, p.brand, p.model FROM users u JOIN orders o ON u.id=o.id_user 
          JOIN phones_to_orders ptoo ON o.id=ptoo.id_order  
          JOIN phones p ON ptoo.id_phone=p.id


SELECT * FROM joining_tables;


CREATE VIEW users_view AS
SELECT * FROM users; 

UPDATE users_view
SET first_name='Test111'
WHERE id=6;


CREATE VIEW users_buy_count AS
SELECT u.first_name, u.last_name, sum(ptoo.quantity)
FROM users u JOIN orders o ON u.id=o.id_user 
JOIN phones_to_orders ptoo ON o.id=ptoo.id_order
GROUP BY u.id

SELECT * FROM users_buy_count

UPDATE users_buy_count
SET first_name='Test333'
WHERE first_name='Test3'