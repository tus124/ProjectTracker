CREATE PROCEDURE [dbo].[spIssue_Insert]
	@title nvarchar(1000),
	@description nvarchar(max),
	@projectId int,
	@statusId int,
	@assignedToId int,
	@sprintId int,
	@sprintTypeId int,
	@createdBy nvarchar(100)
AS
BEGIN
	begin try
		insert into dbo.Issue values(@title, @description, @projectId, @statusId, @assignedToId, @sprintId, @sprintTypeId, @createdBy, getdate(), null, null);

	end try
	begin catch

		throw;
	end catch
	

END