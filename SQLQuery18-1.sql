/****** Script for SelectTopNRows command from SSMS  ******/
SELECT it.No_, it.[Vendor No_] as ItemVendor, st.[Vendor No_] as StockkeepingVendor, st.[Location Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit] as st
  on it.No_ = st.[Item No_] 
  Where st.[Location Code] = 'BER_FIEGE' AND it.[Vendor No_] <> st.[Vendor No_]