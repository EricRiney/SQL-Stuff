stored procedures 

basic structure:

CREATE PROC [name]

(@Fname varchar(25), Gotta match!
@Lname varchar(25),
@DOB Date,
@custTypeName varchar(25))

AS

Declare @CustTypeID INT = (SELECT CustTypeNameID 
                           FROM tblCustomerType
                           WHERE CustTypeName =
                           @CustTypeName)      

INSERT INTO tblCustomer
    (FirstName, LastName, DOB, CustTypeID)
    
VALUES (@Fname, @Lname, @DOB, @CustTypeID)
O0 i