CREATE TABLE [dbo].[Issue]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Title] nvarchar(1000) not null,
	[Description] nvarchar(max) null,
	[ProjectId] int not null,
	[StatusId] int not null default(1),
	[AssignedToId] int null,
	
	[SprintId] int null,
	[SprintTypeId] int not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Issue_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([Id]),
	CONSTRAINT [FK_Issue_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([Id]),
	CONSTRAINT [FK_Issue_AssignedToId] FOREIGN KEY ([AssignedToId]) REFERENCES [dbo].[User] ([Id]),
	CONSTRAINT [FK_Issue_SprintId] FOREIGN KEY ([SprintId]) REFERENCES [dbo].[Sprint] ([Id]),
	CONSTRAINT [FK_Issue_SprintTypeId] FOREIGN KEY ([SprintTypeId]) REFERENCES [dbo].[SprintType] ([Id])
 
)
