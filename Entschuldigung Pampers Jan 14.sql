SELECT 
      sh.[External Document No_], cu.[E-Mail], cu.Name, sh.[Order Date], sh.[Payment Method Code], sh.Shared , sl.No_
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
  on sh.No_ = sl.[Document No_]
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Customer] as cu with (NOLOCK)
  on cu.No_ = sh.[Sell-to Customer No_]
  WHERE sh.[Document Type] in ('1') And sh.Status = '1'
	and sl.No_ in ('4015400526995','4015400527282','4015400527473','4015400529750','4015400529781','4015400533900','4015400543039','4015400543794','4015400544180','4015400544241','4015400544463','4015400544494','4015400544555','4015400544616','4015400544678','4015400549437','4015400552529','4015400557425','4015400591504')
	AND sh.[External Document No_] Like '1%'
	Order by sh.[Order Date]