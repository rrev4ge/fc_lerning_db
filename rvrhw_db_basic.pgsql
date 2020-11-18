-- ДЗ с 08.11.2020 на 13.11.2020

-- Создать базу данных и таблицы по следующим схемам (название таблицы приведено сверху по центру и выделено жирным):

-- Students - название таблицы

-- id
-- first_name
-- last_name
-- birthday
-- phone_number
-- group – шифр группы
-- avg_mark – средний балл
-- gender 
-- entered_at – год поступления
-- department - название факультета


-- Продумать типы данных и ограничения для указанных полей
-- Заполнить таблицы тестовыми данными.


CREATE DATABASE rvr_home_work_db;

DROP TABLE students;

CREATE TABLE Students ( 
    id SERIAL PRIMARY KEY, 
    first_name varchar(32) DEFAULT NULL,
    last_name varchar(32) DEFAULT NULL,
    birthday date CHECK(birthday <= CURRENT_DATE),
    phone_number varchar(10),
    "group" varchar(10) DEFAULT NULL,
    avg_mark numeric(2,1) CHECK(avg_mark<=5.0 AND avg_mark>=2.0),
    gender varchar(10) CHECK(gender='male' OR gender='female' OR gender='indefinite'),
    entered_at date CHECK(entered_at <= CURRENT_DATE),
    department varchar(10) DEFAULT NULL
    );


