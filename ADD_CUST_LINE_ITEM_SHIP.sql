USE [SKI_BOARD_MFG]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE CUST_LINE_ITME_SHIP*/
/*Riney 5/20/2016*/
CREATE PROC ADD_CUST_LINE_ITME_SHIP

@ProductID INT

AS

--DECLARE @Cust_Line_Item_Count INT = (SELECT COUNT(*) FROM Customer_Line_Item)

DECLARE @Cust_Line_Item_ID INT 
DECLARE @Line_Item_Ship_ID INT

BEGIN TRAN riney01
    SET @Cust_Line_Item_ID = (SELECT TOP 1 * FROM Cust_Line_Item WHERE ProductID = @ProductID)
    SET @Line_Item_Ship_ID INT = 
    
    INSERT INTO CUSTOMER_LINE_ITEM_SHIPMENT(CustomerLineItemID, LineItemShipmentID)
    VALUES(@CUST_Line_Item_ID, @Line_Item_Ship_ID)

if @@error <> 0
rollback tran riney01
else 
commit tran riney01



