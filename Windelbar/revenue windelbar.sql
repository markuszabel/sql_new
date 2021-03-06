/****** Script for SelectTopNRows command from SSMS  ******/
SELECT	sum(sil.[Amount Including VAT])
		, sih.[Reason Code]
		, sih.[Currency Code]
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil
Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih
	on sil.[Document No_] = sih.No_
Where year(sih.[Posting Date]) = '2014' 
and month(sih.[Posting Date]) = '8' 
and sih.[Sell-to Contact No_] not in ('D1563736')
-- sih.[Reason Code] in ('WINDELN_DE','WINDELBAR','WUNDERLAND','WINDELN_CH','MKB','EBAY')
Group by sih.[Reason Code], sih.[Currency Code]