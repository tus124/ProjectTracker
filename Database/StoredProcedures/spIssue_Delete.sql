CREATE PROCEDURE [dbo].[spIssue_Delete]
	@id int
AS
BEGIN
	begin try
		delete from dbo.Issue where id = @id;


	end try
	begin catch

		throw;
	end catch

END