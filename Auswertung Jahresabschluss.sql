/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		scr.[No_]
      ,scr.[Sell-to Customer No_]
		, cast(scr.[Posting Date] as DATE)as RetourenDatum
		, cast(ssh.[Shipment Date] as DATE) as VersandDatum
		, sum(scl.[Amount Including VAT]) as Erstattungsbertrag
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Header] as scr
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] as ssh
  On scr.[External Document No_] = ssh.[External Document No_]
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Line] as scl
  on scr.No_ = scl.[Document No_]
  Where scr.[Posting Date] >= '2014-01-01' AND ssh.[Shipment Date] < '2014-01-01' and scr.[External Document No_] <> ''
  group by scr.[No_]
      ,scr.[Sell-to Customer No_]
		, cast(scr.[Posting Date] as DATE)
		, cast(ssh.[Shipment Date] as DATE)