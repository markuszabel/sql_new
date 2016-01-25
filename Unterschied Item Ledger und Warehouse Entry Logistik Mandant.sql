/*Unterschiede Item Leger und Warehouse Entry Logistik Mandant*/
with logBest as
(Select
il.[Item No_] as Artikel,  isnull(sum(il.Quantity),0) as Bestand
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Where il.[Location Code] = 'USTER'
group by il.[Item No_]

),
binBest as
(
	Select
	ib.[Item No_] as Artikel,  isnull(sum(ib.Quantity),0) as Bestand
	FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Warehouse Entry] as ib
	Where ib.[Location Code] = 'USTER'
	group by ib.[Item No_]

)

Select it.No_, logBest.Bestand, binBest.Bestand

	FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
	Left Join logBest on logBest.Artikel = it.No_
	Left Join binBest on binBest.Artikel = it.No_
Where logBest.Bestand <> binBest.Bestand
	