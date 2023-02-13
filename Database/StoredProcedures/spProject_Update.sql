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

		throw;
	end catch
	
END