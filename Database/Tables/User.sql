CREATE TABLE [dbo].[User]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null,
	[UserTypeId] int not null, 
	[Email] nvarchar(100) null,
	[LoginId] nvarchar(100) null,


	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,


	CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_User_UserTypeId] FOREIGN KEY ([UserTypeId]) REFERENCES [dbo].[UserType] ([Id])
 
)
