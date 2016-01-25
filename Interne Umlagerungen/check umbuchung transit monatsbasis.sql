/**  Auswertung 1462 - Inter - Item Ledger mit Unit Cost **/

Select il.[Item No_],il.[Source No_],il.[Location Code],/*cast (il.[Posting Date] as Date) as Buchungsdatum,*/ cast(SUM(il.Quantity)as INT)
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.[No_]
Where il.[Source No_] in ('D1907607')
and month(il.[Posting Date]) = '6' and year(il.[Posting Date]) = '2015'
Group by il.[Item No_],il.[Source No_],/*cast (il.[Posting Date] as Date),*/il.[Location Code]
Having SUM(il.Quantity) <> 0

Select il.[Item No_],il.[Source No_],il.[Location Code],cast (il.[Posting Date] as Date) as Buchungsdatum, cast(SUM(il.Quantity)as INT)
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.[No_]
Where il.[Document No_] = 'UML BER-USTER' AND [Location Code] = 'BER_FIEGE'
and month(il.[Posting Date]) = '6' and year(il.[Posting Date]) = '2015'
Group by il.[Item No_],il.[Source No_],cast (il.[Posting Date] as Date),il.[Location Code]
Having SUM(il.Quantity) <> 0

Select il.[Item No_],il.[Source No_],il.[Location Code],/*cast (il.[Posting Date] as Date) as Buchungsdatum*/ cast(SUM(il.Quantity)as INT)
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.[No_]
Where il.[Source No_] in ('79200')
and month(il.[Posting Date]) = '6' and year(il.[Posting Date]) = '2015'
Group by il.[Item No_],il.[Source No_],/*cast (il.[Posting Date] as Date),*/il.[Location Code]
Having SUM(il.Quantity) <> 0

Select il.[Item No_],il.[Source No_],il.[Location Code],cast (il.[Posting Date] as Date) as Buchungsdatum, cast(SUM(il.Quantity)as INT)
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.[No_]
Where il.[Document No_] = 'UML BER-USTER' AND [Location Code] = 'USTER'
and month(il.[Posting Date]) = '6' and year(il.[Posting Date]) = '2015'
Group by il.[Item No_],il.[Source No_],cast (il.[Posting Date] as Date),il.[Location Code]
Having SUM(il.Quantity) <> 0
