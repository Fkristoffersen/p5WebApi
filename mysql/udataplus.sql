DROP DATABASE IF EXISTS udataplus;
CREATE DATABASE udataplus;

USE udataplus;

CREATE TABLE IF NOT EXISTS student (
	StudentId INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	Postal VARCHAR(45) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (StudentId));
  
  CREATE TABLE IF NOT EXISTS teacher (
	TeacherId INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	Postal VARCHAR(45) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (TeacherId));


INSERT INTO student (FirstName,LastName,Address,Postal,Phone)
VALUES ('Amanda','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
		('Carls','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Andersen','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Bob','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Enrik','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Bingus','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Luan','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Dona','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482');

INSERT INTO teacher (FirstName,LastName,Address,Postal,Phone)
VALUES ('Bo','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
		('John','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Pelle','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Jack','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Nicolaj','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Ricardo','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Steve','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Rekt','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482');


DELIMITER $$
CREATE PROCEDURE FindAll(
    IN student_name VARCHAR(20)
)
BEGIN

    (SELECT FirstName, LastName from student)
    UNION 
    (SELECT FirstName, LastName FROM teacher)
    order by FirstName;


END$$

CREATE PROCEDURE FindTeachers(
	IN teacher_name VARCHAR(20)
)
BEGIN 
    SELECT *
    FROM teacher 
    WHERE FirstName = teacher_name;

END$$

CREATE PROCEDURE FindStudents(
    IN student_name VARCHAR(20)
)
BEGIN

    SELECT *
    FROM student
    WHERE FirstName = student_name;

END$$

CREATE PROCEDURE DeleteStudents(
    IN student_id int
)
BEGIN

    DELETE
    FROM student
    WHERE StudentId = student_id;

END$$
DELIMITER ; 

CALL FindStudents('Luan');
CALL DeleteStudents(1);
CALL FindAll('dogs');
CALL FindTeachers()
