USE [CUSTOMER_BUILD]
GO
/****** Object:  StoredProcedure [dbo].[uspPopulateCust_Avenues]    Script Date: 5/9/2016 12:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- use 
-- truncate table tblcustomer
-- exec uspPopulateCust_Avenues 1000

ALTER PROCEDURE [dbo].[uspPopulateCust_Avenues] @run INT
AS
DECLARE @Fname Varchar (60) --5,525
DECLARE @Lname varchar (60) --88,798
DECLARE @HouseNum varchar (5) --35000 **** these values need to be 'tripled' to accommodate rand() and variables
DECLARE @Direction varchar (5) --12 (North, South, East etc)a
DECLARE @StName varchar (75) --589 **** these values need to be 'doubled' to accommodate rand() and variables
DECLARE @StSuffix varchar (25) --13 (Point, Hill, Terrace, Heights, Lake, Valley, Leaf, Ridge etc)
DECLARE @CityStateZip INT --40,000 **** these values need to be 'tripled' to accommodate rand() and variables
DECLARE @StDescr varchar (25) --11 (Hwy, Court, Way, Street etc)
DECLARE @address Varchar (100) -- consolidated field to pull random data prior to insert into customer table
DECLARE @City varchar (75)
DECLARE @State varchar (25)
DECLARE @County varchar (75)
DECLARE @Zip varchar (12)
--DECLARE @Code varchar(3)
DECLARE @Email varchar(75)
DECLARE @scram varchar (3)

DECLARE @Dig1 varChar (20)
DECLARE @Rand Numeric (16,16)
WHILE @Run > 0

BEGIN
SELECT @RAND = RAND()
SET @Dig1 = @rand
SET @scram = (SELECT SUBSTRING(@Dig1, 9, 3))
SET @Fname = (SELECT SUBSTRING(@Dig1, 3, 4))
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
--SET @CityStateZip = (SELECT TOP 1 CityStateZipID FROM tblCITY_STATE_ZIP ORDER BY NEWID())
SET @Fname = (SELECT FirstName FROM tblFIRST_NAME WHERE FirstNameID = @Fname)

SET @Lname = (SELECT LastName FROM tblLAST_NAME WHERE LastNameID = @Lname)

SET @Address = (SELECT (SELECT HouseNumber FROM tblHOUSE_NUMBER WHERE HouseNumID = @HouseNum) + ' ' + (SELECT Direction FROM tblDIRECTION WHERE DirectionID = @Direction) + ' ' +
 (SELECT StreetName FROM tblSTREET_NAME WHERE StreetNameID = @StName) + ' ' + (SELECT StreetSuffix FROM tblSTREET_SUFFIX WHERE StreetSuffixID = @StSuffix) + ' ' + (SELECT [StreetDescr] FROM [dbo].[tblSTREET_DESCR] WHERE [StreetDescrID] = @StDescr)
 )
 
 SET @City = (SELECT CityName FROM tblCITY_STATE_ZIP WHERE CityStateZipID = @CityStateZip)
 SET @County = (SELECT CountyName FROM tblCITY_STATE_ZIP WHERE CityStateZipID = @CityStateZip)
 SET @State = (SELECT StateName FROM tblCITY_STATE_ZIP WHERE CityStateZipID = @CityStateZip)
 SET @Zip = (SELECT Zip FROM tblCITY_STATE_ZIP WHERE CityStateZipID = @CityStateZip)
-- SET @Code = (SELECT AreaCode FROM tblCITY_STATE_ZIP WHERE CityStateZipID = @CityStateZip)
 SET @email = (SELECT @Fname + '.'+@Lname+@scram+'@uw.edu')
INSERT INTO [dbo].[tblCUSTOMER] ([CustomerFname],[CustomerLname],[CustomerAddress], [CustomerCity], [CustomerCounty], [CustomerState], [CustomerZIP], Email)
VALUES (@Fname, @Lname, @address, @City, @County, @State, @Zip, @email)

Set @run = @run -1
END