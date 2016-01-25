 SELECT count(sh.[Account No]) as AccountsNotProcessedinTransfer
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Create_UpdateAccount]  as sh with (NOLOCK)
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$AccountResponse] AS sr with (NOLOCK)
  ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL
  
  SELECT cast (sh.[OrderDate] as Date)  as Datum, count (sh.[ExternalDocumentNo] ) as OrdersNotPorcessedinTransfer
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as sh with (NOLOCK)
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentResponse] AS sr ON sr.[Entry No_] = sh.[Entry No_]
  Where  sr.[Entry No_] IS NULL AND sh.Completed = 1
  Group By cast (sh.[OrderDate] as Date) 
  
  SELECT --cast([Posting Date] as Date) as Datum, 
  count(No_) as OrdersNotSent2Log
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] with (NOLOCK)
  Where  [Document Type] = 12 AND [Status Fulfillment] = 0 And [Processing Status] = 0
  --Group By cast([Posting Date] as Date)
  
  SELECT [Purchaser Code]
  ,cast([Posting Date] as Date) as Datum
  ,count(No_) as PurchasesNotSent2Log	
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader] with (NOLOCK)
  Where [Processing Status] = 0 and [Document Type] = 1 And [Status Fulfillment] = 0
  Group by [Purchaser Code], cast([Posting Date] as Date)
  