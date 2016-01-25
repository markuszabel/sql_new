/******* orders with problems in the waiting list  *********/
Select  distinct cast([Conducted at] as Date), [Shop Code], Error, Cleared, Comment
	FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCLog] 
	Where Error = 1 and Comment NOT Like 'Warten%' and cast([Conducted at] as Date) > GETDATE()-1
	order by cast([Conducted at] as Date) desc