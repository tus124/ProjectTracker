CREATE TABLE [dbo].[Feature]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Title] nvarchar(100) not null,
	[Description] nvarchar(max) null,

	[ProjectId] int not null,

	[PriorityId] int null,
	[RiskId] int null,
	[ClassificationId] int null,

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Feature_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([Id]),
	CONSTRAINT [FK_Feature_PriorityId] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[Priority] ([Id]),
	CONSTRAINT [FK_Feature_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id]),
	CONSTRAINT [FK_Feature_ClassificationId] FOREIGN KEY ([ClassificationId]) REFERENCES [dbo].[Classification] ([Id]),
	
)
