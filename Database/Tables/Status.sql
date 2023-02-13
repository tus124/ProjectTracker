CREATE TABLE [dbo].[Status]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null,			-- New, Active, Dev Complete, QA Tested, Closed
	[Value] nvarchar(1000) not null,		-- New, In Progress, Developer Unit Tested and Code pushed to Dev environment, QA fully tested with no additional bugs, Closed - Ready to be pushed to prod release

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([Id] ASC)
)
