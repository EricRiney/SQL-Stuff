/*CREATE DATABASE*/
USE Master
GO
CREATE DATABASE [SKI_BOARD_MFG]
GO
USE [SKI_BOARD_MFG]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') AND type in (N'U'))
    DROP TABLE [dbo].[Inventory]
GO
CREATE TABLE [dbo].[Inventory] (
[InventoryID] int  identity(1,1)  NOT NULL  
, [LocationID] int  NOT NULL  
, [ChangeDate] date NOT NULL
)
GO

ALTER TABLE [dbo].[Inventory] ADD CONSTRAINT [Inventory_PK] PRIMARY KEY CLUSTERED (
[InventoryID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Address]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier_Address]
GO
CREATE TABLE [dbo].[Supplier_Address] (
[SupplierAddressID] int  identity(1,1)  NOT NULL  
, [Street] varchar(100)  NOT NULL  
, [City] varchar(100)  NOT NULL  
, [State/Provence] varchar(100)  NULL  
, [Country] varchar(100)  NOT NULL  
, [Zipcode] varchar(100)  NULL  
, [SupplierID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Supplier_Address] ADD CONSTRAINT [Supplier_Address_PK] PRIMARY KEY CLUSTERED (
[SupplierAddressID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer] (
[CustomerID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [CustomerTypeID] int  NOT NULL  
, [Street] varchar(200)  NOT NULL  
, [City] varchar(100)  NOT NULL  
, [State/Provence] varchar(200)  NULL  
, [Country] varchar(200)  NOT NULL  
, [ZipCode] varchar(100)  NULL  
)
GO

ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED (
[CustomerID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Material_Type]
GO
CREATE TABLE [dbo].[Material_Type] (
[MaterialTypeID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
)
GO

ALTER TABLE [dbo].[Material_Type] ADD CONSTRAINT [Material_Type_PK] PRIMARY KEY CLUSTERED (
[MaterialTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Order]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier_Order]
GO
CREATE TABLE [dbo].[Supplier_Order] (
[SupplierOrderID] int identity(1,1)  NOT NULL  
, [SupplierID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Supplier_Order] ADD CONSTRAINT [Supplier_Order_PK] PRIMARY KEY CLUSTERED (
[SupplierOrderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Line_Item]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier_Line_Item]
GO
CREATE TABLE [dbo].[Supplier_Line_Item] (
[SupplierLineItemlID] int identity(1,1)  NOT NULL  
, [MaterialID] int  NOT NULL  
, [SupplierOrderID] int  NOT NULL  
, [Quantity] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Supplier_Line_Item] ADD CONSTRAINT [Supplier_Line_Item_PK] PRIMARY KEY CLUSTERED (
[SupplierLineItemlID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier_Type]
GO
CREATE TABLE [dbo].[Supplier_Type] (
[SupplierTypeID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
)
GO

ALTER TABLE [dbo].[Supplier_Type] ADD CONSTRAINT [Supplier_Type_PK] PRIMARY KEY CLUSTERED (
[SupplierTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Contact]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer_Contact]
GO
CREATE TABLE [dbo].[Customer_Contact] (
[CustomerContactID] int identity(1,1)  NOT NULL  
, [FirstName] varchar(100)  NOT NULL  
, [LastName] varchar(100)  NOT NULL  
, [Phone] varchar(100)  NOT NULL  
, [Email] varchar(100)  NOT NULL  
, [CustomerID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Customer_Contact] ADD CONSTRAINT [Customer_Contact_PK] PRIMARY KEY CLUSTERED (
[CustomerContactID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location_Equipment]') AND type in (N'U'))
    DROP TABLE [dbo].[Location_Equipment]
GO
CREATE TABLE [dbo].[Location_Equipment] (
[LocationEquipmentID] int identity(1,1)  NOT NULL  
, [LocationID] int  NOT NULL  
, [EquipmentID] int  NOT NULL
, [Quantity] int NOT NULL  
)
GO

ALTER TABLE [dbo].[Location_Equipment] ADD CONSTRAINT [Location_Equipment_PK] PRIMARY KEY CLUSTERED (
[LocationEquipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factory]') AND type in (N'U'))
    DROP TABLE [dbo].[Factory]
GO
CREATE TABLE [dbo].[Factory] (
[LocationID] int  NOT NULL  
, [PowerUsage] int  NOT NULL  
, [ProductionRate] varchar(100)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Factory] ADD CONSTRAINT [Factory_PK] PRIMARY KEY CLUSTERED (
[LocationID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
    DROP TABLE [dbo].[Location]
GO
CREATE TABLE [dbo].[Location] (
[LocationID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Street] varchar(200)  NOT NULL  
, [City] varchar(100)  NOT NULL  
, [State/Provence] varchar(200)  NULL  
, [Country] varchar(200)  NOT NULL  
, [ZipCode] varchar(100)  NULL  
)
GO

ALTER TABLE [dbo].[Location] ADD CONSTRAINT [Location_PK] PRIMARY KEY CLUSTERED (
[LocationID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
    DROP TABLE [dbo].[Warehouse]
GO
CREATE TABLE [dbo].[Warehouse] (
[LocationID] int NOT NULL  
, [SquareFootage] int  NOT NULL  
, [TruckBays] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Warehouse] ADD CONSTRAINT [Warehouse_PK] PRIMARY KEY CLUSTERED (
[LocationID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer_Type]
GO
CREATE TABLE [dbo].[Customer_Type] (
[CustomerTypeID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
)
GO

ALTER TABLE [dbo].[Customer_Type] ADD CONSTRAINT [Customer_Type_PK] PRIMARY KEY CLUSTERED (
[CustomerTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier]
GO
CREATE TABLE [dbo].[Supplier] (
[SupplierID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [SupplierTypeID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Supplier] ADD CONSTRAINT [Supplier_PK] PRIMARY KEY CLUSTERED (
[SupplierID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Line_Item_Shipment]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer_Line_Item_Shipment]
GO
CREATE TABLE [dbo].[Customer_Line_Item_Shipment] (
[CustomerLineItemShipmentID] int identity(1,1)  NOT NULL  
, [CustomerLineItemID] int  NOT NULL  
, [LineItemShipmentID] int  NULL  
)
GO

ALTER TABLE [dbo].[Customer_Line_Item_Shipment] ADD CONSTRAINT [Customer_Line_Item_Shipment_PK] PRIMARY KEY CLUSTERED (
[CustomerLineItemShipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Contact]') AND type in (N'U'))
    DROP TABLE [dbo].[Supplier_Contact]
GO
CREATE TABLE [dbo].[Supplier_Contact] (
[SupplierContactID] int identity(1,1)  NOT NULL  
, [FirstName] varchar(100)  NOT NULL  
, [LastName] varchar(100)  NOT NULL  
, [Phone] varchar(100)  NOT NULL  
, [Email] varchar(100)  NOT NULL  
, [SupplierID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Supplier_Contact] ADD CONSTRAINT [Supplier_Contact_PK] PRIMARY KEY CLUSTERED (
[SupplierContactID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Order]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer_Order]
GO
CREATE TABLE [dbo].[Customer_Order] (
[CustomerOrderID] int identity(1,1)  NOT NULL  
, [Date] datetime  NOT NULL  
, [CustomerID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Customer_Order] ADD CONSTRAINT [Customer_Order_PK] PRIMARY KEY CLUSTERED (
[CustomerOrderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Position_Location]') AND type in (N'U'))
    DROP TABLE [dbo].[Employee_Position_Location]
GO
CREATE TABLE [dbo].[Employee_Position_Location] (
[EmployeePositionLocationID] int identity(1,1)  NOT NULL  
, [StartDate] datetime  NOT NULL  
, [EndDate] datetime  NULL  
, [EmployeePositionID] int  NOT NULL  
, [LocationID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Employee_Position_Location] ADD CONSTRAINT [Employee_Position_Location_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionLocationID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Equipment]') AND type in (N'U'))
    DROP TABLE [dbo].[Equipment]
GO
CREATE TABLE [dbo].[Equipment] (
[EquipmentID] int identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
, [EquipmentTypeID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Equipment] ADD CONSTRAINT [Equipment_PK] PRIMARY KEY CLUSTERED (
[EquipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Line_Item]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer_Line_Item]
GO
CREATE TABLE [dbo].[Customer_Line_Item] (
[CustomerLineItemID] int identity(1,1)  NOT NULL  
, [ProductID] int  NOT NULL  
, [CustomerOrderID] int  NOT NULL  
, [Quantity] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Customer_Line_Item] ADD CONSTRAINT [Customer_Line_Item_PK] PRIMARY KEY CLUSTERED (
[CustomerLineItemID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Equipment_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Equipment_Type]
GO
CREATE TABLE [dbo].[Equipment_Type] (
[EquipmentTypeID] int  identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
)
GO

ALTER TABLE [dbo].[Equipment_Type] ADD CONSTRAINT [Equipment_Type_PK] PRIMARY KEY CLUSTERED (
[EquipmentTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Product_Type]
GO
CREATE TABLE [dbo].[Product_Type] (
[ProductTypeID] int  identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
)
GO

ALTER TABLE [dbo].[Product_Type] ADD CONSTRAINT [Product_Type_PK] PRIMARY KEY CLUSTERED (
[ProductTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
    DROP TABLE [dbo].[Product]
GO
CREATE TABLE [dbo].[Product] (
[ProductID] int  identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Price] smallmoney  NOT NULL  
, [Cost] smallmoney  NOT NULL  
, [Color] varchar(100)  NOT NULL  
, [Weight] varchar(100)  NOT NULL  
, [Model] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
, [ProductTypeID] int  NOT NULL  
, [MaterialID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Product] ADD CONSTRAINT [Product_PK] PRIMARY KEY CLUSTERED (
[ProductID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipment]') AND type in (N'U'))
    DROP TABLE [dbo].[Shipment]
GO
CREATE TABLE [dbo].[Shipment] (
[ShipmentID] int  identity(1,1)  NOT NULL  
, [LocationID] int  NULL  
)
GO

ALTER TABLE [dbo].[Shipment] ADD CONSTRAINT [Shipment_PK] PRIMARY KEY CLUSTERED (
[ShipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Line_Item_Shipment]') AND type in (N'U'))
    DROP TABLE [dbo].[Line_Item_Shipment]
GO
CREATE TABLE [dbo].[Line_Item_Shipment] (
[LineItemShipmentID] int  identity(1,1)  NOT NULL  
, [Date] datetime  NOT NULL  
, [ShipmentID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Line_Item_Shipment] ADD CONSTRAINT [Line_Item_Shipment_PK] PRIMARY KEY CLUSTERED (
[LineItemShipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Position]') AND type in (N'U'))
    DROP TABLE [dbo].[Position]
GO
CREATE TABLE [dbo].[Position] (
[PositionID] int  identity(1,1)  NOT NULL  
, [Title] varchar(100)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Position] ADD CONSTRAINT [Position_PK] PRIMARY KEY CLUSTERED (
[PositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material]') AND type in (N'U'))
    DROP TABLE [dbo].[Material]
GO
CREATE TABLE [dbo].[Material] (
[MaterialID] int  identity(1,1)  NOT NULL  
, [Name] varchar(100)  NOT NULL  
, [Descr] varchar(200)  NULL  
, [MaterialTypeID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Material] ADD CONSTRAINT [Material_PK] PRIMARY KEY CLUSTERED (
[MaterialID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Position]') AND type in (N'U'))
    DROP TABLE [dbo].[Employee_Position]
GO
CREATE TABLE [dbo].[Employee_Position] (
[EmployeePositionID] int  identity(1,1)  NOT NULL  
, [PositionID] int  NOT NULL  
, [EmployeeID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Employee_Position] ADD CONSTRAINT [Employee_Position_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionID]
)
GO

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
    DROP TABLE [dbo].[Employee]
GO
CREATE TABLE [dbo].[Employee] (
[EmployeeID] int  identity(1,1)  NOT NULL  
, [FirstName] varchar(100)  NOT NULL  
, [LastName] varchar(100)  NOT NULL  
, [Phone] varchar(100)  NOT NULL  
, [Email] varchar(100)  NOT NULL  
, [StartDate] datetime  NOT NULL  
, [EndDate] datetime  NULL  
)
GO

ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED (
[EmployeeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Material_Inventory]') AND type in (N'U'))
    DROP TABLE [dbo].[Material_Inventory]
GO
CREATE TABLE [dbo].[Material_Inventory] (
[MaterialInventoryID] int  identity(1,1)  NOT NULL  
, [MaterialID] int  NOT NULL  
, [InventoryID] int  NOT NULL  
, [Quantity] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Material_Inventory] ADD CONSTRAINT [Material_Inventory_PK] PRIMARY KEY CLUSTERED (
[MaterialInventoryID]
)
GO
GO

ALTER TABLE [dbo].[Inventory] WITH CHECK ADD CONSTRAINT [Warehouse_Inventory_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Warehouse] (
[LocationID]
)
GO

ALTER TABLE [dbo].[Supplier_Address] WITH CHECK ADD CONSTRAINT [Supplier_Supplier_Address_FK1] FOREIGN KEY (
[SupplierID]
)
REFERENCES [dbo].[Supplier] (
[SupplierID]
)
GO

ALTER TABLE [dbo].[Customer] WITH CHECK ADD CONSTRAINT [Customer_Type_Customer_FK1] FOREIGN KEY (
[CustomerTypeID]
)
REFERENCES [dbo].[Customer_Type] (
[CustomerTypeID]
)
GO

GO

ALTER TABLE [dbo].[Supplier_Order] WITH CHECK ADD CONSTRAINT [Supplier_Supplier_Order_FK1] FOREIGN KEY (
[SupplierID]
)
REFERENCES [dbo].[Supplier] (
[SupplierID]
)
GO

ALTER TABLE [dbo].[Supplier_Line_Item] WITH CHECK ADD CONSTRAINT [Supplier_Order_Supplier_Line_Item_FK1] FOREIGN KEY (
[SupplierOrderID]
)
REFERENCES [dbo].[Supplier_Order] (
[SupplierOrderID]
)
ALTER TABLE [dbo].[Supplier_Line_Item] WITH CHECK ADD CONSTRAINT [Material_Supplier_Line_Item_FK1] FOREIGN KEY (
[MaterialID]
)
REFERENCES [dbo].[Material] (
[MaterialID]
)
GO

GO

ALTER TABLE [dbo].[Customer_Contact] WITH CHECK ADD CONSTRAINT [Customer_Customer_Contact_FK1] FOREIGN KEY (
[CustomerID]
)
REFERENCES [dbo].[Customer] (
[CustomerID]
)
GO

ALTER TABLE [dbo].[Location_Equipment] WITH CHECK ADD CONSTRAINT [Equipment_Location_Equipment_FK1] FOREIGN KEY (
[EquipmentID]
)
REFERENCES [dbo].[Equipment] (
[EquipmentID]
)
ALTER TABLE [dbo].[Location_Equipment] WITH CHECK ADD CONSTRAINT [Factory_Location_Equipment_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Factory] (
[LocationID]
)
GO

ALTER TABLE [dbo].[Factory] WITH CHECK ADD CONSTRAINT [Location_Factory_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Location] (
[LocationID]
)
GO

GO

ALTER TABLE [dbo].[Warehouse] WITH CHECK ADD CONSTRAINT [Location_Warehouse_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Location] (
[LocationID]
)
GO

GO

ALTER TABLE [dbo].[Supplier] WITH CHECK ADD CONSTRAINT [Supplier_Type_Supplier_FK1] FOREIGN KEY (
[SupplierTypeID]
)
REFERENCES [dbo].[Supplier_Type] (
[SupplierTypeID]
)
GO

ALTER TABLE [dbo].[Customer_Line_Item_Shipment] WITH CHECK ADD CONSTRAINT [Customer_Line_Item_Customer_Line_Item_Shipment_FK1] FOREIGN KEY (
[CustomerLineItemID]
)
REFERENCES [dbo].[Customer_Line_Item] (
[CustomerLineItemID]
)
ALTER TABLE [dbo].[Customer_Line_Item_Shipment] WITH CHECK ADD CONSTRAINT [Line_Item_Shipment_Customer_Line_Item_Shipment_FK1] FOREIGN KEY (
[LineItemShipmentID]
)
REFERENCES [dbo].[Line_Item_Shipment] (
[LineItemShipmentID]
)
GO

ALTER TABLE [dbo].[Supplier_Contact] WITH CHECK ADD CONSTRAINT [Supplier_Supplier_Contact_FK1] FOREIGN KEY (
[SupplierID]
)
REFERENCES [dbo].[Supplier] (
[SupplierID]
)
GO

ALTER TABLE [dbo].[Customer_Order] WITH CHECK ADD CONSTRAINT [Customer_Customer_Order_FK1] FOREIGN KEY (
[CustomerID]
)
REFERENCES [dbo].[Customer] (
[CustomerID]
)
GO

ALTER TABLE [dbo].[Employee_Position_Location] WITH CHECK ADD CONSTRAINT [Employee_Position_Employee_Position_Location_FK1] FOREIGN KEY (
[EmployeePositionID]
)
REFERENCES [dbo].[Employee_Position] (
[EmployeePositionID]
)
ALTER TABLE [dbo].[Employee_Position_Location] WITH CHECK ADD CONSTRAINT [Location_Employee_Position_Location_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Location] (
[LocationID]
)
GO

ALTER TABLE [dbo].[Equipment] WITH CHECK ADD CONSTRAINT [Equipment_Type_Equipment_FK1] FOREIGN KEY (
[EquipmentTypeID]
)
REFERENCES [dbo].[Equipment_Type] (
[EquipmentTypeID]
)
GO

ALTER TABLE [dbo].[Customer_Line_Item] WITH CHECK ADD CONSTRAINT [Product_Customer_Line_Item_FK1] FOREIGN KEY (
[ProductID]
)
REFERENCES [dbo].[Product] (
[ProductID]
)
ALTER TABLE [dbo].[Customer_Line_Item] WITH CHECK ADD CONSTRAINT [Customer_Order_Customer_Line_Item_FK1] FOREIGN KEY (
[CustomerOrderID]
)
REFERENCES [dbo].[Customer_Order] (
[CustomerOrderID]
)
GO

GO

GO

ALTER TABLE [dbo].[Product] WITH CHECK ADD CONSTRAINT [Material_Product_FK1] FOREIGN KEY (
[MaterialID]
)
REFERENCES [dbo].[Material] (
[MaterialID]
)
ALTER TABLE [dbo].[Product] WITH CHECK ADD CONSTRAINT [Product_Type_Product_FK1] FOREIGN KEY (
[ProductTypeID]
)
REFERENCES [dbo].[Product_Type] (
[ProductTypeID]
)
GO

ALTER TABLE [dbo].[Shipment] WITH CHECK ADD CONSTRAINT [Factory_Shipment_FK1] FOREIGN KEY (
[LocationID]
)
REFERENCES [dbo].[Factory] (
[LocationID]
)
GO

ALTER TABLE [dbo].[Line_Item_Shipment] WITH CHECK ADD CONSTRAINT [Shipment_Line_Item_Shipment_FK1] FOREIGN KEY (
[ShipmentID]
)
REFERENCES [dbo].[Shipment] (
[ShipmentID]
)
GO

ALTER TABLE [dbo].[Material] WITH CHECK ADD CONSTRAINT [Material_Type_Material_FK1] FOREIGN KEY (
[MaterialTypeID]
)
REFERENCES [dbo].[Material_Type] (
[MaterialTypeID]
)
GO

ALTER TABLE [dbo].[Employee_Position] WITH CHECK ADD CONSTRAINT [Employee_Employee_Position_FK1] FOREIGN KEY (
[EmployeeID]
)
REFERENCES [dbo].[Employee] (
[EmployeeID]
)
ALTER TABLE [dbo].[Employee_Position] WITH CHECK ADD CONSTRAINT [Position_Employee_Position_FK1] FOREIGN KEY (
[PositionID]
)
REFERENCES [dbo].[Position] (
[PositionID]
)
GO

GO

ALTER TABLE [dbo].[Material_Inventory] WITH CHECK ADD CONSTRAINT [Material_Material_Inventory_FK1] FOREIGN KEY (
[MaterialID]
)
REFERENCES [dbo].[Material] (
[MaterialID]
)
ALTER TABLE [dbo].[Material_Inventory] WITH CHECK ADD CONSTRAINT [Inventory_Material_Inventory_FK1] FOREIGN KEY (
[InventoryID]
)
REFERENCES [dbo].[Inventory] (
[InventoryID]
)
GO

/*POPULATE CUSTOMER_TYPE*/
CREATE PROCEDURE USP_ADD_CUSTOMER_TYPE
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  CUSTOMER_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

EXECUTE USP_ADD_CUSTOMER_TYPE 'VIP', NULL
EXECUTE USP_ADD_CUSTOMER_TYPE 'Premium', NULL
EXECUTE USP_ADD_CUSTOMER_TYPE 'Discount', NULL

GO

/*POPULATE CUSTOMER*/
CREATE PROCEDURE USP_ADD_CUSTOMER
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

GO

EXECUTE USP_ADD_CUSTOMER 56

GO

/*POPULATE CUSTOMER CONTACT*/
CREATE PROCEDURE USP_ADD_CUSTOMER_CONTACT
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

GO

EXECUTE USP_ADD_CUSTOMER_CONTACT 888

GO 

/*POPULATE MATERIAL_TYPE*/
CREATE PROCEDURE USP_ADD_MATERIAL_TYPE
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  MATERIAL_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

execute USP_ADD_MATERIAL_TYPE 'Organic', null
execute USP_ADD_MATERIAL_TYPE 'Non-organic', null

GO

/*POPULATE MATERIAL*/
CREATE PROCEDURE USP_ADD_MATERIAL
@NAME varchar(100),
@DESCR VARCHAR(200),
@TYPE varchar(100)

AS

DECLARE @MATERIALTYPEID INT

BEGIN TRAN G1

SET @MATERIALTYPEID = (SELECT MaterialTypeID FROM MATERIAL_TYPE WHERE Name = @TYPE)

INSERT INTO  MATERIAL(NAME, DESCR, MATERIALTYPEID)
VALUES (@NAME, @DESCR, @MATERIALTYPEID)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

execute USP_ADD_MATERIAL 'Wood', 'Hard fibrous material that forms the main substance for well balanced snowboards and skis', 'Organic'
execute USP_ADD_MATERIAL 'Foam', 'Lightweight material used for boards to lose their camber quickly and allows  low stress areas of core snowboards and skis', 'Non-organic'
execute USP_ADD_MATERIAL 'Fiberglass', 'Glassfiber material sheets are impregnated with resin, which holds the snowboards and skis together and gives them higher strength' , 'Non-organic'
execute USP_ADD_MATERIAL 'Steel', 'Stiff stainless steel inserts that are built into a snowboard or ski for the binding holes and heavier weight', 'Non-organic'
execute USP_ADD_MATERIAL 'Plastic', 'Strong, reasonably light, good under tension, and a good dampener material for sleek snowboard and ski models', 'Non-organic'

GO

/*POPULATE PRODUCT_TYPE*/
CREATE PROCEDURE USP_ADD_PRODUCT_TYPE
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  PRODUCT_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

execute USP_ADD_PRODUCT_TYPE 'Snowboard', null
execute USP_ADD_PRODUCT_TYPE 'Ski', null

GO

/*POPULATE PRODUCT*/
create procedure USP_ADD_PRODUCT
as

declare @count int = 1
declare @number int = 1
declare @name varchar(100)
declare @price smallmoney
declare @cost smallmoney
declare @color varchar(100)
declare @weight varchar(100)
declare @model varchar(100)
declare @typeid int
declare @material varchar(100)
declare @materialid int

begin tran g1

while @count < 81

if (@count < 41)
begin
    set @name = (select ProductName from Temp$ where ID = @count)
    set @price = (select Price from Temp$ where ID = @count)
    set @cost = (59 + ((ROUND(((5-1) * RAND() + 1), 0)) * 10))
    set @number = ROUND(((7-1) * RAND() + 1), 0)
    set @color = (select Color from Temp$ where ID = @number)
    set @weight = (select Weight from Temp$ where ID = @count)
    set @number = ROUND(((5-1) * RAND() + 1), 0)
    set @model = (select Model from Temp$ where ID = @number)
    set @typeid = (select ProductTypeID from Product_Type where Name like 'Snowboard')
    set @material = (select Material from Temp$ where ID = @number)
    set @materialid = (select MaterialID from Material where Name like @material)
    insert into product(Name, Price, Cost, Color, Weight, Model, ProductTypeID, MaterialID)
    values(@name, @price, @cost, @color, @weight, @model, @typeid, @materialid)

    set @count = @count + 1
end


else if (@count > 40)
begin
    set @name = (select ProductName from Temp$ where ID = @count)
    set @price = (select Price from Temp$ where ID = @count)
    set @cost =  (59 + ((ROUND(((5-1) * RAND() + 1), 0)) * 10))
    set @number = ROUND(((7-1) * RAND() + 1), 0)
    set @color = (select Color from Temp$ where ID = @number)
    set @weight = (select Weight from Temp$ where ID = @count)
    set @number = ROUND(((10-6) * RAND() + 6), 0)
    set @model = (select Model from Temp$ where ID = @number)
    set @typeid = (select ProductTypeID from Product_Type where Name like 'Ski')
    set @number = ROUND(((5-1) * RAND() + 1), 0)
    set @material = (select Material from Temp$ where ID = @number)
    set @materialid = (select MaterialID from Material where Name like @material)
    insert into product(Name, Price, Cost, Color, Weight, Model, ProductTypeID, MaterialID)
    values(@name, @price, @cost, @color, @weight, @model, @typeid, @materialid)

    set @count = @count + 1
end

if @@error<>0
rollback tran g1
else commit tran g1

GO

execute USP_ADD_PRODUCT

GO

/*POPULATE EQUIPMENT_TYPE*/
CREATE PROCEDURE USP_ADD_EQUIPMENT_TYPE
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  EQUIPMENT_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

execute USP_ADD_EQUIPMENT_TYPE 'Automatic', null
execute USP_ADD_EQUIPMENT_TYPE 'Manual', null

GO

/*POPULATE EQUIPMENT*/
create procedure USP_ADD_EQUIPMENT

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

GO

execute USP_ADD_EQUIPMENT

GO

/*POPULATE LOCATION, FACTORY, WAREHOUSE*/
CREATE PROCEDURE USP_ADD_LOCATION
AS
BEGIN TRAN G1
    Declare @NumberofLocations Int = 1
    While @NumberofLocations < 31
    BEGIN
        Begin
            Declare @Name varchar(100) = (Select LocationName From Temp$ where ID = @NumberofLocations)
            Declare @Street varchar(200) = (Select CustomerAddress From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand()*200 + 300,0))
            Declare @City varchar(100) = (Select CustomerCity From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand()*200 + 300,0))
            Declare @State varchar(100) = (Select CustomerState From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand()*200 + 300,0))
            Declare @Country varchar(100) = 'United States'
            Declare @ZipCode varchar(100) = (Select CustomerZIP From CUSTOMER_BUILD.[dbo].[tblCUSTOMER] Where CustomerID = Round(Rand()*200 + 300,0))
            Insert Into Location(Name, Street, City, [State/Provence], Country, ZipCode)
            Values(@Name, @Street, @City, @State, @Country, @ZipCode)
        End

        If (@NumberofLocations < 16)
            Begin
                DECLARE @POWERUSAGE INT
                DECLARE @PRODUCTIONRATE varchar(100)

                SET @POWERUSAGE = (8000 + ((ROUND(((99-1) * (RAND() + 1)), 0) * 33)))
                SET @PRODUCTIONRATE = CAST((ROUND(((99-50) * RAND() + 50),0) * 12) AS VARCHAR ) + ' PER DAY'

                INSERT INTO FACTORY(LocationID, PowerUsage, ProductionRate)
                VALUES(@NumberofLocations, @POWERUSAGE, @PRODUCTIONRATE)
                Set @NumberofLocations = @NumberofLocations + 1
            End
        Else if (@NumberofLocations > 15)
            Begin
                DECLARE @SQUAREFOOTAGE INT
                DECLARE @TRUCKBAYS INT

                SET @SQUAREFOOTAGE = (150000 + ROUND(((99-1) * RAND() + 1),0) * 400)
                SET @TRUCKBAYS = 20 + ROUND(((20-1) * RAND() + 1),0)

                INSERT INTO WAREHOUSE(LocationID, SquareFootage, TruckBays)
                VALUES(@NumberofLocations, @SQUAREFOOTAGE, @TRUCKBAYS)
                Set @NumberofLocations = @NumberofLocations + 1
            End
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

EXECUTE USP_ADD_LOCATION

GO

/*POPULATE EQUIPMENT_LOCATION EQUIPMENT*/
CREATE PROCEDURE USP_ADD_LOCATION_EQUIPMENT

AS

DECLARE @LOCATIONID INT = 1
DECLARE @EQUIPMENTID INT
DECLARE @QUANTITY INT = ROUND(((9 - 1 - 1) * RAND() + 1), 0)
DECLARE @COUNT INT = ROUND(((20 - 12 - 1) * RAND() + 12), 0)

BEGIN TRAN G1

WHILE @LOCATIONID < 16

BEGIN
    WHILE @COUNT > 0
        BEGIN
        SET @EQUIPMENTID = ROUND(((30 - 1 - 1) * RAND() + 1), 0)
        INSERT INTO Location_Equipment(LocationID, EquipmentID, Quantity)
        VALUES(@LOCATIONID, @EQUIPMENTID, @QUANTITY)
        SET @COUNT = @COUNT - 1
        END
    SET @COUNT = ROUND(((20-12) * RAND() + 12), 0)
    SET @LOCATIONID = @LOCATIONID + 1
END

IF @@ERROR<> 0 
ROLLBACK TRAN G1
ELSE
COMMIT TRAN G1

GO

EXECUTE USP_ADD_LOCATION_EQUIPMENT

GO

/*POPULATE EMPLOYEE*/
CREATE PROCEDURE USP_ADD_EMPLOYEE
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

GO

EXECUTE USP_ADD_EMPLOYEE 124

GO

/*POPULATE POSITION*/
CREATE PROCEDURE USP_ADD_POSITION
@Title varchar(100)
AS
BEGIN TRAN G1
    BEGIN
        Insert Into Position(Title)
        Values (@Title)
    END
IF @@ERROR <> 0
    ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

EXECUTE USP_ADD_POSITION 'Production Supervisor'
EXECUTE USP_ADD_POSITION 'Manufacturing Technician'
EXECUTE USP_ADD_POSITION 'Quality Technician'
EXECUTE USP_ADD_POSITION 'Production Manager'
EXECUTE USP_ADD_POSITION 'Maintenance Technician'
EXECUTE USP_ADD_POSITION 'Operations Manager'
EXECUTE USP_ADD_POSITION 'Assembler'
EXECUTE USP_ADD_POSITION 'Inspector'
EXECUTE USP_ADD_POSITION 'Production Scheduler'
EXECUTE USP_ADD_POSITION 'Safety Technician'
EXECUTE USP_ADD_POSITION 'Testing Technician'
EXECUTE USP_ADD_POSITION 'Tool & Die Maker'

GO

/*POPULATE EMPLOYEE_POSITION*/
CREATE PROCEDURE USP_ADD_EMPLOYEE_POSITION
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

GO

EXECUTE USP_ADD_EMPLOYEE_POSITION 124

GO

/*POPULATE EMPLOYEE_POSITION_LOCATION*/
CREATE PROCEDURE USP_ADD_EMPLOYEE_POSITION_LOCATION
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

GO

EXECUTE USP_ADD_EMPLOYEE_POSITION_LOCATION 328

GO

/*POPULATE SUPPLIER_TYPE*/
CREATE PROCEDURE USP_ADD_SUPPLIER_TYPE
@NAME varchar(100),
@DESCR VARCHAR(200)

AS

BEGIN TRAN G1

INSERT INTO  SUPPLIER_TYPE(NAME, DESCR)
VALUES (@NAME, @DESCR)

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

EXEC USP_ADD_SUPPLIER_TYPE 'Wood', 'This supplier provides wood material'
EXEC USP_ADD_SUPPLIER_TYPE 'Foam', 'This supplier provides foam material'
EXEC USP_ADD_SUPPLIER_TYPE 'Fiberglass', 'This supplier provides fiberglass material'
EXEC USP_ADD_SUPPLIER_TYPE 'Steel', 'This supplier provides steel material'
EXEC USP_ADD_SUPPLIER_TYPE 'Plastic', 'This supplier provides plastic material'

GO

/*POPULATE SUPPLIER*/
CREATE PROCEDURE USP_ADD_SUPPLIER
@Name varchar(100),
@SupplierTypeID INT

AS
BEGIN TRANSACTION G1
INSERT INTO SUPPLIER(Name, SupplierTypeID)
        VALUES(@Name, @SupplierTypeID)
IF @@ERROR <> 0
ROLLBACK TRANSACTION G1
ELSE
COMMIT TRANSACTION G1

GO

EXEC USP_ADD_SUPPLIER 'Great American Supplier', 5
EXEC USP_ADD_SUPPLIER 'Raw Materials US', 3
EXEC USP_ADD_SUPPLIER 'Lumber Industries', 1
EXEC USP_ADD_SUPPLIER 'New Fiberglass Inc', 3
EXEC USP_ADD_SUPPLIER 'Foam Solutions Inc', 2
EXEC USP_ADD_SUPPLIER 'American Steel', 4

GO

/*POPULATE SUPPLIER CONTACT*/
CREATE PROCEDURE USP_ADD_SUPPLIER_CONTACT
@NumberOfContacts INT

AS
BEGIN TRANSACTION G1
DECLARE @SupplierCount INT = (SELECT MAX(SupplierID) FROM SUPPLIER)
DECLARE @SupplierMin INT = (SELECT MIN(SupplierID) FROM SUPPLIER)
WHILE @NumberOfContacts > 0
    BEGIN
        DECLARE @FName varchar(100) = (SELECT CustomerFname FROM CUSTOMER_BUILD.dbo.tblCUSTOMER WHERE CustomerID = ROUND(((1000 - 1) * RAND() + 1), 0))
        DECLARE @LName varchar(100) = (SELECT CustomerLname FROM CUSTOMER_BUILD.dbo.tblCUSTOMER WHERE CustomerID = ROUND(((1000 - 1) * RAND() + 1), 0))
        DECLARE @Phone varchar(100) = (SELECT PhoneNum FROM CUSTOMER_BUILD.dbo.tblCUSTOMER WHERE CustomerID = ROUND(((1000 - 1) * RAND() + 1), 0))
        DECLARE @Email varchar(100) = (SELECT Email FROM CUSTOMER_BUILD.dbo.tblCUSTOMER WHERE CustomerID = ROUND(((1000 - 1) * RAND() + 1), 0))
        INSERT INTO Supplier_Contact(FirstName, LastName, Phone, Email, SupplierID)
                VALUES(@FName, @LName, @Phone, @Email, ROUND(((@SupplierCount - @SupplierMin) * RAND() + @SupplierMin), 0))
        SET @NumberOfContacts = @NumberOfContacts - 1
    END
IF @@ERROR <> 0
ROLLBACK TRANSACTION G1
ELSE
COMMIT TRANSACTION G1

GO

EXEC USP_ADD_SUPPLIER_CONTACT 1000

GO

/*POPULATE SUPPLIER_ADDRESS*/
CREATE PROCEDURE USP_ADD_SUPPLIER_ADDRESS(
@NumberOfAddresses INT
)
AS
BEGIN TRANSACTION G1
WHILE @NumberOfAddresses > 0
BEGIN
    DECLARE @SupplierCount INT = (SELECT MAX(SupplierID) FROM Supplier)
    DECLARE @SupplierMin INT = (SELECT MIN(SupplierID) FROM Supplier)
    DECLARE @Street varchar(100) = (SELECT CustomerAddress FROM CUSTOMER_BUILD.dbo.tblCustomer WHERE CustomerID = @NumberOfAddresses)
    DECLARE @City varchar(100) = (SELECT CityName FROM CUSTOMER_BUILD.dbo.tblCITY_STATE_ZIP WHERE CityStateZipID = @NumberOfAddresses)
    Declare @State varchar(100) = (SELECT StateName FROM CUSTOMER_BUILD.dbo.tblCITY_STATE_ZIP WHERE CityStateZipID = @NumberOfAddresses)
    DECLARE @Country varchar(100) = 'United States'
    DECLARE @ZipCode varchar(100) = (SELECT Zip FROM CUSTOMER_BUILD.dbo.tblCITY_STATE_ZIP WHERE CityStateZipID = @NumberOfAddresses)
    DECLARE @SupplierID INT = (ROUND((RAND() * (@SupplierCount - @SupplierMin) + @SupplierMin), 0))
    INSERT INTO Supplier_Address(Street, City, [State/Provence], Country, Zipcode, SupplierID)
        VALUES(@Street, @City, @State, @Country, @ZipCode, @SupplierID)
    SET @NumberOfAddresses = @NumberOfAddresses - 1
END
IF @@ERROR <> 0
ROLLBACK TRANSACTION G1
ELSE
COMMIT TRANSACTION G1

GO

EXEC USP_ADD_SUPPLIER_ADDRESS 500

GO



/*ADDS ORDERS TO DATABASE*/
create Proc usp_New_Orders
@NumberofOrders Int 
As
Begin Tran G1
Declare @CustomerCount Int = (Select Count(*) From Customer)
If @NumberofOrders > 99
Begin
Set @NumberofOrders = 99
End
While @NumberofOrders > 0
    Begin
        Declare @RAND numeric(16,16) = Rand()
        Declare @CustomerID Int = (Select Case When
        Round(@RAND*@CustomerCount,0) = 0 Then 1
        Else Round(@RAND*@CustomerCount,0)
        End)
        Declare @Date date = GETDATE()
        Insert Into Customer_Order(CustomerID, Date)
        Values(@CustomerID, @Date)
        Declare @OrderID Int = SCOPE_IDENTITY()
        Declare @NumofItems Int = (Select Case When
        Round(@RAND*10,0) = 0 or
        Round(@RAND*10,0) > 100 Then 1
        Else Round(@RAND*10,0)
        End)
        Exec usp_Add_Line_Item @NumofItems, @OrderID
        Set @NumberofOrders = @NumberofOrders -1
    End

If @@ERROR <> 0
Rollback Tran G1
Else Commit Tran G1

go

create Proc usp_Add_Line_Item
@NumberofItems Int,
@OrderID Int
As
Begin Tran G2
Declare @ProductCount Int = (Select Count(*) From Product)
While @NumberofItems > 0
    Begin
        Declare @RAND numeric(16,16) = Rand()
        Declare @ProductID Int = (Select Case When
        Round(@RAND*@ProductCount,0) = 0 Then 1
        Else Round(@RAND*@ProductCount,0)
        End)
        Declare @Quantity Int = (Select Case When
        Round(@RAND*10,0) = 0 Then 1
        Else Round(@RAND*10,0)
        End)
        Insert Into Customer_Line_Item(ProductID, CustomerOrderID, Quantity)
        Values(@ProductID, @OrderID, @Quantity)
        Set @NumberofItems = @NumberofItems - 1
    End

If @@ERROR <> 0
Rollback Tran G2
Else Commit Tran G2

go

execute usp_New_Orders 10

go


CREATE PROCEDURE usp_New_Supplier_Orders
@NumberofOrders INT 
AS
BEGIN Tran G1
DECLARE @SupplierCount Int = (SELECT COUNT(*) FROM Supplier)
IF @NUmberofOrders > 99
    BEGIN
        SET @NumberofOrders = 99
    END
While @NumberofOrders > 0
    BEGIN
        DECLARE @RAND numeric(16,16) = RAND()
        DECLARE @SupplierID Int = (Select CASE WHEN
        ROUND(@RAND * @SupplierCount,0) = 0 THEN 1
        ELSE ROUND(@RAND * @SupplierCount,0)
        END)
        INSERT INTO Supplier_Order(SupplierID)
        VALUES(@SupplierID)
        DECLARE @SupplierOrderID INT = SCOPE_IDENTITY()
        DECLARE @NumofItems Int = (SELECT CASE WHEN
        ROUND(@RAND*10,0) = 0 OR
        ROUND(@RAND*10,0) > 100 THEN 1
        ELSE ROUND(@RAND*10,0)
        END)
        EXEC Usp_Add_Supplier_Line_Item @NumofItems, @SupplierOrderID
        SET @NumberofOrders = @NumberofOrders -1
    END

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE COMMIT TRAN G1

GO

CREATE PROCEDURE Usp_Add_Supplier_Line_Item
@NumberofItems INT,
@SupplierOrderID INT
AS
BEGIN TRAN G2
DECLARe @MaterialCount INT = (SELECT COUNT(*) FROM Material)
WHILE @NumberofItems > 0
    BEGIN
        DECLARE @RAND numeric(16,16) = RAND()
        DECLARE @MaterialID INT = (SELECT CASE WHEN
        ROUND(@RAND * @MaterialCount,0) = 0 THEN 1
        ELSE ROUND(@RAND * @MaterialCount,0)
        END)
        DECLARE @Quantity INT = (SELECT CASE WHEN
        ROUND(@RAND*10,0) = 0 THEN 1
        ELSE ROUND(@RAND*10,0)
        END)
        INSERT INTO Supplier_Line_Item(MaterialID, SupplierOrderID, Quantity)
            VALUES(@MaterialID, @SupplierOrderID, @Quantity)
        SET @NumberofItems = @NumberofItems - 1
    END

IF @@ERROR <> 0
ROLLBACK TRAN G2
ELSE COMMIT TRAN G2

GO 

EXEC USP_NEW_SUPPLIER_ORDERS 500

GO


/*POPULATE INVENTORY, MATERIAL_INVENTORY*/
CREATE PROCEDURE USP_ADD_INVENTORY
@LOCATIONID INT
AS

DECLARE @INVENTORYID INT

BEGIN TRAN G1

    INSERT INTO INVENTORY(LOCATIONID, CHANGEDATE)
    VALUES(@LOCATIONID, GETDATE())
    SET @INVENTORYID = SCOPE_IDENTITY()

    EXECUTE USP_ADD_MATERIAL_INVENTORY @INVENTORYID

IF @@ERROR <> 0
ROLLBACK TRAN G1
ELSE
COMMIT TRAN G1

GO

CREATE PROCEDURE USP_ADD_MATERIAL_INVENTORY
@INVENTORYID INT

AS

DECLARE @COUNT INT = 1
DECLARE @RAND numeric(16,16) = RAND()
DECLARE @QUANTITY INT = ROUND(((12-5) * RAND() + 5), 0) * 58

BEGIN TRAN G2

WHILE @COUNT < 6
BEGIN
    INSERT INTO MATERIAL_INVENTORY(MATERIALID, INVENTORYID, QUANTITY)
    VALUES(@COUNT, @INVENTORYID, @QUANTITY)
    SET @QUANTITY = ROUND(((12-5) * RAND() + 5), 0) * 58
    SET @COUNT = @COUNT + 1
END

IF @@ERROR <> 0
ROLLBACK TRAN G2
ELSE
COMMIT TRAN G2

EXECUTE USP_ADD_INVENTORY 16

