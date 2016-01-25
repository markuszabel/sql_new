SELECT 
	  sl.[Document No_]
      ,sh.[Status]
      ,sh.[Document Type] 
      ,sh.[Fully Available Date]
      ,sl.[Location Code]
      ,sum(sl.[Outstanding Quantity]) as Oust_Qty
  
  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl
  	left join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
 	on sl.[Document No_] = sh.[No_] 
  
  WHERE sh.[Fully Available Date] > '2000-01-01'
  	AND sh.[Fully Available Date] < DATEADD(day, -2, getdate())
  	AND sh.[Status] = '1'
  	AND sh.[Document Type] = '11'
  	AND sl.[Outstanding Quantity] > 0
  	
  GROUP BY
  	  sl.[Document No_]
      ,sh.[Status]
      ,sh.[Document Type] 
      ,sh.[Fully Available Date]
      ,sl.[Location Code]
  
  ORDER BY
  	sh.[Fully Available Date] asc