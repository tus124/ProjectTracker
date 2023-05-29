﻿CREATE PROCEDURE [dbo].[spProject_GetAll]
AS
BEGIN
	begin try
		select Id,
			[Name], 
			[Description], 
			Active, 
			CreatedBy, 
			CreatedDate, 
			ModifiedBy, 
			ModifiedDate 
		from dbo.Project


	end try
	begin catch
		SELECT  
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_SEVERITY() AS ErrorSeverity  
			,ERROR_STATE() AS ErrorState  
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;  

			insert into dbo.Log values('Error', (select ERROR_PROCEDURE()), (select ERROR_MESSAGE()), getdate());
		throw;
	end catch


END