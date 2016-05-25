USE [SKI_BOARD_MFG]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*POPULATE SHIPMENT*/
/*Riney 5/20/2016*/
CREATE PROC ADD_SHIPMENT

AS

declare @count INT = 1
declare @num INT
declare @locationID INT

BEGIN tran g1

WHILE @count < 51
    BEGIN
    set @num = ROUND(RAND() * 1 + 1, 0)
    set @locationID = @num
    

    insert into SHIPMENT(LocationID)
    values(@locationID)

    set @count = @count + 1
    end

if @@error <> 0
rollback tran g1
else 
commit tran g1



