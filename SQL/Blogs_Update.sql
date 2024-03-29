﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Update]    Script Date: 2/13/2023 7:39:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 12/19/2022
-- Description:	Blogs Update
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Update]

			@BlogTypeId int
           ,@AuthorId int 
           ,@Title nvarchar(50)
           ,@Subject nvarchar(50)
           ,@Content nvarchar(max)
           ,@IsPublished bit = 0
           ,@ImageUrl nvarchar(255)
           ,@DatePublish datetime2(7) = null
		   ,@Id int 

as

/*---------------TEST CODE------------------

	Declare @Id int = 2
		   ,@BlogTypeId int = 2
           ,@AuthorId int = 5
           ,@Title nvarchar(50) = 'Update Test2'
           ,@Subject nvarchar(50) = 'Update Subject'
           ,@Content nvarchar(max) = 'Updated Content'
           ,@IsPublished bit = 0
           ,@ImageUrl nvarchar(255) = 'https://bit.ly/3v3r7Pz'
           ,@DatePublish datetime2(7) = null

	Execute dbo.Blogs_SelectById @Id

	Execute [dbo].[Blogs_Update]
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
