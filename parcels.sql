/****** Script for SelectTopNRows command from SSMS  ******/
SELECT pa.[Order No_]
      ,pa.[T&T-Id]
      ,pa.[Weight]
      , sh.[Ship-to Country_Region Code]
      , sh.[Ship-to Post Code]
      ,pa.[Import At]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayParcel] as pa
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as sh
  on sh.[Order No_] = pa.[Order No_]
  Where cast(pa.[Import At] as DATE) = '2013-12-09' And sh.[Location Code] in ('WUNDERLAND','WINDELBAR')