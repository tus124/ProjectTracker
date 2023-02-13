CREATE TABLE [dbo].[Project]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null,
	[Description] nvarchar(max) null,

	[Active] bit not null default (1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,

	CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([Id] ASC),
)
