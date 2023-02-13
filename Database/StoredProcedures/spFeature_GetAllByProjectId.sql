CREATE PROCEDURE [dbo].[spFeature_GetAllByProjectId]
	@projectId int
AS
BEGIN
	begin try
		select Id,
			Title, 
			[Description],
			ProjectId,
			PriorityId,
			(select [Name] from dbo.[Priority] where Id = PriorityId) as [Priority],
			RiskId,
			(select [Name] from dbo.Risk where id = RiskId) as Risk,
			ClassificationId,
			(select [Name] from dbo.[Classification] where id = ClassificationId) as [Classification],
			Active, 
			CreatedBy, 
			CreatedDate, 
			ModifiedBy, 
			ModifiedDate 
		from Feature
		where ProjectId = @projectId


	end try
	begin catch
		SELECT  
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_SEVERITY() AS ErrorSeverity  
			,ERROR_STATE() AS ErrorState  
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;  


		throw;
	end catch


END