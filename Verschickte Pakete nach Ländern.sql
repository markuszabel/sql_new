/*Verschickte Pakete nach Ländern/Regionen*/
SELECT 
	count(ep.[T&T-Id])
	,LEFT( sh.[File No_],2)
	,sh.[Ship-to Country_Region Code]
	--, ep.[Order No_]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as ep with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as sh with (NOLOCK)
  on ep.[Order No_] = sh.No_
  where ep.[Import At] between '2014-05-01' and GETDATE()
  AND sh.Type = 0 and sh.[Order Date] > '2013-05-01'
  group by LEFT( sh.[File No_],2), sh.[Ship-to Country_Region Code]