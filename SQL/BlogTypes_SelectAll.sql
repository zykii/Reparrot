﻿USE [ReParrot]
GO
/****** Object:  StoredProcedure [dbo].[BlogTypes_SelectAll]    Script Date: 2/13/2023 7:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Isaiah Lewis
-- Create date: 12/19/2022
-- Description:	Select All BlogTypes (No Pagination)
-- Code Reviewer: Jacob Helton 


-- MODIFIED BY: author
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note: 
-- =============================================

ALTER proc [dbo].[BlogTypes_SelectAll]

as

/*

	Execute [dbo].[BlogTypes_SelectAll]

*/

BEGIN

		SELECT	[Id]
				,[Name]
		  FROM	[dbo].[BlogTypes] 

END