INSERT INTO Students(first_name,last_name,birthday,phone_number,"group",avg_mark,gender,entered_at,department) VALUES ('Ciara','Jacobs','1992-12-20','0502369509','RPF-01','05.0','male','2020-09-01','RPF'),('Judah','Tyler','1992-06-29','0508103940','RPF-01','04.7','male','2018-09-01','RPF'),('Hedy','Hogan','1997-09-10','0675829536','RPF-01','03.6','male','2019-09-01','RPF'),('Hop','Montoya','1999-05-26','0503373906','EF-01','03.2','female','2015-09-01','EF'),('Norman','Pickett','1995-01-25','0678557729','EF-01','04.2','female','2014-09-01','EF'),('Clayton','Carson','1995-11-25','0675632786','EF-01','03.8','female','2012-09-01','EF'),('Jesse','Clay','1999-09-25','0679320275','ETF-01','04.8','indefinite','2012-09-01','ETF'),('Vielka','Crosby','1998-03-16','0507026394','ETF-01','04.5','indefinite','2016-09-01','ETF'),('Nina','Lynn','1995-11-25','0679414263','ETF-01','04.1','indefinite','2020-09-01','ETF'),('Aurora','Duran','1996-10-19','0679752960','FF-01','04.1','male','2011-09-01','FF'),('Ignatius','Glenn','1994-12-05','0679956427','FF-01','04.2','male','2011-09-01','FF'),('Zahir','Jackson','1997-11-21','0508020682','FF-01','03.8','male','2014-09-01','FF'),('Cole','Hayes','1999-07-10','0672405536','OTF-01','04.3','female','2013-09-01','OTF'),('Salvador','Graves','1997-01-26','0507702837','OTF-01','04.1','female','2015-09-01','OTF'),('Hilel','Sanford','1996-01-07','0679902138','OTF-01','04.8','female','2016-09-01','OTF'),('Kelly','Burnett','1991-10-10','0506734773','RPF-02','03.1','indefinite','2017-09-01','RPF'),('Lareina','Le','1999-02-15','0677323478','RPF-02','04.1','indefinite','2015-09-01','RPF'),('Jillian','Horton','1994-08-15','0678184043','RPF-02','04.1','indefinite','2019-09-01','RPF'),('Charissa','King','1993-03-21','0501675868','EF-02','03.2','male','2016-09-01','EF'),('Sydnee','Carpenter','1995-07-13','0505680837','EF-02','04.9','male','2014-09-01','EF'),('Timon','Sparks','1994-02-02','0502448554','EF-02','03.2','male','2018-09-01','EF'),('Cairo','Cantu','1997-05-04','0676746308','ETF-02','04.7','female','2015-09-01','ETF'),('Valentine','Young','1991-04-06','0507243614','ETF-02','04.8','female','2016-09-01','ETF'),('Glenna','Maynard','1994-07-15','0679354073','ETF-02','04.8','female','2015-09-01','ETF'),('Kaseem','Gamble','1991-05-20','0509709276','FF-02','04.5','indefinite','2015-09-01','FF'),('Callie','Barnes','1991-09-11','0674481197','FF-02','03.9','indefinite','2012-09-01','FF'),('Aurelia','Byrd','1997-04-25','0509565346','FF-02','03.3','indefinite','2015-09-01','FF'),('Mason','Adams','1996-12-20','0679492287','OTF-02','04.4','male','2011-09-01','OTF'),('Jescie','Contreras','1998-09-20','0674973934','OTF-02','03.1','male','2011-09-01','OTF'),('Akeem','Beasley','1993-09-02','0672615504','OTF-02','04.7','male','2011-09-01','OTF'),('Ivan','Nash','1996-01-19','0508966789','RPF-03','04.7','female','2016-09-01','RPF'),('Tyler','Harrington','1997-09-30','0508964225','RPF-03','04.5','female','2014-09-01','RPF'),('Chloe','Hobbs','1997-04-11','0509011303','RPF-03','04.2','female','2010-09-01','RPF'),('Malik','Rollins','1997-04-22','0672129644','EF-03','04.6','indefinite','2018-09-01','EF'),('Noelle','Reeves','1998-07-04','0671116760','EF-03','03.3','indefinite','2018-09-01','EF'),('Emery','Leach','1991-04-25','0503984162','EF-03','04.2','indefinite','2013-09-01','EF'),('Zahir','Greene','1993-12-21','0507502652','ETF-03','04.1','male','2016-09-01','ETF'),('Sean','Nicholson','1996-08-12','0678804864','ETF-03','03.4','male','2011-09-01','ETF'),('Beau','Nelson','1993-01-19','0674260126','ETF-03','03.9','male','2013-09-01','ETF'),('Jorden','Brooks','1997-05-20','0677267274','FF-03','04.7','female','2014-09-01','FF'),('Samson','Weeks','1993-12-30','0679972755','FF-03','05.0','female','2017-09-01','FF'),('Jerome','Wynn','1995-04-09','0501259993','FF-03','03.8','female','2016-09-01','FF'),('Adara','Hansen','1993-11-17','0675982627','OTF-03','03.6','indefinite','2020-09-01','OTF'),('Austin','Lee','1991-11-04','0509238107','OTF-03','04.1','indefinite','2011-09-01','OTF'),('Burke','Brewer','1993-05-31','0502564998','OTF-03','03.7','indefinite','2018-09-01','OTF'),('Aphrodite','Snow','1998-10-21','0679671958','RPF-04','03.4','male','2011-09-01','RPF'),('Burton','Rodriguez','1998-11-05','0674524806','RPF-04','03.8','male','2015-09-01','RPF'),('Jeanette','Cohen','1995-11-11','0504024038','RPF-04','03.9','male','2011-09-01','RPF'),('Molly','Jacobs','1999-12-27','0679485441','EF-04','04.3','female','2013-09-01','EF'),('Rashad','Fitzgerald','1998-03-28','0672460530','EF-04','03.6','female','2015-09-01','EF'),('Alfonso','Morin','1999-02-26','0671742209','EF-04','04.4','female','2016-09-01','EF'),('Reagan','Merritt','1999-08-21','0676713512','ETF-04','03.6','indefinite','2012-09-01','ETF'),('Larissa','Walters','1995-08-31','0502548214','ETF-04','03.3','indefinite','2010-09-01','ETF'),('Barbara','Watkins','1995-09-22','0679920197','ETF-04','04.6','indefinite','2011-09-01','ETF'),('Rebekah','Coleman','1996-06-13','0509224182','FF-04','04.3','male','2015-09-01','FF'),('Teagan','Ball','1995-07-28','0507482020','FF-04','03.6','male','2019-09-01','FF'),('Octavia','Carpenter','1998-12-06','0679361510','FF-04','04.6','male','2019-09-01','FF'),('Carson','Willis','1993-12-03','0506798644','OTF-04','04.7','female','2011-09-01','OTF'),('Asher','Finch','1991-03-20','0505475496','OTF-04','03.3','female','2016-09-01','OTF'),('McKenzie','Powers','1992-08-14','0509901254','OTF-04','04.6','female','2017-09-01','OTF'),('Slade','Reed','1998-07-09','0671671750','RPF-01','03.7','indefinite','2017-09-01','RPF'),('Sopoline','Stout','1999-07-13','0671615570','RPF-01','04.5','indefinite','2018-09-01','RPF'),('Faith','Burt','1994-06-03','0505666195','RPF-01','03.4','indefinite','2017-09-01','RPF'),('Moses','Cohen','1997-02-02','0507158572','EF-01','03.3','male','2012-09-01','EF'),('Aubrey','Horn','1993-10-14','0671564550','EF-01','04.0','male','2011-09-01','EF'),('Fatima','Sykes','1996-11-19','0673581148','EF-01','03.6','male','2015-09-01','EF'),('Chanda','Dominguez','1996-11-23','0676840967','ETF-01','03.2','female','2015-09-01','ETF'),('Hadassah','Finch','1992-07-23','0674349870','ETF-01','04.5','female','2015-09-01','ETF'),('Brennan','Shaw','1999-10-27','0507895097','ETF-01','04.5','female','2017-09-01','ETF'),('Shad','Britt','1993-12-06','0502047389','FF-01','03.7','indefinite','2017-09-01','FF'),('Irene','Harris','1996-02-09','0676951626','FF-01','04.3','indefinite','2015-09-01','FF'),('Valentine','Greene','1998-06-01','0673651662','FF-01','03.4','indefinite','2015-09-01','FF'),('Aurelia','Mcmahon','1997-11-06','0501612427','OTF-01','05.0','male','2017-09-01','OTF'),('Stuart','Lynch','1998-05-13','0672260966','OTF-01','03.2','male','2013-09-01','OTF'),('Castor','Daugherty','1991-11-14','0504112852','OTF-01','04.9','male','2015-09-01','OTF'),('Erin','Sears','1998-11-30','0507283972','RPF-02','04.2','female','2020-09-01','RPF'),('Ginger','Collier','1992-02-14','0671159574','RPF-02','04.4','female','2011-09-01','RPF'),('Zia','Crawford','1994-05-19','0673874236','RPF-02','03.6','female','2011-09-01','RPF'),('Brendan','Donovan','1995-06-18','0501237022','EF-02','03.3','indefinite','2020-09-01','EF'),('Alice','Morse','1997-05-06','0673997877','EF-02','03.9','indefinite','2013-09-01','EF'),('Jayme','Conner','1994-12-04','0508798516','EF-02','04.8','indefinite','2018-09-01','EF'),('Yvette','Goff','1991-07-04','0675409400','ETF-02','03.5','male','2015-09-01','ETF'),('Brian','Ellison','1991-12-08','0673653576','ETF-02','03.9','male','2013-09-01','ETF'),('Stewart','Kirkland','1999-11-02','0672878259','ETF-02','05.0','male','2013-09-01','ETF'),('Emerald','Sandoval','1993-05-28','0673751937','FF-02','04.1','female','2011-09-01','FF'),('Charles','Livingston','1994-04-26','0502055721','FF-02','04.6','female','2017-09-01','FF'),('Amaya','Powell','1997-08-30','0503280066','FF-02','04.6','female','2019-09-01','FF'),('Damon','Bray','1994-12-15','0501900424','OTF-02','04.1','indefinite','2015-09-01','OTF'),('Yolanda','Curtis','1993-09-26','0678873863','OTF-02','04.6','indefinite','2015-09-01','OTF'),('Jacqueline','Vazquez','1993-05-06','0679956226','OTF-02','04.3','indefinite','2014-09-01','OTF'),('Noel','Castaneda','1998-08-14','0678441296','RPF-03','03.1','male','2017-09-01','RPF'),('Anthony','Rhodes','1998-01-02','0506359083','RPF-03','03.2','male','2017-09-01','RPF'),('Rigel','Blair','1997-11-19','0503292454','RPF-03','04.9','male','2020-09-01','RPF'),('Savannah','Oneil','1997-07-15','0505105439','EF-03','04.6','female','2018-09-01','EF'),('Ryan','Lyons','1992-10-19','0505816278','EF-03','04.3','female','2017-09-01','EF'),('Richard','Underwood','1997-11-25','0504822789','EF-03','03.6','female','2018-09-01','EF'),('Clare','Potter','1998-04-30','0508238238','ETF-03','03.4','indefinite','2013-09-01','ETF'),('Moana','Hudson','1997-05-11','0677441581','ETF-03','04.5','indefinite','2012-09-01','ETF'),('Carissa','Sanchez','1999-07-19','0507239393','ETF-03','03.1','indefinite','2011-09-01','ETF'),('Thane','Pruitt','1991-12-24','0676264418','FF-03','03.8','male','2018-09-01','FF');

