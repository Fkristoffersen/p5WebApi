DROP DATABASE IF EXISTS udataplus;
CREATE DATABASE udataplus;

USE udataplus;

CREATE TABLE IF NOT EXISTS student (
	idStudent INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	Postal VARCHAR(45) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (idStudent));
  
  CREATE TABLE IF NOT EXISTS teacher (
	idteacher INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	Postal VARCHAR(45) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (idteacher));


INSERT INTO student (FirstName,LastName,Address,Postal,Phone)
VALUES ('Amanda','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
		('Carls','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Andersen','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Bob','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Enrik','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Bingus','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Luan','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482'),
        ('Dona','Nicolinelsen','305 - 14th Ave. S. Suite 3B', '2700', '81946482')


DELIMITER $$
CREATE PROCEDURE FindAll(
    IN student_name VARCHAR(20)
)
BEGIN

    SELECT FirstName, LastName
    FROM student, teacher
    ORDER BY student;


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
    WHERE idStudent = student_id;

END$$
DELIMITER ; 

CALL FindStudents('Frederik');
CALL DeleteStudents(1);
CALL FindAll('dogs')
