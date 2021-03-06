/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		cast(ph.[Order Date] as DATE) as Bestelldatum, cast(ph.[Posting Date] as Date) as RückDate, pl.No_ , ph.No_, cast(pl.[Quantity Response] as INT) as Menge, 
		pl.[Unit of Measure Code], pl.[Location Code], ph.[Buy-from Vendor No_], ph.[File No_]
		
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader] as ph
  join  [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseLine] as pl
  on ph.No_ = pl.[Document No_]
  
  Where ph.[Processing Error] = 1 
  AND ph.[Status Fulfillment] = 2 
  AND ph.[Entry No_] = pl.[Document Entry No_] --AND ph.[Buy-from Vendor No_] = '70611'
  AND ph.[Location Code] in ('BER_FIEGE','USTER','WINDELBAR')
  --AND ph.[Buy-from Vendor No_] = '70833'
  --AND ph.No_ = 'BEST-1045453'
  AND pl.[Quantity Response] <> 0
  order by ph.[Buy-from Vendor No_]