-- Реализовать следующие запросы:
-- 1. Отобразить названия факультетов (неповторяющиеся).

SELECT DISTINCT department FROM students;

-- 2. Отобразить студентов, упорядоченных по возрасту от самого молодого к самому старшему.
-- *Если студенты имеют одинаковую дату рождения , то упорядочить их по фамилии по возрастанию.

--(преднамеренно использовал по возрасту для наглядности т.к одинаковых дат не получилось если бы были то использовал ORDER BY birthday DESC))) )

SELECT first_name||' '||last_name||' - '||EXTRACT(YEAR FROM age(birthday)) AS students FROM students
ORDER BY EXTRACT(YEAR FROM age(birthday)) ASC, last_name ASC;


-- 3. Отобразить 4го, 5го и 6го студентов, используя пагинацию.

SELECT * FROM students
LIMIT 3
OFFSET 3;

-- 4. *Отобразить студентов, которые пользуются услугами оператора Киевстар.

SELECT id, first_name, last_name, phone_number FROM students
WHERE phone_number LIKE '067%';

-- 5. Отобразить студентов, родившихся в период с 1990 по 1995 год.

SELECT id, first_name, last_name, birthday FROM students
WHERE EXTRACT(YEAR FROM birthday) >= 1990 AND EXTRACT(YEAR FROM birthday) <= 1995
ORDER BY birthday ASC;

