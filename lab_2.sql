// Lab 2: Stored Procedure to populate primary transaction table
// Create a stored procedure that populates one of your project databases 
// transactional tables with the following characteristics:

USE SKI_BOARD_MFG
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE lab_two

@run INT
AS
DECLARE @Dig1 varChar (20)
DECLARE @Rand Numeric (16,16)

DECLARE @LineItemShipID INT
DECLARE @Date Date
DECLARE @ShipmentID INT

DECLARE @CustLineItemShipID INT

DECLARE @CustLineItemID INT
DECLARE @ProductID INT
DECLARE @CustOrderID INT
DECLARE @Quant INT

WHILE @Run > 0
BEGIN
SELECT @RAND = RAND()
SET @Dig1 = @rand

SET @LineItemShipID = (SELECT CASE 
					WHEN SUBSTRING(@Dig1, 10, 3) = 000 
					   THEN 902
					   ELSE SUBSTRING(@Dig1, 10, 3)
					END)
                    
SET @CustLineItemID = (SELECT CASE 
					WHEN SUBSTRING(@Dig1, 10, 3) = 000 
					   THEN 902
					   ELSE SUBSTRING(@Dig1, 10, 3)
					END)
                    
INSERT INTO Customer_Line_Item_Shipment (CustLineItemID, LineItemShipmentID) 
    VALUES(@LineItemShipID, @CustLineItemID)

Set @run = @run -1
END



