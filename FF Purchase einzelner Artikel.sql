/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ffpl.[Document No_]
		, ffpl.[Document Entry No_]
		,ffph.[File No_]
      ,cast(ffpl.[Order Date] as Date) as Bestelldatum
      ,cast( ffpl.[Expected Receipt Date] as Date) as Lieferdatum
      ,ffpl.[Buy-from Vendor No_] as Kreditor
      ,ffpl.[No_]
      ,ffpl.[Description]
      ,ffpl.[Description 2]
      ,cast((ffpl.[Quantity] * ffpl.[Qty_ per Unit of Measure])as int) as Menge
      ,cast((ffpl.[Quantity Received]* ffpl.[Qty_ per Unit of Measure]) as int) as Geliefert
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseLine] as ffpl
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader] as ffph
  on ffpl.[Document No_] = ffph.No_
  Where ffpl.No_ = '8003921392263' 
  And ffpl.[Order Date] >= '2015-05-01'
  AND ffpl.[Document Entry No_] = ffph.[Entry No_]
  AND ffpl.[Location Code] = 'MIL_FIEGE'
  Order by ffpl.[Document No_], ffpl.[Document Entry No_] Asc