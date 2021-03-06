/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct it.No_,
	it.Description
	,Vorgängerartikel
	,sum(il.Quantity)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il
  on it.No_ = il.[Item No_]
  Where it.Vorgängerartikel <> '' AND it.Klasse in ('A','B','C')
  Group by it.No_, it.Description, Vorgängerartikel