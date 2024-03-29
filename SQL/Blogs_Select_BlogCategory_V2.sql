﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Select_BlogCategory_V2]    Script Date: 2/13/2023 7:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 1/26/2023
-- Description:	Blogs Select By Blog Category (Category means BlogTypeId), Paginated
-- Code Reviewer: Isaiah Lewis


-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Select_BlogCategory_V2]

			 @PageIndex int
			,@PageSize int
			,@BlogTypeId int

as

/*---------------TEST CODE------------------

	Declare		 @PageIndex int = 0
				,@PageSize int = 5
				,@BlogTypeId int = 1

	Execute [dbo].[Blogs_Select_BlogCategory_V2] 
									@PageIndex
									,@PageSize
									,@BlogTypeId 

*/

BEGIN

		DECLARE @Offset int = @PageIndex * @PageSize

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
		WHERE b.BlogTypeId = @BlogTypeId 

		ORDER BY b.[Id]

		OFFSET @offset ROWS
		FETCH NEXT @PageSize ROWS ONLY

END
