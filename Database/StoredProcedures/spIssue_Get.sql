CREATE PROCEDURE [dbo].[spIssue_Get]
	@id int
AS
BEGIN
	begin try
		select Title
			, Description
			, (select Name from dbo.[Status] where id = statusId) as Status
			, (select Name from dbo.[User] where id = assignedtoId) as AssignedTo
			, (select Name from dbo.Sprint where id = sprintId) as Sprint
			, (select Name from dbo.SprintType where id = sprintTypeId) as SprintType

		from dbo.Issue
		where id = @id;


	end try
	begin catch

		throw;
	end catch

END