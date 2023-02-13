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


if  not exists  (select 1 from dbo.Feature)
begin
	delete from dbo.Feature;
	dbcc checkident('dbo.Feature', reseed, 1);

	insert into dbo.Feature values('User Authentication', 'Add user authentication/authorization capabilities', 1, 3, 1, 2, 1, 'system', getdate(), null, null);
	insert into dbo.Feature values('Application Logging', 'Add logging capabilities to project tracker', 1, 3, 1, 2, 1, 'system', getdate(), null, null);
	insert into dbo.Feature values('Track progress of projects', 'Application should be able to track progress of building any application or project. It should be able to split between features, sprints, user stories, tasks, and issues', 1, 1, 1, 1, 1, 'system', getdate(), null, null);

end



if  not exists  (select 1 from dbo.Status)
begin
	delete from dbo.Status;
	dbcc checkident('dbo.Status', reseed, 1);


	insert into dbo.Status values('New', 'New', 'system', getdate(), null, null);
	insert into dbo.Status values('Active', 'In Progress', 'system', getdate(), null, null);
	insert into dbo.Status values('Dev Complete', 'Developer work is complete', 'system', getdate(), null, null);
	insert into dbo.Status values('QA Complete', 'QA work is complete', 'system', getdate(), null, null);
	insert into dbo.Status values('Closed', 'All work is complete and release ready', 'system', getdate(), null, null);
end


if  not exists  (select 1 from dbo.UserType)
begin
	delete from dbo.UserType;
	dbcc checkident('dbo.UserType', reseed, 1);

	insert into dbo.UserType values('Developer', 'Dev', 'system', getdate(), null, null);
	insert into dbo.UserType values('Tester', 'QA', 'system', getdate(), null, null);
	insert into dbo.UserType values('Project Manager', 'PM', 'system', getdate(), null, null);
	insert into dbo.UserType values('Business Analyst', 'BA', 'system', getdate(), null, null);
	insert into dbo.UserType values('Administrator', 'Admin', 'system', getdate(), null, null);
end





if  not exists  (select 1 from dbo.Classification)
begin
	delete from dbo.Classification;
	dbcc checkident('dbo.Classification', reseed, 1);


	insert into dbo.Classification values('Architectural', 1, 'system', getdate(), null, null);
	insert into dbo.Classification values('Business', 1, 'system', getdate(), null, null);
end



if  not exists  (select 1 from dbo.Priority)
begin
	delete from dbo.Priority;
	dbcc checkident('dbo.Priority', reseed, 1);

	insert into dbo.Priority values('High', 1, 1,'system', getdate(), null, null);
	insert into dbo.Priority values('Medium', 2, 1,'system', getdate(), null, null);
	insert into dbo.Priority values('Low', 3, 1, 'system', getdate(), null, null);
end	



if  not exists  (select 1 from dbo.Risk)
begin
	delete from dbo.Risk;
	dbcc checkident('dbo.Risk', reseed, 1);


	insert into dbo.Risk values('High', 1, 1,'system', getdate(), null, null);
	insert into dbo.Risk values('Medium', 2, 1,'system', getdate(), null, null);
	insert into dbo.Risk values('Low', 3, 1, 'system', getdate(), null, null);
end



if  not exists  (select 1 from dbo.Environment)
begin
	delete from dbo.Environment;
	dbcc checkident('dbo.Environment', reseed, 1);

	insert into dbo.Environment values('Development', 1, 'system', getdate(), null, null);
	insert into dbo.Environment values('Test', 1,'system', getdate(), null, null);
	insert into dbo.Environment values('Staging', 1,'system', getdate(), null, null);
	insert into dbo.Environment values('Production', 1, 'system', getdate(), null, null);
end




if  not exists  (select 1 from dbo.ActivityType)
begin
	delete from dbo.ActivityType;
	dbcc checkident('dbo.ActivityType', reseed, 1);

	insert into dbo.ActivityType values('Deployment', 1, 'system', getdate(), null, null);
	insert into dbo.ActivityType values('Design', 1,'system', getdate(), null, null);
	insert into dbo.ActivityType values('Development', 1,'system', getdate(), null, null);
	insert into dbo.ActivityType values('Documentation', 1, 'system', getdate(), null, null);
	insert into dbo.ActivityType values('Requirements', 1, 'system', getdate(), null, null);
	insert into dbo.ActivityType values('Testing', 1, 'system', getdate(), null, null);
end



if  not exists  (select 1 from dbo.Sprint)
begin
	delete from dbo.Sprint;
	dbcc checkident('dbo.Sprint', reseed, 1);

	insert into dbo.Sprint values('Sprint 1', '2022-01-01', '2022-02-01', 1, 'system', getdate(), null, null);
end



if  not exists  (select 1 from dbo.SprintType)
begin
	delete from dbo.SprintType;
	dbcc checkident('dbo.SprintType', reseed,1);

	insert into dbo.SprintType values('New', 1, 'system', getdate(), null, null);
	insert into dbo.SprintType values('Active', 1, 'system', getdate(), null, null);
	insert into dbo.SprintType values('Closed', 1, 'system', getdate(), null, null);
end



if  not exists  (select 1 from dbo.Project)
begin
	delete from dbo.Project;
	dbcc checkident('dbo.Project', reseed, 1);


	insert into dbo.Project values('ProjectTracker', 'Build a project tracking system which can track sprint progress, issues, user stories, and other artifacts.', 1, 'system', getdate(), null, null);

	insert into dbo.Project values('AuthenticateApp', 'Build a authentication system. Get the username and password from user. Set it in request form params and send it to the server. Server validates the user based on the given username and password﻿. Once successful validation, create a cookie and set it in the response. The client then uses this cookie/session to make future requests.', 1, 'system', getdate(), null, null);
 
	insert into dbo.Project values('LogApp', 'Build a logging system for any application. Expose an api which application can be called. This system should track information, warning, or error level logging. Purpose of this app is to move any logging per app to this system.', 1, 'system', getdate(), null, null);
	
end

if exists (select 1 from dbo.Issue)
begin
	delete from dbo.Issue;
	dbcc checkident('dbo.Issue', reseed, 1);

	insert into dbo.Issue values('sample issue test', 'random description', 1, 1, 1, 1, 1, 'system', getdate(), null, null);

	insert into dbo.Issue values('sample issue test 2', 'random description 2', 1, 1, 1, 1, 1, 'system', getdate(), null, null);

end


GO

select * from dbo.Project;
select * from dbo.Feature
select * from dbo.status;
select * from dbo.Issue;
select * from dbo.UserType;
select * from dbo.[User];
select * from dbo.SprintType
select * from dbo.Sprint
select * from dbo.Issue;
select * from dbo.Classification
select * from dbo.Priority
select * from dbo.risk

GO
