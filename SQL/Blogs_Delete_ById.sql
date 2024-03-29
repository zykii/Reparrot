﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[Blogs_Delete_ById]    Script Date: 2/13/2023 7:35:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 12/19/2022
-- Description:	Blogs Delete By Id
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[Blogs_Delete_ById]

		@Id int

as

/*---------------TEST CODE------------------

	Declare @Id int = 5

	Execute dbo.Blogs_SelectById @Id 

	Execute [dbo].[Blogs_Delete_ById] @Id 

	Execute dbo.Blogs_SelectById @Id 

*/

BEGIN

	DELETE FROM [dbo].[Blogs]
	WHERE Id = @Id

END
