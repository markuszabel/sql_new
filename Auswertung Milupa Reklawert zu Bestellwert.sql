with rekla as
(SELECT sum(pcl.Amount) as Value, month(pcl.[Posting Date]) as Monat
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line]  as pcl with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Hdr_] as phl with (NOLOCK) 
  on pcl.[Document No_] = phl.No_
  WHERE pcl.[Posting Group] = 'HANDEL'
  AND phl.[Buy-from Vendor No_] = '71009'
  AND pcl.[Location Code] = 'BER_FIEGE'
  AND pcl.[Posting Date] > '2013-12-31'
  AND phl.No_ <> 'EKAGS-105228'
  Group by  month(pcl.[Posting Date])
), 
eink as
(SELECT sum(pcl.Amount) as Value, month(pcl.[Posting Date]) as Monat
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line]  as pcl with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Header] as phl with (NOLOCK) 
  on pcl.[Document No_] = phl.No_
  WHERE pcl.[Posting Group] = 'HANDEL'
  AND phl.[Buy-from Vendor No_] = '71009'
  AND pcl.[Location Code] = 'BER_FIEGE'
  AND pcl.[Posting Date] > '2013-12-31'
  Group by  month(pcl.[Posting Date])
)
 
select eink.Monat, cast(eink.Value as float) as PurchVolume, cast(rekla.Value as float) as CredVolume, (rekla.Value/eink.Value) as ratio
from eink
Join rekla on eink.Monat = rekla.Monat