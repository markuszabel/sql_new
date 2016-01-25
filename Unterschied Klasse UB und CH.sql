/*
Query to determine class differences by Lagerort
*/

with skuB as
(select	[Item No_],Klasse
from urban_NAV600.dbo.[Urban-Brand GmbH$Stockkeeping Unit] with (NOLOCK)
where [Location Code] = 'BER_FIEGE')

select	i.No_

		, i.Description
		, i.[Description 2]
		,i.[Attribute 2]
		, skuB.Klasse as BER_FIEGE
		, i.Klasse as Klasse_Artikelkarte
from urban_NAV600.dbo.[Urban-Brand GmbH$Item] as i with (Nolock)
	join skuB on i.No_=skuB.[Item No_]
where  i.Klasse <> skuB.Klasse and i.Klasse <> 'W'
	