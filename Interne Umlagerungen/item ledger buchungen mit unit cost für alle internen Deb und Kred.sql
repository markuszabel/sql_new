/**  Auswertung 1462 - Inter - Item Ledger mit Unit Cost **/

Select cast(il.[Posting Date] as Date),il.[Item No_],il.[Source No_],(il.Quantity),il.[Invoiced Quantity], il.[Document No_], ph.[Order No_]
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Rcpt_ Header] as ph with (NOLOCK)
on il.[Document No_] = ph.No_
Where il.[Source No_] in ('79202')
and month(il.[Posting Date]) = '5' and year(il.[Posting Date]) = '2015'
--and ph.[Order No_] = 'BEST-1073467'
and il.[Invoiced Quantity] <> il.Quantity
order by ph.[Order No_], il.[Item No_]