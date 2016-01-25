

SELECT cast(sil.[Unit Price] as Float), count(sih.No_) as Bestellungen, cast(sum(sil.Quantity) as INT) as Menge, cast(sih.[Posting Date] as DATE), mag.gruppe--, cu.Mail
  FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil with (NOLOCK)
  Join [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih with (NOLOCK)
  on sil.[Document No_] = sih.No_
  Left Join MAG_BI_Import.dbo.mage_customer as mag with (NOLOCK)
  on sih.[Sell-to Customer No_] = mag.No_ collate Latin1_General_CI_AS
  --Left Join [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Customer] as cu with (NOLOCK)
 -- on sih.[Sell-to Customer No_] = cu.No_
  
  
  Where sil.No_ = '04008976219644' and sih.[Posting Date] >= '2014-04-01'-- and  mag.gruppe = 'General'
  group by sil.[Unit Price], sih.[Posting Date], mag.gruppe
  order by sih.[Posting Date]