/****** Script for SelectTopNRows command from SSMS  ******/
SELECT No_, [Last Direct Cost], Klasse
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item]
  Where Klasse in ('A', 'B', 'C', 'E', 'EA', 'EB', 'EC', 'D', 'K')