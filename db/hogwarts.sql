DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;



CREATE TABLE houses(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  house_id INT REFERENCES houses(id) ON DELETE CASCADE,
  age INT
);
