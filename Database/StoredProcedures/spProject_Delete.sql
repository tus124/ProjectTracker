CREATE PROCEDURE [dbo].[spProject_Delete]
	@id int
AS
BEGIN
	begin try
		delete from dbo.Project where id = @id;


	end try
	begin catch

		throw;
	end catch

END