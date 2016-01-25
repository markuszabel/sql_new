with NoParc as (
SELECT  sh.[Reason Code],month(sh.[Posting Date]) as Monat, count(eb.[T&T-Id]) as AnzahlPakete
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as eb with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  on sh.[Order No_] = eb.[Order No_]
  Where month(sh.[Posting Date]) >= '1' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH','WINDELN_IT')
  Group By  sh.[Reason Code],month(sh.[Posting Date])),
NoOrders as (
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  sh.[Reason Code],month(sh.[Posting Date]) as Monat,count(sh.No_) as AnzahlOrders
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  Where month(sh.[Posting Date])  >= '1' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH','WINDELN_IT')
  Group By  sh.[Reason Code],month(sh.[Posting Date])),

NoExt as (
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  sh.[Reason Code],month(sh.[Posting Date]) as Monat,count( distinct sh.[External Document No_]) as AnzahlExtOrders
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  Where month(sh.[Posting Date]) >= '1' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH','WINDELN_IT')
  Group By  sh.[Reason Code],month(sh.[Posting Date])),

NoPieces as (
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  sh.[Reason Code],month(sh.[Posting Date]) as Monat,sum(sl.Quantity) as AnzahlPieces
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Line] as sl with (NOLOCK)
  Left Join  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh with (NOLOCK)
  on sh.No_ = sl.[Document No_]
  Where month(sh.[Posting Date]) >= '1' and  year(sh.[Posting Date]) = '2015'  AND
  sh.[Reason Code] in ('WINDELBAR','WUNDERLAND','WINDELN_DE','WINDELN_CH','WINDELN_IT') and sl.Type = '2'
  Group By  sh.[Reason Code],month(sh.[Posting Date]))


  Select NoExt.[Reason Code], NoExt.Monat, NoExt.AnzahlExtOrders, NoOrders.AnzahlOrders, NoParc.AnzahlPakete, NoPieces.AnzahlPieces
  from NoExt
  Left join NoOrders on NoExt.[Reason Code] = NoOrders.[Reason Code] and NoExt.Monat = NoOrders.Monat
  Left join NoParc on NoParc.[Reason Code] = NoExt.[Reason Code] and NoExt.Monat = NoParc.Monat 
  Left Join NoPieces on NoExt.[Reason Code] = NoPieces.[Reason Code] and NoPieces.Monat = NoExt.Monat
  order by NoExt.[Reason Code], NoExt.Monat