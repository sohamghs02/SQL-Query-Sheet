CREATE DATABASE temp;
USE temp;

CREATE TABLE stu (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO stu 
	(rollno, name, marks, grade, city) VALUES
    (101, "anil", 78, "C", "Pune"),
    (102, "bhumika", 93, "A", "Mumbai"),
    (103, "chetan", 85, "B", "Mumbai"),
    (104, "dhruv", 96, "A", "Delhi"),
    (105, "emanuel", 12, "F", "Delhi"),
    (106, "farah", 82, "B", "Delhi");
    
SELECT * FROM stu;    
-- subquery
SELECT name,marks FROM stu WHERE marks > (SELECT avg(marks) FROM stu);
SELECT name,rollno FROM stu WHERE rollno IN (SELECT rollno FROM stu WHERE rollno%2=0);
SELECT MAX(marks) FROM (SELECT * FROM stu WHERE city = "Delhi") AS temp;
SELECT (SELECT MAX(marks) FROM stu),name FROM stu;

-- views
CREATE VIEW view1 AS SELECT rollno, name FROM stu;
SELECT * FROM view1;
DROP VIEW view1;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE course (
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO student 
	(id, name) VALUES
    (101, "adam"),
    (102, "bob"),
    (103, "casey");
    
INSERT INTO course
	(id, course) VALUES
    (101, "english"),
    (105, "math"),
    (103, "science"),
    (107, "computer science");
    
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student as s INNER JOIN course as c ON s.id=c.id;
SELECT * FROM student as s LEFT JOIN course as c ON s.id=c.id;
SELECT * FROM student as s RIGHT JOIN course as c ON s.id=c.id;

SELECT * FROM student as s
LEFT JOIN course as c
ON s.id=c.id 
UNION 
SELECT * FROM student as s 
RIGHT JOIN course as c 
ON s.id=c.id;

SELECT * FROM student
UNION
SELECT * FROM course;

-- LEFT EXCLUSIVE JOIN
SELECT * FROM student as s LEFT JOIN course as c ON s.id=c.id WHERE c.id IS NULL;
-- RIGHT EXCLUSIVE JOIN
SELECT * FROM student as s RIGHT JOIN course as c ON s.id=c.id WHERE s.id IS NULL;
-- SELF JOIN
SELECT a.name as student_name, b.name FROM student as a JOIN student as b ON a.id=b.id;