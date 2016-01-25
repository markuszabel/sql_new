/****** Script for SelectTopNRows command from SSMS  ******/
SELECT   count(No_)
	, [Posting Date]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header]
  Where [Location Code] = 'WINDELBAR' And [Posting Date] > '2013-04-15'
  Group by [Posting Date]