/* Eric Riner (Riney) code: */ 

/* stored procedures #1 */
SELECT * INTO GregsStuff
FROM UNIVERSITY.dbo.tblINSTRUCTOR

custPopbiz

CREATE PROCEDURE (Lab2_Stored_Procedure_to_populate) 
@Count INT
AS
DECLARE @ID INT
DECLARE @Fname varchar (255)
DECLARE @Lname varchar(255)
DECLARE @email varchar(255)
DECLARE @phoneNumber varchar(25)
DECLARE @gender varchar(1)
WHILE @Count > 0

BEGIN

SELECT FLOOR(10000 + RAND() * 89999) AS random_number
FROM table
WHERE "random_number" NOT IN (SELECT unique_id FROM table)
LIMIT 1

SET @ID = (SELECT Min(InstructorID) FROM GregsStuff)
SET @Fname = (SELECT StudentFname FROM GregsStuff WHERE InstructorID = @ID)
SET @Lname = (SELECT StudentLname FROM GregsStuff  WHERE InstructorID = @ID)
SET @email = (SELECT InstructorEmail FROM GregsStuff  WHERE InstructorID = @ID)
SET @phoneNumber = (SELECT InstructorSocSecNum FROM GregsStuff  WHERE InstructorID = @ID)
SET @gender = (SELECT InstructorSocSecNum FROM GregsStuff  WHERE InstructorID = @ID)
--SET @DOB = (SELECT StudentBirth FROM GregsStuff  WHERE StudentID = @ID)


INSERT INTO Product(Fname, Lname, Email, PhoneNumber, Cred)
Values (@Fname, @Lname, @email, @phoneNumber, @gender)
DELETE FROM GregsStuff WHERE StudentID = @ID
SET @Count= @count-1

END

EXECUTE Lab2_Stored_Procedure_to_populate 20