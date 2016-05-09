

/*
Create the database and run script to create all tables.
*/

USE MASTER
GO

CREATE DATABASE EXAMPLE_CART
GO

USE EXAMPLE_CART
GO

CREATE TABLE [dbo].[tblCUSTOMER](
	[CustID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[CustomerFname] [nvarchar](35) NOT NULL,
	[CustomerLname] [nvarchar](35) NOT NULL,
	[CustomerAddress] [nvarchar](100) NOT NULL,
	[CustomerCity] [nvarchar](75) NOT NULL,
	[CustomerCounty] [nvarchar](75) NOT NULL,
	[CustomerState] [nvarchar](30) NOT NULL,
	[CustomerZIP] [nvarchar](12) NOT NULL,
	[AreaCode] [nvarchar](3) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[BusinessName] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNum] [nvarchar](12) NOT NULL)

CREATE TABLE [dbo].[tblPRODUCT_TYPE](
	[ProdTypeID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ProdTypeName] [varchar](50) NOT NULL,
	[ProdTypeDescr] varchar(1000) NULL)

CREATE TABLE [dbo].[tblPRODUCT](
	[ProdID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ProdName] [varchar](50) NOT NULL,
	[ProdTypeID] INT FOREIGN KEY REFERENCES tblPRODUCT_TYPE (ProdTypeID) NOT NULL,
	[Price] [numeric](12, 2) NULL)

