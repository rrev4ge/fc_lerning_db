-- Создать базу данных и таблицы по следующей схеме (названия таблиц приведено сверху и выделено жирным):

--  ||courses|  |       ||exams|   |       ||students| |
--  |id         | 1-    |id_student| M---1 |id         |
--  |title      |   --M |id_course |       |name       |
--  |description|       |mark      |       |surname    |
--  |hours      |       |          |       |           |

-- Продумать типы данных и ограничения для указанных полей.

-- Таблица Students описана в прошлом ДЗ и для данного ДЗ не модифицируется для текущего дз (копию не вставил т.к большой объем тестовых данных)

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title varchar(32) NOT NULL,
    description varchar(320) DEFAULT NULL,
    hours interval HOUR 
);    

CREATE TABLE exams (
    id_student INTEGER REFERENCES students ON DELETE RESTRICT ON UPDATE CASCADE,
    id_course INTEGER REFERENCES courses ON DELETE RESTRICT ON UPDATE CASCADE,
    mark numeric(2,1) DEFAULT NULL,
    PRIMARY KEY(id_student, id_course)
);   

-- Реализовать связи между таблицами.
-- Заполнить таблицы тестовыми данными (можно использовать таблицу из прошлой домашки).

INSERT INTO courses (title, description, hours) 
VALUES 
('Programming essentials','Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum','228'),
('Data Sciense','sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec','165'),
('Dot Net','hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum','175'),
('Project Management','dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat','228'),
('Full Stack','sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et','154');

INSERT INTO exams (id_student, id_course, mark) 
VALUES (23,2,4.5),(36,1,2.5),(27,2,2.5),(33,4,3.5),(65,5,5.0),(30,3,4.7),(39,2,5.0),(28,3,2.5),(94,1,4.3),(41,2,4.3),(72,3,NULL),(33,2,4.7),(59,5,2.5),(23,3,3.3),(55,3,4.5),(66,1,4.7),(17,1,5.0),(23,4,3.3),(27,1,3.5),(80,1,5.0),(83,1,NULL),(77,5,4.3),(90,4,NULL),(55,2,3.5),(98,2,5.0),(90,2,4.7),(18,3,2.5),(88,4,2.5),(12,4,4.5),(64,5,2.5),(19,5,5.0),(23,5,2.5),(35,4,3.3),(45,3,5.0),(41,3,4.5),(79,1,NULL),(33,5,4.3),(79,4,5.0),(35,2,4.7),(96,4,5.0),(86,1,NULL),(1,4,2.5),(58,2,3.5),(97,3,3.5),(60,2,NULL),(20,5,4.7),(83,3,3.5),(63,1,3.3),(80,5,5.0),(48,5,3.3),(31,3,NULL),(31,5,3.3),(65,1,2.5),(1,5,3.3),(83,4,2.5),(39,3,2.5),(45,4,3.5),(97,5,3.5),(50,5,4.7),(97,1,2.5),(27,4,3.3),(6,2,NULL),(65,2,NULL),(17,2,5.0),(86,4,5.0),(24,3,3.3),(16,5,4.7),(11,4,2.5),(70,5,4.3),(83,5,4.5),(93,5,3.5),(64,1,NULL),(56,5,3.3),(48,3,4.3),(80,4,2.5),(10,1,5.0),(63,2,5.0),(91,5,5.0),(87,2,5.0),(12,1,4.3),(41,1,5.0),(9,4,3.5),(2,2,4.5),(55,4,4.3),(80,3,4.3),(85,5,3.3),(18,1,4.3),(4,1,NULL),(93,3,4.5),(61,4,4.3),(22,1,NULL),(56,3,2.5),(22,5,4.3),(24,2,3.3),(45,2,NULL),(61,1,3.3),(88,2,5.0),(25,3,4.5),(96,1,4.5),(34,4,NULL);

-- Краткое описание предметной области:
-- каждый студент может изучать несколько дисциплин, каждую дисциплину может прослушать несколько студентов (т.е. связь «многие-ко-многим», отсюда дополнительная таблица Exams). На изучение дисциплины отводится определенное количество часов. Когда студент начинает изучать дисциплину, то это отображается в таблице Exams без оценки (NULL), если же он уже сдал экзамен, тогда ставится оценка.


