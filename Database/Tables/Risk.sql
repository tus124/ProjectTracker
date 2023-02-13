CREATE TABLE [dbo].[Risk]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null,	-- High, Medium, Low
	[Value] int not null,			-- 1, 2, 3

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,


	CONSTRAINT [PK_Risk] PRIMARY KEY CLUSTERED ([Id] ASC),

)
