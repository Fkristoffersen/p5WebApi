DROP DATABASE IF EXISTS udataplus;
CREATE DATABASE udataplus;

USE udataplus;

  CREATE TABLE IF NOT EXISTS user (
    UserId INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
    Email VARCHAR(60) NOT NULL,
    Password VARCHAR(150) NOT NULL,
    Role varchar(12) NOT NULL,
    TriesLeft TINYINT   NOT NULL DEFAULT 4,
    last_update TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId)
  )

  CREATE TABLE IF NOT EXISTS user_address (
    User_addressId INT NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (UserId) REFERENCES user(UserId) ON DELETE CASCADE
    FOREIGN KEY (addressId) REFERENCES address(addressId) ON DELETE CASCADE  
  )

  CREATE TABLE IF NOT EXISTS address (
    AddressId INT NOT NULL AUTO_INCREMENT,
    Address VARCHAR(45) NOT NULL,
    address2 VARCHAR(45) NOT NULL,
    Region varchar(30) NOT NULL
	Postal VARCHAR(4) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
    PRIMARY KEY (AddressId)
  )

  CREATE TABLE IF NOT EXISTS course (
    CourseId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(60) NOT NULL,
    FOREIGN KEY(UserId) REFERENCES user(UserId) 
    Current_Time TIMESTAMP NOT NULL ON CREATE CURRENT_TIMESTAMP

  )

  CREATE TABLE IF NOT EXISTS group (
    GroupId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(60) NOT NULL DEFAULT 'A'

    
  )



INSERT INTO user (FirstName,LastName,Email,Password,Role)
VALUES ('Amanda','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
		('Carls','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Andersen','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Bob','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Enrik','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Bingus','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Luan','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student'),
        ('Dona','Nicolinelsen','Demo@gmail.com', 'Passw0rd', 'Student');

INSERT INTO group (Name)
VALUES ('H1A'),
		('H1B'),
        ('Student'),
        ('Student'),
        ('Student'),
        ('Student'),
        ('Student'),
        ('Student');
SERT ON group
FOR EACH ROW BEGIN
    UPDATE group SET Name = xx + RIGHT('..') 

-- *=================================================================
-- ? Procedure: FindAll 
-- * Parameters: NONE 
-- ^ Description: Find all students and teachers. 
-- *=================================================================

CREATE PROCEDURE FindAll(
    IN student_name VARCHAR(20)
)
BEGIN
    IF student_name IS NULL THEN
        (SELECT FirstName, LastName FROM student)
        UNION 
        (SELECT FirstName, LastName FROM teacher)
        order by FirstName;
    END IF;

END$$

-- *=================================================================
-- ? Procedure: FindTeachers 
-- * Paramaters: teacher_name 
-- ^ Description: Find all teachers that have the same given name. 
-- *=================================================================

CREATE PROCEDURE FindTeachers(
	IN teacher_name VARCHAR(20)
)
BEGIN 
    SELECT *
    FROM teacher 
    WHERE FirstName = teacher_name;

END$$

-- *=================================================================
-- ? Procedure: FindStudents 
-- * Paramaters: student_name
-- ^ Description: Find all students that have the same given name.
-- *=================================================================


CREATE PROCEDURE FindStudents(
    IN student_name VARCHAR(20)
)
BEGIN

    SELECT *
    FROM student
    WHERE FirstName = student_name;

END$$

-- *=================================================================
-- ? Procedure: DeleteStudent
-- * Paramaters: student_id  
-- ^ Description: Delete the student that have the same given id. 
-- *=================================================================


CREATE PROCEDURE DeleteStudent(
    IN student_id int
)
BEGIN

    DELETE
    FROM student
    WHERE StudentId = student_id;

END$$

-- *=================================================================
-- ? Procedure: DeleteTeacher
-- * Paramaters: teacher_id 
-- ^ Description: Delete the teacher that have the same given id. 
-- *=================================================================

CREATE PROCEDURE DeleteTeacher(
    IN teacher_id int 
)
BEGIN
    DELETE 
    FROM teacher
    WHERE teacher_id = teacher_id;

END$$



DELIMITER ; 

CALL FindStudents('Luan');
CALL DeleteStudent(1);
CALL DeleteTeacher(1);
CALL FindAll('dogs');
CALL FindTeachers()
