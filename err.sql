-- Error-Handling

Begin Tran
  UPDATE some_table
    SET somt_colum = some_value
      WHERE some_condition = some_other_value
IF @@ERROR != 0
  Begin
    SELECT 'Unexpected error occured!'
    Rollback Tran
    Return 1
  End
  UPDATE some_table
    SET somt_colum = some_value
      WHERE some_condition = some_other_value
IF @@ERROR != 0
Begin
  SELECT 'Unexpected error occured!'
  Rollback Tran
  Return 1
End
Commit Tran

sp_AddMESSAGE 50204, 'lecture used to be fun'
  if @authorID is null
  RAISERERROR
