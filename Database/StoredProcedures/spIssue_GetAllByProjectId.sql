CREATE PROCEDURE [dbo].[spIssue_GetAllByProjectId]
	@projectId int
AS
BEGIN
	begin try
		select Id
			,Title
			, Description
			, ProjectId
			, (select Name from dbo.Project where Id = ProjectId) as Project
			, StatusId
			, (select Name from dbo.[Status] where id = StatusId) as Status
			, AssignedToId
			, (select Name from dbo.[User] where id = AssignedToId) as AssignedTo
			, SprintId
			, (select Name from dbo.Sprint where id = SprintId) as Sprint
			, SprintTypeId
			, (select Name from dbo.SprintType where id = SprintTypeId) as SprintType
			, CreatedBy
			, CreatedDate
			, ModifiedBy
			, ModifiedDate
		from dbo.Issue
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