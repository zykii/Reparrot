﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Update_V2]    Script Date: 2/13/2023 7:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 1/7/2023
-- Description:	Blogs Update V2
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Update_V2]

			@BlogTypeId int
           ,@AuthorId int 
           ,@Title nvarchar(50)
           ,@Subject nvarchar(50)
           ,@Content nvarchar(max) = null
           ,@IsPublished bit = 0
           ,@ImageUrl nvarchar(255) = null
           ,@DatePublish datetime2(7) = null
		   ,@Id int 

as

/*---------------TEST CODE------------------

	Declare @Id int = 17
		   ,@BlogTypeId int = 2
           ,@AuthorId int = 5
           ,@Title nvarchar(50) = 'Update Test2'
           ,@Subject nvarchar(50) = 'Update Subject'
           ,@Content nvarchar(max) = null
           ,@IsPublished bit = 0
           ,@ImageUrl nvarchar(255) = null
           ,@DatePublish datetime2(7) = null

	Execute dbo.Blogs_SelectById @Id

	Execute [dbo].[Blogs_Update_V2]
			@BlogTypeId
           ,@AuthorId 
           ,@Title
           ,@Subject
           ,@Content
           ,@IsPublished
           ,@ImageUrl
           ,@DatePublish
		   ,@Id

	Execute dbo.Blogs_SelectById @Id

*/

BEGIN

	Declare @dateNow datetime2 = GETUTCDATE()

	UPDATE	[dbo].[Blogs]
	SET		[BlogTypeId] = @BlogTypeId
			,[AuthorId] = @AuthorId
			,[Title] = @Title
			,[Subject] = @Subject
			,[Content] = @Content
			,[IsPublished] = @IsPublished
			,[ImageUrl] = @ImageUrl
			,[DateModified] = @dateNow
			,[DatePublish] = @DatePublish
	 WHERE Id = @Id

END
