SELECT 
[Location Code],
--[Item No_],
sum([Item Ledger Entry Quantity]) as ile, 
sum([Invoiced Quantity]) as vkr,
sum([Cost Amount (Actual)]) as Buchwert, 
sum([Cost Amount (Expected)]) as WE_RE
FROM
Urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry]
where [Posting Date] <= '2014-12-31' and [Entry No_] not in ('8990862',
'9519644',
'9519649',
'17486435') 
--and [Location Code] = 'BER_FIEGE' 
--and [Item No_] = '5055192067787'
group by [Location Code]--,[Item No_]