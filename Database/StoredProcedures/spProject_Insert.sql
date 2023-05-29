CREATE PROCEDURE [dbo].[spProject_Insert]
	@Name nvarchar(1000),
	@Description nvarchar(max),
	@Active bit,
	@CreatedBy nvarchar(100)
AS
BEGIN
	begin try
		insert into dbo.Project values(@Name, @Description, @Active, @CreatedBy, getdate(), null, null);

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