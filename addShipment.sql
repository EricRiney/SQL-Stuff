USE [SKI_BOARD_MFG]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE SHIPMENT*/
/*Riney 5/20/2016*/
CREATE PROC ADD_SHIPMENT

@Run int

AS

DECLARE @LocationCount Int = (Select Count(*) From Location)

BEGIN tran g1

WHILE @Run > 0
    BEGIN
    Declare @LocationID Int = Round((Rand()*(@LocationCount-1)+1),0)
    INSERT INTO SHIPMENT(LocationID)
    VALUES(@locationID)
    SET @RUN = @RUN - 1
    END

if @@error <> 0
rollback tran g1
else 
commit tran g1



