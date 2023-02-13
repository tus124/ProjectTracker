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

		throw;
	end catch
	

END