/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 
		ph.No_
		, ph.[Group7 Reference]
		, ph.[File No_]
		, ph.[Setup Code]
		, ph.Type
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFPurchaseHeader] as ph
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFProtocol] as fi
  on ph.[File No_] = fi.[File No_]
  Where ph.[Posting Date] > '2013-07-01' And ph.[Setup Code] = 'FIEGE' and fi.[Setup Code] = 'FIEGE' AND ph.Type = 1