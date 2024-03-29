﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Select_ByCreatedBy]    Script Date: 2/13/2023 7:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 12/19/2022
-- Description:	Blogs Select By Created By
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Select_ByCreatedBy]

			@PageIndex int
			,@PageSize int
			,@CreatedBy int

as

/*---------------TEST CODE------------------

	Declare @PageIndex int = 0
			,@PageSize int = 5
			,@CreatedBy int = 1

	Execute [dbo].[Blogs_Select_ByCreatedBy]
			@PageIndex
			,@PageSize
			,@CreatedBy

*/

BEGIN

		Declare @offset int = @PageIndex * @PageSize

		SELECT	 b.[Id]
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
				,TotalCount = COUNT(1) OVER() 
		FROM [dbo].[Blogs] as b 
		inner join dbo.BlogTypes as bt
			on b.BlogTypeId = bt.Id
		inner join dbo.Users as u
			on b.AuthorId = u.Id
		WHERE u.Id = @CreatedBy 
		ORDER BY b.Id

		OFFSET @offset Rows
		Fetch Next @PageSize Rows ONLY 

END
