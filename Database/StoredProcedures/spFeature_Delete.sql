CREATE PROCEDURE [dbo].[spFeature_Delete]
	@id int
AS
BEGIN
	begin try
		delete from dbo.Feature where id = @id;


	end try
	begin catch

		throw;
	end catch

END