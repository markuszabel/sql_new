/*
Pivottabelle für Brüche pro Monat pro Kreditor
*/

select	EAN as "Brueche pro Monat"
		, isnull([1],0) as "Jan"
		, isnull([2],0) as "Feb"
		, isnull([3],0) as "Mar"
		, isnull([4],0) as "Apr"
		, isnull([5],0) as "Mai"
		, isnull([6],0) as "Jun"
		, isnull([7],0) as "Jul"

from
(
	select DATEPART(mm, ile.[Posting Date]) as Retouren_Monat
			, [Item No_] as EAN
			, cast (ile.Quantity as int) as Anzahl
	from Urban_NAV600_SL.dbo.[Urban-Brand GmbH$Item Ledger Entry] ile

	join Urban_NAV600_SL.dbo.[Urban-Brand GmbH$Item] i
		on i.No_ = ile.[Item No_]

	where [Return Reason Code] in ('R4','P9')
		and [Posting Date] >= '2014-01-01'
		and i.[Vendor No_] in ('71038', '71711')
) as resultset

PIVOT
(
SUM(Anzahl) 
for Retouren_Monat in ([1], [2], [3], [4], [5], [6], [7])
) as PivotTable

order by EAN asc