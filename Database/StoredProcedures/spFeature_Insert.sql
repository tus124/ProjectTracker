CREATE PROCEDURE [dbo].[spFeature_Insert]
	@Title nvarchar(1000),
	@Description nvarchar(max),
	@ProjectId int,
	@PriorityId int,
	@RiskId int,
	@ClassificationId int,
	@Active bit,
	@CreatedBy nvarchar(100)
AS
BEGIN
	begin try
		insert into dbo.Feature values(@Title, @Description, @ProjectId, @PriorityId, @RiskId, @ClassificationId, @Active, @CreatedBy, getdate(), null, null);

	end try
	begin catch

		throw;
	end catch
	

END