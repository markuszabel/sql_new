/****** Versendete Pakete pro Shop und Periode ******/
SELECT  sh.[Reason Code], sh.[Ship-to Country_Region Code] as Land , count(eb.[T&T-Id]) as AnzahlPakete
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as eb with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  on sh.[Order No_] = eb.[Order No_]
  Where month(sh.[Posting Date]) = '1' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH')
  Group By sh.[Ship-to Country_Region Code], sh.[Reason Code]
  order by  sh.[Reason Code],count(eb.[T&T-Id]) desc 
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  sh.[Reason Code],cast(sh.[Posting Date] as DATE),count(sh.No_) as AnzahlOrders
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  Where month(sh.[Posting Date]) = '7' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH')
  Group By  sh.[Reason Code],cast(sh.[Posting Date] as DATE)
  order by  sh.[Reason Code],cast(sh.[Posting Date] as DATE) desc