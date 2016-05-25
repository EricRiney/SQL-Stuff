USE [SKI_BOARD_MFG]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE SHIPMENT*/
/*Riney 5/20/2016*/
CREATE PROC ADD_SHIPMENT

@Run INT

AS

DECLARE @LocationCount INT = (SELECT COUNT(*) FROM Location)

BEGIN TRAN riney01

WHILE @Run > 0
    BEGIN
    DECLARE @LocationID INT = Round((Rand()*(@LocationCount-1)+1),0)
    INSERT INTO SHIPMENT(LocationID)
    VALUES(@locationID)
    SET @RUN = @RUN - 1
    END

if @@error <> 0
rollback tran riney01
else 
commit tran riney01



