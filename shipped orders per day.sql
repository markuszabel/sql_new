/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  count (No_)
		,[Posting Date]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header]  
  Where [Reason Code] = 'WINDELN_DE' And [Posting Date] >= '2013-05-15'
  Group By [Posting Date]
  Order by [Posting Date]