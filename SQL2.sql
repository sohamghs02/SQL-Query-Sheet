CREATE DATABASE College;
USE College;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);
DESC student;
SELECT * FROM student;

INSERT INTO student
	(id, name, age) VALUES
	(1, "Aman", 25),
    (2, "Subham", 35),
    (3, "Abham", 45);
    
CREATE DATABASE XYZ;
USE XYZ;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT(20)
);

INSERT INTO EMPLOYEE 
	(id, name, salary) VALUES
    (1, "adam", 25000),
    (2, "bob", 30000),
    (3, "casey", 40000);
    
SELECT * FROM employee;
DROP DATABASE XYZ;
DROP DATABASE COLLEGE;