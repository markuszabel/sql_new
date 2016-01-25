/******* Artikel mit Bestandsdifferenzen aus Bestandsabgleich FF an einem bestimmten Tag ******/

Select 
cast(ffi.[Reporting Date] as DATE) as Melde_Datum, 
ffi.[Item No_],
it.Description, 
it.[Description 2], 
cast(ffi.Quantity as INT) as Differenz, 
cast(ffi.[Qty_ (Phys_ Inventory)] as INT) as Menge_Fiege, 
cast(ffi.[Qty_ at Creation (Calculated)] as INT) as Menge_Win

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Inventory ] as ffi with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
  on ffi.[Item No_] = it.No_
  Where ffi.[Reporting Date] > GETDATE()-1 and ffi.Quantity < 0