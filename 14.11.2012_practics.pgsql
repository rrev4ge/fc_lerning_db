
-- CREATE TABLE tasks ( 
--     id SERIAL PRIMARY KEY, 
--     deadline date
--     );

-- INSERT INTO tasks(deadline)
-- VALUES ('2018/01/01'),('2020/11/14'),('2021/01/01');

-- SELECT id, 
-- CASE WHEN deadline >
-- FROM tasks

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    id_campus INTEGER REFERENCES campus
)


CREATE TABLE campus (
   id SERIAL PRIMARY KEY,
   address text
)

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    caption varchar(60)
)

CREATE TABLE subjects_to_students(
    id_student INTEGER REFERENCES students,
    id_subject INTEGER REFERENCES subjects,
    PRIMARY KEY (id_student, id_subject)
)