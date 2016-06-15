USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_CUSTOMER]    Script Date: 5/24/2016 2:53:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE CUSTOMER*/
ALTER PROCEDURE [dbo].[USP_ADD_CUSTOMER]
@NumberofCustomers Int
AS
DECLARE @typeCount INT = (SELECT COUNT(*) FROM  CUSTOMER_Type)
BEGIN TRAN G1
    While @NumberofCustomers > 0
    BEGIN
        DECLARE @Name varchar(100) = (Select CustomerName From [dbo].[Temp$] Where ID = @NumberofCustomers)
        DECLARE @CustomerTypeID INT = ROUND(((@typeCount - 1) * RAND() + 1), 0) --random number for customer type between 1 and number of types
        DECLARE @Street varchar(200) = (Select CustomerAddress From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand() * 200 + 1,0))
        DECLARE @City varchar(100) = (Select CustomerCity From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand() * 200 + 1,0))
        DECLARE @Country varchar(200) = (Select CountryName From [dbo].[Temp$] Where ID = Round(Rand() * 15 + 1,0))
        INSERT INTO Customer(Name, CustomerTypeID, Street, City, Country)
                VALUES(@Name, @CustomerTypeID, @Street, @City, @Country)
        SET @NumberofCustomers = @NumberofCustomers - 1

    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1


USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_CUSTOMER_CONTACT]    Script Date: 5/24/2016 2:53:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE CUSTOMER CONTACT*/
ALTER PROCEDURE [dbo].[USP_ADD_CUSTOMER_CONTACT]
@NumberofContacts Int
AS
BEGIN TRAN G1
    While @NumberofContacts > 0
    BEGIN
        Declare @FName varchar(25) = (Select CustomerFname From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofContacts)
        Declare @LName varchar(25) = (Select CustomerLName From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofContacts)
        Declare @Phone varchar(20) = (Select PhoneNum From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofContacts)
        Declare @Email varchar(100) = (Select Email From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofContacts)
        Declare @CustomerID Int = (Select CustomerID From [dbo].[Customer] Where CustomerID = Round(Rand()*56 + 1,0))
        Insert Into Customer_Contact(FirstName, LastName, Phone, Email, CustomerID)
        Values (@FName, @LName, @Phone, @Email, @CustomerID)
        Set @NumberofContacts = @NumberofContacts - 1
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1




USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_CUSTOMER_TYPE]    Script Date: 5/24/2016 2:54:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*POPULATE CUSTOMER_TYPE*/
ALTER PROCEDURE [dbo].[USP_ADD_CUSTOMER_TYPE]
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  CUSTOMER_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1


USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_EMPLOYEE]    Script Date: 5/24/2016 2:54:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE EMPLOYEE*/
ALTER PROCEDURE [dbo].[USP_ADD_EMPLOYEE]
@NumberofEmployees Int
AS
BEGIN TRAN G1
    While @NumberofEmployees > 0
    BEGIN
        Declare @FName varchar(25) = (Select CustomerFname From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofEmployees)
        Declare @LName varchar(25) = (Select CustomerLName From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofEmployees)
        Declare @Phone varchar(20) = (Select PhoneNum From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofEmployees)
        Declare @Email varchar(100) = (Select Email From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = @NumberofEmployees)
        Declare @StartDate date = DATEADD(year,-1,GETDATE())
        Insert Into Employee(FirstName, LastName, Phone, Email, StartDate)
        Values (@FName, @LName, @Phone, @Email, @StartDate)
        Set @NumberofEmployees = @NumberofEmployees - 1
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1


USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_EMPLOYEE_POSITION]    Script Date: 5/24/2016 2:55:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE EMPLOYEE_POSITION*/
ALTER PROCEDURE [dbo].[USP_ADD_EMPLOYEE_POSITION]
@NumberofEmployeePositions Int
AS
BEGIN TRAN G1
    While @NumberofEmployeePositions > 0
    BEGIN
        Declare @EmployeeCount Int = (Select Count(*) From Employee)
        Declare @PositionCount Int = (Select Count(*) From Position)
        If @EmployeeCount = 0 or @PositionCount = 0
            ROLLBACK TRAN G1
        Else
            Begin
                Declare @EmployeeID Int = Round((Rand()*(@EmployeeCount-1)+1),0)
                Declare @PositionID Int = Round((Rand()*(@PositionCount-1)+1),0)
                Insert Into Employee_Position(EmployeeID, PositionID)
                Values (@EmployeeID, @PositionID)
            End
        Set @NumberofEmployeePositions = @NumberofEmployeePositions - 1
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1


USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_EMPLOYEE_POSITION_LOCATION]    Script Date: 5/24/2016 2:55:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE EMPLOYEE_POSITION_LOCATION*/
ALTER PROCEDURE [dbo].[USP_ADD_EMPLOYEE_POSITION_LOCATION]
@NumberofEmployeePositionLocations Int
AS
BEGIN TRAN G1
    While @NumberofEmployeePositionLocations > 0
    BEGIN
        Declare @EmployeePositionCount Int = (Select Count(*) From Employee_Position)
        Declare @LocationCount Int = (Select Count(*) From Location)
        If @EmployeePositionCount = 0 or @LocationCount = 0
            ROLLBACK TRAN G1
        Else
            Begin
                Declare @StartDate date = DATEADD(year, -1, GETDATE())
                Declare @EmployeePositionID Int = Round((Rand()*(@EmployeePositionCount-1)+1),0)
                Declare @LocationID Int = Round((Rand()*(@LocationCount-1)+1),0)
                Insert Into Employee_Position_Location(StartDate, EmployeePositionID, LocationID)
                Values (@StartDate, @EmployeePositionID, @LocationID)
            End
        Set @NumberofEmployeePositionLocations = @NumberofEmployeePositionLocations - 1
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1


USE [SKI_BOARD_MFG]
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_EQUIPMENT]    Script Date: 5/24/2016 3:01:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE EQUIPMENT*/
ALTER procedure [dbo].[USP_ADD_EQUIPMENT]

as

declare @count int = 1
declare @number int
declare @name varchar(100)
declare @typeid int

begin tran g1

while @count < 51
    begin
    set @number = ROUND(RAND() * 1 + 1, 0)
    set @name = (select EquipmentName from Temp$ where ID = @count)
    set @typeid = @number
    

    insert into Equipment(Name, Descr, EquipmentTypeID)
    values(@name, null, @typeid)

    set @count = @count + 1
    end

if @@error <> 0
rollback tran g1
else 
commit tran g1