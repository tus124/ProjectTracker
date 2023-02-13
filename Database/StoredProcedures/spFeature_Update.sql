CREATE PROCEDURE [dbo].[spFeature_Update]
	@Id int,
	@Title nvarchar(1000),
	@Description nvarchar(max),
	@ProjectId int,
	@PriorityId int,
	@RiskId int,
	@ClassificationId int,
	@Active bit,
	@ModifiedBy nvarchar(100)
AS
BEGIN
	begin try
		update dbo.Feature 
		set Title = @Title
			, [Description] = @Description
			, ProjectId = @ProjectId
			, PriorityId = @PriorityId
			, RiskId = @RiskId
			, ClassificationId = @ClassificationId
			, Active = @Active
			, ModifiedBy = @ModifiedBy
			, ModifiedDate = getdate()
		where Id = @Id;

	end try
	begin catch

		throw;
	end catch
	
END