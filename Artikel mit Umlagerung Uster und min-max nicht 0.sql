Select
	st.[Item No_], it.Description, it.[Description 2],st.[Maximum Inventory], st.[Replenishment System]
	FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit] as st
	Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it on st.[Item No_] = it.No_ 
	Where st.[Maximum Inventory] >2and st.[Location Code] = 'USTER' and st.[Replenishment System] = '2'