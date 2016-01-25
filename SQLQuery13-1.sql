SELECT sl.No_, sh.[Payment Method Code], sh.[Order Date], sh.[External Document No_], sh.[Document Type]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
  on sh.No_ = sl.[Document No_]
  WHERE sl.No_ like 'GIFT%'