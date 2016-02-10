/****** Aufträge in Logistik älter als 2 Tage  ******/
SELECT  count (No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where DATEDIFF(day, GETDATE(),[DHL Reporting Date]) < -2 And [Document Type] = '11'

SELECT  [Reason Code]
		,count (No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where DATEDIFF(day, GETDATE(),[DHL Reporting Date]) < -2 And [Document Type] = '11'
  --AND [External Document No_] = '1000636062'
  group by [Reason Code]
  --order by Cast ([DHL Reporting Date] as Date)  asc

SELECT  [Location Code]
		, [Reason Code]
		,(No_)
		, Cast ([DHL Reporting Date] as Date) as Übertragen_am
		, [External Document No_]
		,[Shipping Agent Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where DATEDIFF(day, GETDATE(),[DHL Reporting Date]) < -2 And [Document Type] = '11'
  AND [Reason Code] = 'WINDELN_DE'
  --AND [External Document No_] = '1000636062'
  order by Cast ([DHL Reporting Date] as Date)  asc
  