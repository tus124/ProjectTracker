CREATE PROCEDURE [dbo].[spIssue_Update]
	@id int,
	@title nvarchar(1000),
	@description nvarchar(max),
	@projectId int,
	@statusId int,
	@assignedToId int,
	@sprintId int,
	@sprintTypeId int,
	@modifiedBy nvarchar(100)
AS
BEGIN
	begin try
		update dbo.Issue 
		set Title = @title
			,Description = @description
			,ProjectId = @projectId
			,StatusId = @statusId
			,AssignedToId = @assignedToId
			,SprintId =  @sprintId
			,SprintTypeId = @sprintTypeId
			,ModifiedBy = @modifiedBy
			,ModifiedDate = getdate()
		where id = @id;


	end try
	begin catch

		throw;
	end catch
	

END