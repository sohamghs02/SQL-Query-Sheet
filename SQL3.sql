CREATE DATABASE college;
USE college;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

CREATE TABLE dept (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO student 
	(rollno, name, marks, grade, city) VALUES
    (101, "anil", 78, "C", "Pune"),
    (102, "bhumika", 93, "A", "Mumbai"),
    (103, "chetan", 85, "B", "Mumbai"),
    (104, "dhruv", 96, "A", "Delhi"),
    (105, "emanuel", 12, "F", "Delhi"),
    (106, "farah", 82, "B", "Delhi");
    
INSERT INTO dept
	(id, name) VALUES
    (101, "Science"),
    (102, "English"),
    (103, "Hindi");
    
INSERT INTO teacher
	(id, name, dept_id) VALUES
    (101, "Adam", 101),
    (102, "Bob", 103),
    (103, "Casey", 102),
    (104, "Donald", 102);
    
SET SQL_SAFE_UPDATES = 0;
    
SELECT * FROM student;
TRUNCATE TABLE student;
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;
ALTER TABLE student DROP COLUMN age;
ALTER TABLE student DROP COLUMN grade;
ALTER TABLE student DROP COLUMN stu_age;
ALTER TABLE Student RENAME TO student;
ALTER TABLE student MODIFY age VARCHAR(2);
ALTER TABLE student CHANGE age stu_age INT;
ALTER TABLE student CHANGE name full_name VARCHAR(50);

SELECT * FROM dept;
SELECT * FROM teacher;
SELECT DISTINCT city FROM student;
SELECT * FROM student WHERE marks>=80;
SELECT * FROM student WHERE city="Mumbai";
SELECT * FROM student WHERE marks>=80 AND city="Mumbai";
SELECT * FROM student WHERE marks>=80 OR city="Mumbai";
SELECT * FROM student WHERE marks+10>100;
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN("Delhi", "Mumbai");
SELECT * FROM student WHERE city NOT IN("Delhi", "Mumbai");
SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks>75 LIMIT 3;
SELECT * FROM student ORDER BY city;
SELECT * FROM student ORDER BY city DESC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;
SELECT max(marks) FROM student;
SELECT min(marks) FROM student;
SELECT avg(marks) FROM student;
SELECT count(city) FROM student;
SELECT city, count(name) FROM student GROUP BY city;
SELECT city, avg(marks) FROM student GROUP BY city ORDER BY city;
SELECT city, avg(marks) FROM student GROUP BY city ORDER BY city DESC;
SELECT grade, count(name) FROM student GROUP BY grade ORDER BY grade;
SELECT city, count(name) FROM student GROUP BY city HAVING max(marks)>90;
UPDATE student SET grade = "O" WHERE grade = "A";
UPDATE student SET marks = 92 WHERE rollno = 105;
UPDATE student SET grade = "B" WHERE marks >=80 AND marks <90;
UPDATE student SET grade = "A" WHERE marks>90;
SELECT * FROM student;
UPDATE student SET marks=marks+1;
UPDATE student SET marks=12 WHERE rollno=105;
DELETE FROM student WHERE marks<33;
DELETE FROM student WHERE marks<80;