-- 6. Отобразить студентов по имени Mykola со средними баллами больше 4.5.

INSERT INTO Students(first_name,last_name,birthday,phone_number,"group",avg_mark,gender,entered_at,department) VALUES ('Mykola','Jacobs','1993-12-20','0505369509','RPF-01','05.0','male','2020-09-01','RPF'),('Mykola','Tyler','1992-06-29','0508113940','RPF-01','04.7','male','2018-09-01','RPF'),('Mykola','Hogan','1998-09-10','0675827536','RPF-01','03.6','male','2019-09-01','RPF'),('Mykola','Montoya','1999-05-26','0503373916','EF-01','03.2','female','2015-09-01','EF');

SELECT first_name, avg_mark from students
WHERE first_name='Mykola' AND avg_mark > 4.5;

-- 7. Отобразить количество студентов, обучающихся в каждой группе.

SELECT "group", count(last_name) from students
GROUP BY "group";

-- 8. Отобразить общее количество студентов, поступивших в 2015 году.

SELECT EXTRACT(YEAR FROM entered_at) AS Year, count(last_name) AS student from students
GROUP BY Year
HAVING  EXTRACT(YEAR FROM entered_at) = 2015;

-- 9. *Отобразить средний (средний) балл студентов женского пола каждого факультета. Список
-- упорядочить по убыванию среднего балла. Стоблик со средним баллом назвать
-- avg_avg_mark.

SELECT department, round(sum(avg_mark) / count(avg_mark), 1) AS avg_avg_mark FROM students
WHERE gender='female'
GROUP BY department
ORDER BY avg_avg_mark DESC;


-- 10. *Отобразить минимальный средний балл студентов факультета информационных
-- технологий, родившихся летом, в зависимости от года поступления. Выводить
-- информацию только о тех годаж поступления, где минимальный средний балл выше 3,5.

SELECT EXTRACT(YEAR FROM entered_at) AS Entered_Year, min(avg_mark) AS min_avg_mark FROM students
WHERE department='ETF' AND (EXTRACT(MONTH FROM birthday) >= 6 AND EXTRACT(MONTH FROM birthday) <= 8)
GROUP BY EXTRACT(YEAR FROM entered_at)
HAVING min(avg_mark) > 3.5;

-- 11. Для всех студентов с именем Vasya изменить написание имени на Vasia.

INSERT INTO Students(first_name,last_name,birthday,phone_number,"group",avg_mark,gender,entered_at,department) VALUES ('Vasya','Jacobs','1993-12-20','0505369599','RPF-01','05.0','male','2020-09-01','RPF'),('Vasya','Tyler','1992-06-29','0508193940','RPF-01','04.7','male','2018-09-01','RPF'),('Vasya','Hogan','1998-09-10','0675827936','RPF-01','03.6','male','2019-09-01','RPF'),('Vasya','Montoya','1999-05-26','0503973916','EF-01','03.2','male','2015-09-01','EF');

SELECT * FROM Students 
WHERE first_name = 'Vasya';


UPDATE Students SET first_name = 'Vasia'
WHERE first_name = 'Vasya';

SELECT * FROM Students 
WHERE first_name = 'Vasia';

-- 12. *Добавить в таблицу столбец с информацией о серии/номере паспорта студента.

ALTER TABLE Students ADD COLUMN passport varchar(8) UNIQUE;

UPDATE Students
SET passport = SUBSTRING (first_name, 1, 1)||SUBSTRING (last_name, 1, 1)||EXTRACT(YEAR FROM birthday)||EXTRACT(MONTH FROM birthday);


