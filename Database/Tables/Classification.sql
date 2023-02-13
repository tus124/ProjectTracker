CREATE TABLE [dbo].[Classification]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
	[Name] nvarchar(100) not null, -- Architectural, Business 
	--[Value] int not null, -- don't need value field for Classification lookup table

	[Active] bit not null default(1),

	[CreatedBy] nvarchar(100) not null,
	[CreatedDate] datetime not null,
	[ModifiedBy] nvarchar(100) null,
	[ModifiedDate] datetime null,


	CONSTRAINT [PK_Classification] PRIMARY KEY CLUSTERED ([Id] ASC),


)
