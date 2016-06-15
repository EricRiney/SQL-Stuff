USE [CUSTOMER_BUILD]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomers]    Script Date: 5/9/2016 12:39:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddCustomers] @Run int
AS
DECLARE @Fname varchar (60) --5,525
DECLARE @Lname varchar (60) --88,798
DECLARE @HouseNum varchar (5) --35000 **** these values need to be 'tripled' to accommodate rand() and variables
DECLARE @Direction varchar (5) --12 (North, South, East etc)
DECLARE @StName varchar (75) --589 **** these values need to be 'doubled' to accommodate rand() and variables
DECLARE @StSuffix varchar (25) --13 (Point, Hill, Terrace, Heights, Lake, Valley, Leaf, Ridge etc)
DECLARE @CityStateZip INT --40,000 **** these values need to be 'tripled' to accommodate rand() and variables
DECLARE @StDescr varchar (25) --11 (Hwy, Court, Way, Street etc)
DECLARE @address varchar (100) -- consolidated field to pull random data prior to insert into customer table
DECLARE @City varchar (75)
DECLARE @State varchar (25)
DECLARE @County varchar (75)
DECLARE @Birthday date
DECLARE @PhoneNumber nvarchar(10)
-- Range for ZipCodes
DECLARE @lower int = 1;
DECLARE @upper int = 50;
DECLARE @ZipID int;
DECLARE @Zipcode int


DECLARE @Dig1 varChar (20)
DECLARE @Rand Numeric (16,16)

WHILE @Run > 0
BEGIN TRY
BEGIN TRAN
-- Number between 0 and 1, 16 decimal places. Stored as String.
SELECT @Rand = RAND() -- .0435 Numeric
SET @Dig1 = @Rand -- .0435 String

-- Read 4 characters, starting at 3rd index etc.
SET @Fname = (SELECT SUBSTRING(@Dig1, 3, 4)) -- 0435
SET @Lname = (SELECT SUBSTRING(@Dig1, 6, 5))
SET @HouseNum = (SELECT SUBSTRING(@Dig1, 8, 5))

SET @Direction = (SELECT CASE
                	WHEN SUBSTRING(@Dig1, 7, 2) = 00
                   	THEN 25
                   	ELSE SUBSTRING(@Dig1, 7, 2)
                	END  
                	)

SET @StName = (SELECT SUBSTRING(@Dig1, 4, 3))
SET @StSuffix = (SELECT CASE
                	WHEN SUBSTRING(@Dig1, 12, 2) = 00
                   	THEN 81
                   	ELSE SUBSTRING(@Dig1, 12, 2)
                	END  
                	)

SET @StDescr = (SELECT CASE
                	WHEN SUBSTRING(@Dig1, 13, 2) = 00
                   	THEN 90
                   	ELSE SUBSTRING(@Dig1, 13, 2)
                	END  
                	)

SET @CityStateZip = (SELECT SUBSTRING(@Dig1, 10, 5)) -- doubled to exceed 120000

SET @Fname = (SELECT FirstName FROM tblFIRST_NAME WHERE FirstNameID = @Fname)

SET @Lname = (SELECT LastName FROM tblLAST_NAME WHERE LastNameID = @Lname)

-- Our 'Street' address field
SET @Address = (SELECT (SELECT HouseNumber FROM tblHOUSE_NUMBER WHERE HouseNumID = @HouseNum) + ' ' + (SELECT Direction FROM tblDIRECTION WHERE DirectionID = @Direction) + ' ' +
 (SELECT StreetName FROM tblSTREET_NAME WHERE StreetNameID = @StName) + ' ' + (SELECT StreetSuffix FROM tblSTREET_SUFFIX WHERE StreetSuffixID = @StSuffix) + ' ' + (SELECT [StreetDescr] FROM [dbo].[tblSTREET_DESCR] WHERE [StreetDescrID] = @StDescr)
 )

SET @State = 'WA'
SET @ZipID = (SELECT ROUND(((@upper - @lower - 1) * RAND() + @lower), 0))
SET @Zipcode = (SELECT Zipcode FROM proj_QuickDrink.dbo.tblZIPCODE where ZipcodeID = @ZipID)
-- Must return only 1 record. Greg has duplicate zipcodes...
SET @City = (SELECT TOP 1 CityName FROM tblCITY_STATE_ZIP WHERE Zip = @Zipcode)

SET @Birthday = (SELECT CAST(DateAdd(d, ROUND(DateDiff(d, '1950-01-01', '1999-12-31') * RAND(), 0), '1950-01-01') as date))
DECLARE @pNum BIGINT = (SELECT FLOOR(RAND() * POWER(CAST(10 as BIGINT), 10)))
SET @PhoneNumber = CAST(@pNum as nvarchar)

INSERT INTO proj_QuickDrink.dbo.tblCUSTOMER (BirthDate, CustFName, CustLName)
VALUES (@Birthday, @Fname, @Lname)
DECLARE @custID int = SCOPE_IDENTITY();

INSERT INTO proj_QuickDrink.dbo.tblCUSTPHONE(CustID, Number)
VALUES (@custID, @PhoneNumber)

INSERT INTO proj_QuickDrink.dbo.tblADDRESS(Street, City, State, ZipcodeID)
VALUES (@Address, @City, @State, @ZipID)
DECLARE @AddressID int = SCOPE_IDENTITY();

INSERT INTO proj_QuickDrink.dbo.tblCUSTOMER_ADDRESS(CustID, AddressID)
VALUES (@custID, @AddressID)

Set @Run = @Run -1
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH