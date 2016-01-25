/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Generated at], [Item No_], Quantity, [Return Reason Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Adjustment]
  Where [Fulfillment Setup Code] = 'BER_FIEGE' AND [Item No_] = '7040351005012'
  --order by [Reporting Date] desc