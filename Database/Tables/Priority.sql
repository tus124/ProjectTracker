CREATE TABLE [dbo].[Priority]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null, -- Extremly High, High, Medium, Low
	[Value] int not null,		   -- 1, 2, 3, 4


	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,



	CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED ([Id] ASC),
	
)
