CREATE TABLE [dbo].[UserStory]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Title] nvarchar(100) not null,
	[Description] nvarchar(max) null,
	[AcceptanceCriteria] nvarchar(max) null,
	[StoryPoints] int null,
	[PriorityId] int null,
	[RiskId] int null,
	[ClassificationId] int null,

	[FeatureId] int not null,
	[SprintId] int null,
	[SprintTypeId] int not null default(1),

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_UserStory] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_UserStory_FeatureId] FOREIGN KEY ([FeatureId]) REFERENCES [dbo].[Feature] ([Id]),
	CONSTRAINT [FK_UserStory_PriorityId] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[Priority] ([Id]),
	CONSTRAINT [FK_UserStory_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id]),
	CONSTRAINT [FK_UserStory_ClassificationId] FOREIGN KEY ([ClassificationId]) REFERENCES [dbo].[Classification] ([Id]),
	CONSTRAINT [FK_UserStory_SprintId] FOREIGN KEY ([SprintId]) REFERENCES [dbo].[Sprint] ([Id]),
	CONSTRAINT [FK_UserStory_SprintTypeId] FOREIGN KEY ([SprintTypeId]) REFERENCES [dbo].[SprintType] ([Id])
)
