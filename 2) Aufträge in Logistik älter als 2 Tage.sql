/****** Aufträge in Logistik älter als 2 Tage  ******/
SELECT  [Location Code]
		,(No_)
		, Cast ([DHL Reporting Date] as Date) as Übertragen_am
		, [External Document No_]
		, [Sell-to Customer No_]
		,[Shipping Agent Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  Where DATEDIFF(day, GETDATE(),[DHL Reporting Date]) < -4 And [Document Type] = '11'-- AND [Reason Code]  = 'WINDELBAR'
  order by Cast ([DHL Reporting Date] as Date)  asc
  