SELECT [Released For Shipment] ,count([No_] ) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  WHERE [Reason Code] = 'WUNDERLAND' AND [Document Type] = 1
  Group by [Released For Shipment]


SELECT [Order Date]
      , count([No_] ) as Anzahl , [Payment Method Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  WHERE [Reason Code] = 'WUNDERLAND' and [Document Type] = 1
  GROUP BY [Order Date], [Payment Method Code]
  ORDER BY [Order Date] asc