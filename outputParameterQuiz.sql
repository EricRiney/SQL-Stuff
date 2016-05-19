-- Im not sure what to do for this quiz. 
-- The internet and the assigned reading 
-- has an entirely different name and methodology 
-- for nested stored procedures... 

USE UNIVERSITY
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC dontUnderstand(
 @StudentFname   varchar (60) 
 @StudentLname   varchar (60) 
 @DOB            date

 @ContactFname   varchar (60) 
 @ContactLname   varchar (60) 
 @ContactAddress varchar (80) 
)
AS 

DECLARE @StudentID
DECLARE @ContactID

BEGIN TRAN t1
SET @StudentID = (SELECT StudentID FROM tblSTUDENT WHERE StudentID = @StudentID)
EXEC stillDontUnderstand @ContactFname = @ContactFname, @ContactLname = @ContactLname, 
    @ContactAddress = @ContactAddress, @ContactID = @ContactID

INSERT INTO tblSTUDENT (FName, LName)
VALUES (@StudentFname, @StudentFname)

INSERT INTO Contact(Fname , Lname)
VALUES (@ContactFname , @ContactLname)



if @@error <> 0
    rollback TRAN t1
else commit TRAN t1   


CREATE PROC stillDontUnderstand(
 @ContactFname   varchar (60) 
 @ContactLname   varchar (60)  
 @ContactAddress varchar (80)
 @ContactID      INT OUTPUT
)
AS 
BEGIN TRAN t2
SET @ContactID = (SELECT ContactID FROM tblContact WHERE 
    ContactFname = @ContactFname AND ContactLname = @ContactLname)
IF ContactID isnull
INSERT INTO Contact ()


SET @ContactID = (SELECT scope_identity())
 
if @@error <> 0
    rollback TRAN t2
else commit TRAN t2       
RETURN

 
 -- THIS IS THE BOOK
--  SELECT E.Fname, E.Lname
-- FROM EMPLOYEE AS E
-- WHERE E.Ssn IN ( SELECT Essn
-- FROM DEPENDENT AS D
-- WHERE E.Fname=D.Dependent_name
-- AND E.Sex=D.Sex );

-- THIS IS THE INTERNET
-- USE AdventureWorks2008R2;
-- GO
-- IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL
--     DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;
-- GO
-- CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD
-- @SalesPerson nvarchar(50),
-- @SalesYTD money OUTPUT
-- AS  

--     SET NOCOUNT ON;
--     SELECT @SalesYTD = SalesYTD
--     FROM Sales.SalesPerson AS sp
--     JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID
--     WHERE LastName = @SalesPerson;
-- RETURN
-- GO


-- USE UNIVERSITY
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE PROC bork



ubuntu@ip-172-31-40-93:~/goWorkSpace$ go install $GOFISH
ubuntu@ip-172-31-40-93:~/goWorkSpace$ $RUNFISH

Dear recruiters,

Java is to JavaScript as Car is to carpet.  

Best, 

Developers 
Mathematicians
Scientists


// i realize now that gregHeyGirlHeeey and 
// feelTheDavidStearns might seem like dadaesqe 
// var name choices but if you examine the function
// bruh() youll see a rather elegant solution to a problem
// that doesnt really exist in this program
//
// thank you again for you understanding in these difficult times   