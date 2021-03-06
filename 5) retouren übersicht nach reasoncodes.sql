/****** Übersicht offene Retouren  ******/
SELECT 		[Reason Code]
		,count([No_]) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Document Type] = 5
  Group by [Reason Code]
  order by [Reason Code]
  
  SELECT 		[Reason Code]
		,cast([Document Date] as Date) as Datum
		,count([No_]) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where [Document Type] = 5
  Group by [Reason Code], [Document Date]
  order by [Reason Code], [Document Date]