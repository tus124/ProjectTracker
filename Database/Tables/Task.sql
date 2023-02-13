CREATE TABLE [dbo].[Task]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Title] nvarchar(100) not null,
	
	[Description] nvarchar(max) null,
	[Effort] numeric(3,2) null,			-- Estimate Hours 

	[UserStoryId] int not null,

	[AssignedToId] int null,
	[PriorityId] int null,		-- 1, 2, 3, 4
	[ActivityTypeId] int null,	-- Deployment, Design, Development, Documentation, Requirements, Testing
	[EnvironmentId] int null,	-- Development, Test, Staging, Production

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Task_UserStoryId] FOREIGN KEY ([UserStoryId]) REFERENCES [dbo].[UserStory] ([Id]),
	CONSTRAINT [FK_Task_AssignedToId] FOREIGN KEY ([AssignedToId]) REFERENCES [dbo].[User] ([Id]),
	CONSTRAINT [FK_Task_PriorityId] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[Priority] ([Id]),
	CONSTRAINT [FK_Task_ActivityTypeId] FOREIGN KEY ([ActivityTypeId]) REFERENCES [dbo].[ActivityType] ([Id]),
	CONSTRAINT [FK_Task_EnvironmentId] FOREIGN KEY ([EnvironmentId]) REFERENCES [dbo].[Environment] ([Id]),
	
)