-- Реализовать следующие запросы (обращайте внимание на то, что нужно вывести):

-- 1. Отобразить имена и фамилии студентов и названия изучаемых ими курсов.

SELECT s.first_name||' '||s.last_name AS students, string_agg(c.title, ', ') AS courses 
FROM students s
JOIN exams e on s.id=e.id_student
JOIN courses c on e.id_course=c.id
GROUP BY students
ORDER BY students ASC;

-- 2. Создать представление по запросу 1.

CREATE VIEW users_view AS
SELECT s.first_name||' '||s.last_name AS students, string_agg(c.title, ', ') AS courses 
FROM students s
JOIN exams e on s.id=e.id_student
JOIN courses c on e.id_course=c.id
GROUP BY students
ORDER BY students ASC;

-- 3. Отобразить баллы студента Петра Петренко aka Clare Potter* по дисциплине «Основы программирования».

SELECT e.mark 
FROM students s
JOIN exams e on s.id=e.id_student
JOIN courses c on e.id_course=c.id
WHERE s.first_name||' '||s.last_name = 'Clare Potter' AND c.title='Programming essentials';

-- 4. Отобразить студентов, у которых есть баллы ниже 3.5.

SELECT s.first_name||' '||s.last_name AS students 
FROM students s
JOIN exams e on s.id=e.id_student
WHERE e.mark < 3.5
GROUP BY students;

-- 5. Отобразить студентов, которые прослушали дисциплину «Основы программирования» и имеют по ней оценку.

SELECT s.first_name||' '||s.last_name AS students 
FROM students s
JOIN exams e on s.id=e.id_student
JOIN courses c on e.id_course=c.id
WHERE c.title='Programming essentials' AND e.mark IS NOT NULL;

-- 6. Отобразить средний балл и количество курсов которые посетил каждый студент.

SELECT s.first_name||' '||s.last_name AS students, avg(e.mark)::numeric(2,1) AS avg_mark, count(e.id_course) 
FROM students s
JOIN exams e on s.id=e.id_student
GROUP BY students;

-- 7. Отобразить студентов, которые имеют средний балл выше 4.0.

SELECT s.first_name||' '||s.last_name AS students 
FROM students s
JOIN exams e on s.id=e.id_student
GROUP BY students
HAVING avg(e.mark)::numeric(2,1) > 4.0;

-- 8. *Отобразить студентов, которые имеют средний балл выше, чем Петр Петренко aka Clare Potter*.

SELECT s.first_name||' '||s.last_name AS students 
FROM students s
JOIN exams e on s.id=e.id_student
GROUP BY students
HAVING avg(e.mark)::numeric(2,1) > (
    SELECT avg(e.mark)::numeric(2,1) FROM students s
    JOIN exams e on s.id=e.id_student
    WHERE s.first_name||' '||s.last_name = 'Clare Potter'
);

-- 9. *Отобразить дисциплины, которые еще не прослушал ни один студент (с добавлением тестовых данных для задачи).

INSERT INTO courses (title, description, hours) 
VALUES 
('Nikto Menya Ne Slushaet','Cras vehweicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum','29'),
('Fizra','Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibenwedum','28');

INSERT INTO exams (id_student, id_course, mark) 
VALUES (23,7,NULL);

SELECT c.title AS courses 
FROM courses c
WHERE c.id NOT IN (
    SELECT e.id_course FROM exams e
    GROUP BY e.id_course
) OR  (
    SELECT sum(e.mark) FROM exams e
    WHERE e.id_course=c.id 
) IS NULL
GROUP BY c.id;

-- 10. *Отобразить студентов, которые прослушали те же курсы, что и Петр Петренко aka Clare Potter.

SELECT s.first_name||' '||s.last_name AS students 
FROM students s
JOIN exams e on s.id=e.id_student
WHERE s.first_name||' '||s.last_name <> 'Clare Potter'
GROUP BY students
HAVING array_agg(e.id_course) @> (
    SELECT array_agg(e.id_course) FROM exams e 
    JOIN students s ON e.id_student=s.id
    WHERE s.first_name||' '||s.last_name = 'Clare Potter'
);