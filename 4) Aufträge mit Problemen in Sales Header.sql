/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Customer] as cu
  on cu.No_ = sh.[Sell-to Customer No_]
  Where sh.Status = 1 and cu.Blocked <> 0