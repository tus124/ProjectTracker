CREATE TABLE [dbo].[ActivityType]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null, -- Deployment, Design, Development, Documentation, Requirements, Testing
	--[Value] int not null, -- don't need value field for activity type

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,


	CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED ([Id] ASC),


)
