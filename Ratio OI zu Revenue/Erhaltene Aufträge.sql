/****** Alle pro Periode erhaltene Aufträge ******/
Select ch.[Shop Code], cast(OrderDate as DATE) , COUNT( ch.ExternalDocumentNo) as OI
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as ch with (NOLOCK)
Where  ch.OrderDate > '2015-06-15' and ch.[Shop Code] = 'WINDELN_DE'
Group by ch.[Shop Code], cast(OrderDate as DATE) 
order by cast(OrderDate as DATE)  