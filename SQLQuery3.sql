/****** Script for SelectTopNRows command from SSMS  ******/
Select [Item No_]

FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Inventory ]

Where [Item No_] in (SELECT [Item No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Inventory ]
Where [Reporting Date] = '2013-07-29'
AND Quantity <>0
AND [Fulfillment Setup Code] = 'BER_FIEGE')
AND Quantity <> 0
AND [Fulfillment Setup Code] = 'FIEGE'
AND [Reporting Date] = '2013-07-29'