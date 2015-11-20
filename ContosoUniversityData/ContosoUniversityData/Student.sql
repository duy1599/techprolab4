CREATE TABLE [dbo].[Student]
(
	[StudentID]			INT				IDENTITY (1, 1) NOT NULL,
	[LastName]			NVARCHAR (50)	NULL,
	[FirstName]			NVARCHAR (50)	NULL,
	[Birthday]			DATETIME		NULL,
	[ProgramID]			INT				NOT NULL,
	PRIMARY KEY CLUSTERED ([StudentID] ASC),
	CONSTRAINT [FK_dbo.Student_dbo.Program_ProgramID] FOREIGN KEY ([ProgramID]) 
        REFERENCES [dbo].[Program] ([ProgramID]) ON DELETE CASCADE
)
