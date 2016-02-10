SELECT 
[Location Code],
--[Item No_],
sum([Item Ledger Entry Quantity]) as ile, 
sum([Invoiced Quantity]) as vkr,
sum([Cost Amount (Actual)]) as Buchwert, 
sum([Cost Amount (Expected)]) as WE_RE,
sum([Cost Amount (Actual)]) + sum([Cost Amount (Expected)]) as Gesamt
FROM
Urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry]
where [Posting Date] <= '2015-12-31' 
/*and [Entry No_] not in ('8990862',
'9519644',
'9519649',
'17486435') 
--and [Location Code] = 'BER_FIEGE' 
--and [Item No_] = '5055192067787'*/
group by [Location Code]--,[Item No_]
order by (sum([Cost Amount (Actual)]) + sum([Cost Amount (Expected)])) desc



