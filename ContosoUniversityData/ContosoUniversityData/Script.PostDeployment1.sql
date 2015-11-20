/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Program AS Target 
USING (VALUES 
        (1, 'CST'),
		(2, 'CIT')
) 
AS Source (ProgramID, ProgramName) 
ON Target.ProgramID = Source.ProgramID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProgramName) 
VALUES (ProgramName);

MERGE INTO Course AS Target 
USING (VALUES 
        (1, 'Economics', 3), 
        (2, 'Literature', 3), 
        (3, 'Chemistry', 4)
) 
AS Source (CourseID, CourseTitle, CourseCredits) 
ON Target.CourseID = Source.CourseID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (CourseTitle, CourseCredits) 
VALUES (CourseTitle, CourseCredits);


MERGE INTO Student AS Target
USING (VALUES 
        (1, 'Tibbetts', 'Donnie', '2013-09-01', 1), 
        (2, 'Guzman', 'Liza', '2012-01-13', 2), 
	(3, 'Catlett', 'Phil', '2011-09-03', 1)
)
AS Source (StudentID, LastName, FirstName, Birthday, ProgramID)
ON Target.StudentID = Source.StudentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (LastName, FirstName, Birthday, ProgramID)
VALUES (LastName, FirstName, Birthday, ProgramID);


MERGE INTO Enrollment AS Target
USING (VALUES 
	(1, 2.00, 1, 1),
	(2, 3.50, 1, 2),
	(3, 4.00, 2, 3),
	(4, 1.80, 2, 1),
	(5, 3.20, 3, 1),
	(6, 4.00, 3, 2)
)
AS Source (EnrollmentID, Grade, CourseID, StudentID)
ON Target.EnrollmentID = Source.EnrollmentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Grade, CourseID, StudentID)
VALUES (Grade, CourseID, StudentID);