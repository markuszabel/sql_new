/****** Script for SelectTopNRows command from SSMS  ******/
SELECT il.[Item No_]
		,il.[Location Code]
      ,sum(il.[Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
  WHERE il.[Location Code] in ('WINDELBAR','BER_FIEGE','USTER') and il.[Item No_] = '0000000001236'
  group by il.[Item No_],il.[Location Code]
  Having sum(il.[Quantity]) <> 0
  
	


