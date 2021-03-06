/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sl.No_,
	sum(sl.Quantity)

  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as sl with (NOLOCK)
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as sh with (NOLOCK)
  on sl.[Document No_] = sh.No_
  Where sh.Status = '0' and sl.No_ like '%7640104951469%'
  Group by sl.No_
  
  
 SELECT sl.Identifier, SUM( sl.Quantity)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as sh with (NOLOCK)
  LEFT Outer JOIN Urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentResponse] AS sr with (NOLOCK)
  ON sr.[Entry No_] = sh.[Entry No_]
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as sl with (NOLOCK)
  on sh.[Entry No_] = sl.[Header Entry No_]
  Where  sr.[Entry No_] IS NULL AND sh.Completed = 1 AND sl.Identifier like '%7640104951469%'
  Group by sl.Identifier
  
  