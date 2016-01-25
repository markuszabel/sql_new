SELECT sl.No_,sum (sl.Quantity - sl.[Quantity Shipped]), sl.[Location Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  on sl.[Document No_] = sh.No_
  Where sl.[Posting Group] = 'HANDEL' and sh.[Document Type] in ('1','11')
  group by sl.No_,sl.[Location Code]