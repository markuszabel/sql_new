/****** Script for SelectTopNRows command from SSMS  ******/
SELECT   left([File No_],2) as "Lager", [Order Date], count (No_) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader]
  Where Type = 0 And [Order Date] > CONVERT(date, GETDATE()-2)
  Group by left([File No_],2), [Order Date]
  order by left([File No_],2), [Order Date]
	