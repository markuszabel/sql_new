/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [No_]
      
      ,[Description]
      
      ,[Description 2]
      ,[Klasse]
      ,[Attribute 5]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item]
  Where [Attribute 5] like '%Ex%' and Klasse not like '%E%'