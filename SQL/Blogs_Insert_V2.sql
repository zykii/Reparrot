﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Insert_V2]    Script Date: 2/13/2023 7:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 1/7/2023
-- Description:	Blogs Insert V2
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Insert_V2]

			@BlogTypeId int
           ,@AuthorId int 
           ,@Title nvarchar(50)
           ,@Subject nvarchar(50)
           ,@Content nvarchar(max) = null
           ,@ImageUrl nvarchar(255) = null
           ,@DatePublish datetime2(7) = null
		   ,@Id int OUTPUT

as

/*---------------TEST CODE------------------

	Declare @Id int = 0

	Declare @BlogTypeId int = 3
           ,@AuthorId int = 1
           ,@Title nvarchar(50) = 'Test Title'
           ,@Subject nvarchar(50) = 'Subject Test'
           ,@Content nvarchar(max) = null
           ,@ImageUrl nvarchar(255) = null
           ,@DatePublish datetime2(7) = null

	Execute [dbo].[Blogs_Insert_V2]
			@BlogTypeId 
           ,@AuthorId
           ,@Title
           ,@Subject
           ,@Content 
           ,@ImageUrl 
           ,@DatePublish
		   ,@Id OUTPUT

	Execute dbo.Blogs_SelectById @Id 

*/

BEGIN

	INSERT INTO	[dbo].[Blogs]
				([BlogTypeId]
				,[AuthorId]
				,[Title]
				,[Subject]
				,[Content]
				,[ImageUrl]
				,[DatePublish])
     VALUES
				(@BlogTypeId
				,@AuthorId
				,@Title
				,@Subject
				,@Content
				,@ImageUrl
				,@DatePublish)

	SET @Id = SCOPE_IDENTITY();

END