CREATE TABLE [dbo].[tblORDER](
	[OrderID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[CustID] [int] FOREIGN KEY REFERENCES tblCUSTOMER (CustID)  NOT NULL,
	[OrderDate] [datetime] DEFAULT GetDate() NULL)

CREATE TABLE [dbo].[tblLINE_ITEM](
	[LineItemID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[OrderID] [int] FOREIGN KEY REFERENCES tblORDER (OrderID) NULL,
	[ProdID] [int] FOREIGN KEY REFERENCES tblPRODUCT (ProdID) NOT NULL,
	[Qty] [int] NOT NULL)

CREATE TABLE [dbo].[tblCART](
	[CartID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[CustID] [int] FOREIGN KEY REFERENCES tblCUSTOMER (CustID) Not NULL,
	[ProductID] [int] FOREIGN KEY REFERENCES tblPRODUCT (ProdID) NOT NULL,
	[CartDate] DATETIME DEFAULT GetDate() NOT NULL,
	[Qty] [int] NOT NULL
	)

GO


/*
Create computed columns.
*/




CREATE FUNCTION fnCalc_LI_PriceExtd (@LineItemID INT)
RETURNS numeric(12,2)
AS
BEGIN
DECLARE @RET INT =
	(SELECT P.Price * LI.QTY FROM tblPRODUCT P JOIN tblLINE_ITEM LI ON P.ProdID = LI.ProdID WHERE LI.LineItemID = @LineItemID)

RETURN @RET
END
GO


ALTER TABLE tblLINE_ITEM
ADD PriceExtd AS (dbo.fnCalc_LI_PriceExtd(LineItemID))

GO


CREATE FUNCTION fnCalc_ORDER_TotalAmount (@OrderID INT)
RETURNS numeric(12,2)
AS
BEGIN
DECLARE @RET INT =
	(SELECT SUM(PriceExtd) FROM tblLINE_ITEM WHERE OrderID = @OrderID)

RETURN @RET
END
GO


ALTER TABLE tblORDER
ADD TotalAmount AS (dbo.fnCalc_ORDER_TotalAmount(OrderID))










/*
Populate tables with a few rows each
*/



USE [EXAMPLE_CART]
GO

INSERT INTO [dbo].[tblCUSTOMER]
           ([CustomerFname]
           ,[CustomerLname]
           ,[CustomerAddress]
           ,[CustomerCity]
           ,[CustomerCounty]
           ,[CustomerState]
           ,[CustomerZIP]
           ,[AreaCode]
           ,[Email]
           ,[BusinessName]
           ,[DateOfBirth]
           ,[PhoneNum])
SELECT [CustomerFname],[CustomerLname],[CustomerAddress],[CustomerCity],[CustomerCounty],[CustomerState],[CustomerZIP],[AreaCode],[Email],[BusinessName],[DateOfBirth],[PhoneNum]
FROM [PROSPECT_DB].[dbo].[ProspectList]
GO

INSERT INTO [dbo].[tblPRODUCT_TYPE] ([ProdTypeName],[ProdTypeDescr])
VALUES
('Electronics', 'Electronics are products that are plugged into a standard outlet such as stereo equipment, televisions and computers'),
('Housewares', 'Housewares are products designed for consumer use in the home including such items as kitchen utensils, tableware, and decorative objects'),
('Automotive', 'Automotive products are car parts or items associated with maintenance like tires, oil, spark plugs and brake fluid'),
('Food and Beverage', 'Food and Beverage are any products that can be eaten by consumers')

GO
INSERT INTO [dbo].[tblPRODUCT] ([ProdName],[ProdTypeID], [Price])
VALUES
('Super VX-12 Home Stereo' , (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Electronics'), 576.32),
('Ultra Max Table Set', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Housewares'), 162.98),
('Premium Radial JT51', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Automotive'), 92.48),
('Extended-Length USB 16 GB Storage Device', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Electronics'), 56.77),
('Standard 2-Quart Mixer', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Housewares'), 71.18),
('Rugged 94-Inch Truck Bed Shell' , (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Automotive'), 281.88),
('XL 21-inch High-Definition LCD Monitor', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Electronics'), 230.92),
('Power Master 54 Vacuum', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Housewares'), 312.49),
('24K Bristle Scrub Brush', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Automotive'), 11.79),
('Battery Mate 2000 Power Supply', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Electronics'), 319.23),
('Curly Fries', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Food and Beverage'), 7.89),
('Diet Coke', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Food and Beverage'), 4.90),
('Cheese Burger', (SELECT ProdTypeID FROM tblPRODUCT_TYPE WHERE ProdTypeName = 'Food and Beverage'), 10.90)
GO










/*
Create the stored procedure to locate a customerID after being provided first name, last name, date of birth and zip code.

This is an example of a procedure using OUTPUT parameter
*/

CREATE PROCEDURE [dbo].[uspFINDCustID]
	@Fname varchar(35),
	@Lname varchar(35),
	@DOB Date,
	@Zip char(12),
	@CustID INT OUT
AS
BEGIN
	SET @CustID = (
		SELECT CustID
		FROM tblCUSTOMER
		WHERE CustomerFname = @Fname
			AND CustomerLname = @Lname
			AND DateOfBirth = @DOB
			AND CustomerZIP = @Zip)
END



/*
Create the stored procedure to populate items/products into the table tblCART.

*/


CREATE PROCEDURE [dbo].[uspPopCart]
       @ProdName varchar(35),
       @CustID varchar(35),
       @Date DateTime,
       @Qty INT

AS
BEGIN
DECLARE @ProdID INT

SET @ProdID = (
       SELECT ProdID
       FROM tblPRODUCT
       WHERE ProdName = @ProdName)

 --@CustID, @Date and @Qty will be passed-in from calling stored procedure

       INSERT INTO tblCART  (CustID, ProductID, CartDate, Qty)
       VALUES (@CustID, @ProdID, @Date, @Qty)

END


/*
Create the stored procedure to process the contents of tblCART.

This is an example of a variable being constructed as a TABLE which resides in memory
*/


USE POPULATING_CART_EXAMPLE
GO


CREATE PROCEDURE uspProcessTMP_Cart
@CustID INT
AS
--create a temp table to hold tblCART values while processing contents into tblORDER
-- and tblLINE_ITEM


DECLARE @CART TABLE
(tmpCartID INT IDENTITY(1,1) primary key not null,
ProdID INT not null,
Qty INT not null)

/*
* populate the temp table @CART with values from tblCART

* reminder that tblCART is not organized and may include multiple rows of similar products
with different quantities that will need to be consolidated and summarized

* this process will allow for GROUP BY on ProdID to summarize quantities
*/


             INSERT INTO @CART (ProdID, Qty)
             SELECT ProductID, SUM(qty) AS QTY
             FROM tblCART
             WHERE CustID =  @CustID
             GROUP BY ProductID
 

/*
--now we are ready to 'rip' through the temp table to create a new row in tblORDER
--and add rows to the LINE_ITEM that are associated to a single ORDER
*/

--first task is to determine the number of rows to cycle through and process

             DECLARE @Count INT
             SET @COUNT = (SELECT Count(*) FROM @CART)

--this variable (@count) is going to be the number of loops we take with WHILE statement

--establish variables that are needed for the INSERT statement

DECLARE @ID INT
DECLARE @ProdID INT
DECLARE @Qty INT
DECLARE @OrderID INT

/*
--begin WHILE loop with @Count (which reflects the number of rows in tblCART that have
--been copied into a temp table for processing (we are safer processing tblCART rows in
--a temp table as opposed to the actual tblCART table because many users are populating tblCART)

--establish an explicit transaction wrapper to hold insert activity into tblORDER and
tblLINE_ITEM in a single statement; this allows everything to be rolled-back together
 if there is an error
*/


-- SET XACT_ABORT ON will render the transaction uncommittable
-- when the constraint violation occurs.
SET XACT_ABORT ON;

BEGIN TRY

BEGIN TRANSACTION G1

INSERT INTO tblORDER ([CustID],[OrderDate])
VALUES (@CustID, GetDate())

SET @OrderID = (SELECT Scope_Identity())

WHILE @Count > 0 --begin loop to process all rows from #CART; @Count is number of rows to be processed
             BEGIN
                    SET @ID = (SELECT MIN(tmpCartID) FROM @CART)
                    SET @ProdID = (SELECT TOP 1 ProdID FROM @CART WHERE tmpCartID = @ID)
                    SET @Qty = (SELECT Qty FROM @CART WHERE tmpCartID = @ID)


             --'old-school'error-handling method
             -- sp_addmessage 50011, 11, 'OrderID cannot be NULL' was previously added to system

             IF @OrderID IS NULL
                    BEGIN
                           RAISERROR (50011, 11, 1)
                    END
             ELSE
            


             --'New School' error-handling
             --need to make sure there is a value in @ProdID variable
             IF @ProdID IS NULL
                           THROW 50012, 'ProdID cannot be NULL.', 1;
                           --BREAK --exit WHILE loop if there is no value in @ProdID
             ELSE
             -- if things are good so far, issue INSERT statement in tblLINE_ITEM
             INSERT INTO tblLINE_ITEM ([OrderID],[ProdID],[Qty])
                    VALUES (@OrderID, @ProdID, @Qty)

             -- we MUST clean-up the row just INSERTed into tblLINE_ITEM by DELETING it from #CART
             -- or else we will see it again and enter duplicate rows in tblLINE_ITEM
             DELETE
             FROM @CART
             WHERE tmpCartID = @ID --anchoring to @ID ensures we are deleting only one row

             -- we must also decrement the boolean variable that keeps the loop alive; if we do not have
             -- this line then the loop will never reach zero and run infinitely
             SET @Count = @Count -1

END

-- If the INSERT operation into tblORDER and tblLINE_ITEM succeeds, commit the transaction.
-- The CATCH block will not execute if there are no errors.

IF @@ERROR <> 0 --just looking for any global errors at this time
       BEGIN
             ROLLBACK TRANSACTION G1
       END
ELSE
    -- Test whether the transaction is active and valid.
    IF (XACT_STATE()) = 1
    BEGIN
        PRINT 'The transaction is committable.' +
              ' Committing transaction.'
        COMMIT TRANSACTION G1;
       END

--DELETE rows from tbl that have just been processed
-- conduct a count to make sure number of rows processed is equal to the number of rows to be deleted

PRINT @@Rowcount
DELETE
FROM tblCART
WHERE CustID = @CustID

END TRY

BEGIN CATCH
    -- Test XACT_STATE for 0 or -1
    -- If -1, the transaction is uncommittable and should be rolled back
    -- XACT_STATE = 0 means there is no transaction and a commit or rollback operation would generate an error

    -- Test whether the transaction is uncommittable.
    IF (XACT_STATE()) = -1
    BEGIN
        PRINT 'The transaction is in an uncommittable state.' +
              ' Rolling back transaction.'
             SELECT
                    ERROR_NUMBER() AS ErrorNumber
                ,ERROR_MESSAGE() AS ErrorMessage;
        ROLLBACK TRANSACTION G1;
    END;

END CATCH;


/*
Import spreadsheet posted on Canvas call SAMPLE_CUSTOMER_LIST

After importing list into SQL Server, write a query to copy the data into tblCUSTOMER

*/


USE [POPULATING_CART_EXAMPLE]
GO

INSERT INTO [dbo].[tblCUSTOMER]
           ([CustomerFname]
           ,[CustomerLname]
           ,[CustomerAddress]
           ,[CustomerCity]
           ,[CustomerCounty]
           ,[CustomerState]
           ,[CustomerZIP]
           ,[AreaCode]
           ,[Email]
           ,[BusinessName]
           ,[DateOfBirth]
           ,[PhoneNum])
SELECT [CustomerFname], [CustomerLname],[CustomerAddress],[CustomerCity],
[CustomerCounty], [CustomerState],[CustomerZIP],[AreaCode],[Email],
[BusinessName], [DateOfBirth],[PhoneNum]
FROM <<NameOfImportedTable_Here>>
GO











/*
Example execution to find CustID from [tblCUSTOMER]
*/

DECLARE @GetDate DateTime = (SELECT GetDate())
DECLARE @CustID_OUT INT

EXEC uspFINDCustID
@Fname = 'Emilia',
@Lname = 'Fontanetta',
@DOB = '1976-04-28',
@Zip = 62869,
@CustID = @CustID_OUT OUT


-- Add items to cart with CustID just captured by running the
-- block of code starting with the two DECLARE statements above
-- and include all of the calls of uspPopCart below
-- Also, after populating tblCART, select * FROM tblCART to view contents to notice duplicate productIDs in multiple rows
-- as that is how the data was entered

EXEC uspPopCart
	 @ProdName = 'Premium Radial JT51',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 2

EXEC uspPopCart
	 @ProdName = 'Cheese Burger',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Cheese Burger',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Premium Radial JT51',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 2

EXEC uspPopCart
	 @ProdName = 'Super VX-12 Home Stereo',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Super VX-12 Home Stereo',
	 @CustID = @CustID_OUT,
	 @Date = @GetDate,
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Diet Coke',
	 @CustID = @CustID_OUT,
	 @Date = '12-03-2015',
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Curly Fries',
	 @CustID = @CustID_OUT,
	 @Date = '1-12-2016',
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Diet Coke',
	 @CustID = @CustID_OUT,
	 @Date = '12-03-2015',
	 @Qty = 1

EXEC uspPopCart
	 @ProdName = 'Curly Fries',
	 @CustID = @CustID_OUT,
	 @Date = '1-12-2016',
	 @Qty = 1


/*
Example execution to process the contents of tblCART for a single customer

Be sure to pass the same columns that were used to populate tblCART

After processing, SELECT * FROM tblLINE_ITEM to view processed order that has had productIDs summarized
*/



DECLARE @CustID_OUT INT

EXEC uspFINDCustID
@Fname = 'Emilia',
@Lname = 'Fontanetta',
@DOB = '1976-04-28',
@Zip = 62869,
@CustID = @CustID_OUT OUT

EXEC uspProcessTMP_Cart  @CustID = @CustID_OUT
