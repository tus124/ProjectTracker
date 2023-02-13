CREATE TABLE [dbo].[UserType]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null, -- Developer, Tester, ProjectManager, BusinessAnalyst, Administrator (Admin)
	[Value] nvarchar(100) not null,


	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED ([Id] ASC)
)
