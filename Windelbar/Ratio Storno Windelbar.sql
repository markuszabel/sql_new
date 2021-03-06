/****** Stornierungsrate ******/
SELECT sih.[External Document No_]
, count(sil.[Line No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Line] as sil
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Invoice Header] as sih
  on sil.[Document No_] = sih.No_
  Where sih.[Reason Code] = 'WINDELBAR' and [Posting Group] = 'HANDEL'
  Group By sih.[External Document No_]
  order by sih.[External Document No_]
  
  
Select sh.[External Document No_]
, count(sl.[Line Amount])
from [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as sl
join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as sh
on sl.[Document No_] = sh.No_
Where sh.[Shop Code] = 'WINDELBAR'
group by sh.[External Document No_]
order by sh.[External Document No_]