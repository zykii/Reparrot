﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_SelectById]    Script Date: 2/13/2023 7:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 12/19/2022
-- Description:	Blogs Select By Id
-- Code Reviewer: Jacob Helton


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_SelectById]

			@Id int 

as

/*---------------TEST CODE------------------

	Declare @Id int = 1

	Execute [dbo].[Blogs_SelectById] @Id 

*/

BEGIN

			SELECT	b.[Id]
				   ,b.[BlogTypeId]
				   ,bt.[Name]
				   ,b.[AuthorId] 
				   ,u.[FirstName]
				   ,u.[LastName]
				   ,u.[AvatarUrl]
				   ,b.[Title]
				   ,b.[Subject]
				   ,b.[Content]
				   ,b.[IsPublished]
				   ,b.[ImageUrl]
				   ,b.[DateCreated]
				   ,b.[DateModified]
				   ,b.[DatePublish]
			FROM [dbo].[Blogs] as b 
			inner join dbo.BlogTypes as bt
				on b.BlogTypeId = bt.Id
			inner join dbo.Users as u
				on b.AuthorId = u.Id
			WHERE b.Id = @Id

END
