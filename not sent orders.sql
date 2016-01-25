/****** Script for SelectTopNRows command from SSMS  ******/
SELECT No_ , [Document Type], [Processing Status], [Status Fulfillment]

	,cast([Posting Date] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader]
  Where  [Document Type] = 12 AND [Status Fulfillment] = 0 And [Processing Status] = 0