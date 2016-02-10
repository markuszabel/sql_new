With stock as
(SELECT il.[Location Code]
      ,cast(sum(il.[Quantity]) as INT) as Menge
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
  --WHERE  [Posting Date] <= '2016-01-31'
  group by il.[Location Code]),
ve as 
(SELECT 
[Location Code],
cast(sum([Item Ledger Entry Quantity]) as INT) as ile, 
cast(sum([Cost Amount (Actual)]) as Decimal (18,2)) as '1140',
 cast(sum([Cost Amount (Expected)]) as Decimal(18,2)) as 'WeRe',
 cast((sum ([Cost Amount (Actual)])  + sum([Cost Amount (Expected)])) as Decimal(18,2)) as 'Gesamtwert'
FROM
Urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] with (NOLOCK)
--where [Posting Date] <= '2016-01-31' 
group by [Location Code])

Select stock.*, ve.ile, ve.[1140], ve.WeRe, ve.Gesamtwert
from stock
left join ve on ve.[Location Code] = stock.[Location Code]
--Where stock.[Location Code] in ('TRANS_09','WDB_FIEGE','WB_RETOURE')
Order by stock.Menge desc
