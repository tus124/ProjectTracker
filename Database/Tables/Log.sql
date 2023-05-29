CREATE TABLE [dbo].[Log]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Type] nvarchar(20) not null, -- log type: info, warning, error

	[Name] nvarchar(100) not null,
	[Message] nvarchar(1000) not null,

	
	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,

	CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED ([Id] ASC),
)
