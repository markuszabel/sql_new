with bin_sum as
(Select [Bin Code], [Item No_], sum(Quantity) as Menge
from urban_NAV600.dbo.[Urban-Brand GmbH$Warehouse Entry]
Where [Location Code] = 'WB_RETOURE'
Group by [Bin Code], [Item No_]
Having sum(Quantity) <> 0),
ve as 
(
SELECT ve.[Location Code],ve.[Item No_] AS EAN,
	cast(sum(ve.[Item Ledger Entry Quantity]) as integer) AS Lagerbestand,
	cast(sum(ve.[Cost Posted to G_L]) as decimal (19,2)) AS Lagerwert, 
	cast(sum(ve.[Cost Amount (Expected)]) as decimal (19,2)) AS NochNichtGebuchterLagerwert
FROM Urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve 
WHERE /*cast(ve.[Posting Date] as date) <= '2015-12-31'  and */ ve.[Location Code] = 'WB_RETOURE'
GROUP BY ve.[Location Code], ve.[Item No_]
)

Select bin_sum.[Bin Code], bin_sum.[Item No_], cast(bin_sum.Menge as INT) as Menge, it.Description,it.[Description 2],it.[Attribute 1],
((ve.Lagerwert+ve.NochNichtGebuchterLagerwert)/ve.Lagerbestand) as 'Wert pro Stück'
from bin_sum
Left join ve on bin_sum.[Item No_] = ve.EAN
left Join Urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it on it.No_ = bin_sum.[Item No_] 
order by bin_sum.[Bin Code]
--where bin_sum.[Item No_] = '4260274471678'