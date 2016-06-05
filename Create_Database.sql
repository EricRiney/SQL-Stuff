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
, [Street] varchar(50)  NOT NULL  
, [City] varchar(50)  NOT NULL  
, [State/Provence] varchar(50)  NULL  
, [Country] varchar(50)  NOT NULL  
, [Zipcode] varchar(50)  NULL  
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
, [Name] varchar(50)  NOT NULL  
, [CustomerTypeID] int  NOT NULL  
, [Street] varchar(200)  NOT NULL  
, [City] varchar(50)  NOT NULL  
, [State/Provence] varchar(200)  NULL  
, [Country] varchar(200)  NOT NULL  
, [ZipCode] varchar(50)  NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [FirstName] varchar(50)  NOT NULL  
, [LastName] varchar(50)  NOT NULL  
, [Phone] varchar(50)  NOT NULL  
, [Email] varchar(50)  NOT NULL  
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
[LocationID] int identity(1,1)  NOT NULL  
, [PowerUsage] int  NOT NULL  
, [ProductionRate] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
, [Street] varchar(200)  NOT NULL  
, [City] varchar(50)  NOT NULL  
, [State/Provence] varchar(200)  NULL  
, [Country] varchar(200)  NOT NULL  
, [ZipCode] varchar(50)  NULL  
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
[LocationID] int  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [FirstName] varchar(50)  NOT NULL  
, [LastName] varchar(50)  NOT NULL  
, [Phone] varchar(50)  NOT NULL  
, [Email] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
, [Descr] varchar(200)  NULL  
, [EquipmentTypeID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Equipment] ADD CONSTRAINT [Equipment_PK] PRIMARY KEY CLUSTERED (
[EquipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cusomer_Line_Item]') AND type in (N'U'))
    DROP TABLE [dbo].[Cusomer_Line_Item]
GO
CREATE TABLE [dbo].[Cusomer_Line_Item] (
[CustomerLineItemID] int identity(1,1)  NOT NULL  
, [ProductID] int  NOT NULL  
, [CustomerOrderID] int  NOT NULL  
, [Quantity] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[Cusomer_Line_Item] ADD CONSTRAINT [Cusomer_Line_Item_PK] PRIMARY KEY CLUSTERED (
[CustomerLineItemID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Equipment_Type]') AND type in (N'U'))
    DROP TABLE [dbo].[Equipment_Type]
GO
CREATE TABLE [dbo].[Equipment_Type] (
[EquipmentTypeID] int  identity(1,1)  NOT NULL  
, [Name] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
, [Price] smallmoney  NOT NULL  
, [Cost] smallmoney  NOT NULL  
, [Color] varchar(50)  NOT NULL  
, [Weight] varchar(50)  NOT NULL  
, [Model] varchar(50)  NOT NULL  
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
, [Title] varchar(50)  NOT NULL  
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
, [Name] varchar(50)  NOT NULL  
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
, [FirstName] varchar(50)  NOT NULL  
, [LastName] varchar(50)  NOT NULL  
, [Phone] varchar(50)  NOT NULL  
, [Email] varchar(50)  NOT NULL  
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

ALTER TABLE [dbo].[Customer_Line_Item_Shipment] WITH CHECK ADD CONSTRAINT [Cusomer_Line_Item_Customer_Line_Item_Shipment_FK1] FOREIGN KEY (
[CustomerLineItemID]
)
REFERENCES [dbo].[Cusomer_Line_Item] (
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

ALTER TABLE [dbo].[Cusomer_Line_Item] WITH CHECK ADD CONSTRAINT [Product_Cusomer_Line_Item_FK1] FOREIGN KEY (
[ProductID]
)
REFERENCES [dbo].[Product] (
[ProductID]
)
ALTER TABLE [dbo].[Cusomer_Line_Item] WITH CHECK ADD CONSTRAINT [Customer_Order_Cusomer_Line_Item_FK1] FOREIGN KEY (
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

