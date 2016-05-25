USE [SKI_BOARD_MFG]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*POPULATE LINE_ITEM_SHIPMENT*/
/*Riney 5/20/2016*/
CREATE PROC ADD_LINE_ITEM_SHIPMENT

AS
DECLARE @shipCount INT = (SELECT COUNT(*) FROM Shipment)

BEGIN TRAN RINEY01
    WHILE @shipCount > 0
    BEGIN
        DECLARE @ShipID INT = (SELECT TOP 1 * FROM SHIPMENT WHERE ShipmentID = @shipCount)
        DECLARE @shipDate DATE = (GETDATE())
        INSERT INTO  Line_Item_Shipment(Date, ShipmentID)
        VALUES (@shipDate, @ShipID)
    END
IF @@ERROR <> 0
ROLLBACK TRAN RINEY01
ELSE COMMIT TRAN RINEY01