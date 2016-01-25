/****** Aptamil Sell-in and Sell-out *******/

Select Month(il.[Posting Date]) as Monat, il.[Item No_], case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end
, it.Description, it.[Description 2], 
--sum(cast(Quantity as INT))
sum (case il.[Item No_] 
	when '04008976219620' then il.Quantity * 8
	when '04008976219644' then il.Quantity * 4
	When '04008976219651' then il.Quantity * 4
	when '04008976219729' then il.Quantity * 4
	when '04008976220114' then il.Quantity * 3
	when '04008976220121' then il.Quantity * 3
	when '04008976220138' then il.Quantity * 3
	when '04008976220145' then il.Quantity * 3
	when '4008976219620' then il.Quantity * 8
	when '4008976219644' then il.Quantity * 4
	when '4008976219651' then il.Quantity * 4
	when '4008976219699' then il.Quantity * 4
	when '4008976219705' then il.Quantity * 4
	when '4008976219712' then il.Quantity * 4
	when '4008976219729' then il.Quantity * 4
	when '4008976219743' then il.Quantity * 8
	when '4008976219750' then il.Quantity * 4
	when '4008976220114' then il.Quantity * 4
	when '4008976220121' then il.Quantity * 4
	when '4008976220138' then il.Quantity * 4
	when '4008976220145' then il.Quantity * 4
	else il.Quantity
end	) as Menge
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on it.No_ = il.[Item No_]
Where il.[Item No_] in ('04008976219620','04008976219644','04008976219651','04008976219699','04008976219705','04008976219712','04008976219729','04008976219743','04008976220114','04008976220121','04008976220138','04008976220145','4008976022299','4008976022305','4008976022312','4008976022329','4008976022336','4008976022343','4008976022350','4008976022367','4008976022442','4008976022459','4008976022466','4008976022473','4008976022602','4008976022619','4008976022626','4008976219620','4008976219644','4008976219651','4008976219699','4008976219705','4008976219712','4008976219729','4008976219743','4008976220114','4008976220121','4008976220138','4008976220145')
AND il.[Entry Type] in ('0','1')
AND il.[Posting Date] between '2014-11-01' and '2014-11-30'
AND il.[Source No_] <> '70748'
AND il.[Location Code] = 'BER_FIEGE'
--AND il.[Item No_] = '4008976022305'
Group by Month(il.[Posting Date]), il.[Item No_], case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end
, it.Description, it.[Description 2]