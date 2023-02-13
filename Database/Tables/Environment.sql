CREATE TABLE [dbo].[Environment]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null, -- Development, Test, Staging, Production
	--[Value] int not null, -- don't need value field for Environment lookup table

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,


	CONSTRAINT [PK_Environment] PRIMARY KEY CLUSTERED ([Id] ASC),


)
