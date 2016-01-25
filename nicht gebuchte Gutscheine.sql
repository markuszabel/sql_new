/****** nicht gebucht Gutscheine ********/

SELECT sh.[External Document No_], 
	cast(sh.[Order Date] as Date) as AuftragsDatum , 
	sh.[Payment Method Code], 
	sl.No_ as Artikel,
	sh.[Waiting for payment receipt]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
  join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
  on sh.No_ = sl.[Document No_]
  Where sh.[Document Type] = '1' and sl.No_ like 'GI%' and sh.[Waiting for payment receipt] = 0
  order by sh.[Payment Method Code]