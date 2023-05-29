CREATE PROCEDURE [dbo].[spProject_Update]
	@Id int,
	@Name nvarchar(1000),
	@Description nvarchar(max),
	@Active bit,
	@ModifiedBy nvarchar(100)
AS
BEGIN
	begin try
		update dbo.Project 
		set [Name] = @Name
			,[Description] = @Description
			,Active = @Active
			,ModifiedBy = @ModifiedBy
			,ModifiedDate = getdate()
		where Id = @Id;

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