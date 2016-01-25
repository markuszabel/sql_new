/****** Script for SelectTopNRows command from SSMS  ******/
SELECT No_
	, [Buy-from Vendor Name]
	, [Purchaser Code]
	,cast([Posting Date] as Date)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader]
  Where [Processing Status] = 0 and [Document Type] = 1 And [Status Fulfillment] = 0