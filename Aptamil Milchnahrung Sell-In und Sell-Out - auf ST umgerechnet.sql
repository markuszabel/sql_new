with milupa_raw_data as (
Select year (il.[Posting Date]) as Jahr,
Month(il.[Posting Date]) as Monat,
 il.[Item No_], 
 case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end as Typ,
  it.Description, it.[Description 2], 
  sum(il.Quantity) as Menge_IL,
  case il.[Item No_]
  when '04008976219620' then '4008976022299'
when '04008976219644' then '4008976022305'
when '04008976219651' then '4008976022312'
when '04008976219729' then '4008976022350'
when '04008976219743' then '4008976022367'
when '04008976220114' then '4008976022442'
when '04008976220121' then '4008976022459'
when '04008976220138' then '4008976022466'
when '04008976220145' then '4008976022473'
when '4008976218760' then '4008976032854'
when '4008976219620' then '4008976022299'
when '4008976219644' then '4008976022305'
when '4008976219651' then '4008976022312'
when '4008976219699' then '4008976022329'
when '4008976219705' then '4008976022336'
when '4008976219712' then '4008976022343'
when '4008976219729' then '4008976022350'
when '4008976219743' then '4008976022367'
when '4008976219750' then '4008976033011'
when '4008976220114' then '4008976022442'
when '4008976220121' then '4008976022459'
when '4008976220138' then '4008976022466'
when '4008976220145' then '4008976022473'
else il.[Item No_] end as Stueck_EAN,
  
sum (case il.[Item No_] 
when '04008976219620' then 8* il.Quantity
when '04008976219644' then 4* il.Quantity
when '04008976219651' then 4* il.Quantity
when '04008976219729' then 4* il.Quantity
when '04008976219743' then 8* il.Quantity
when '04008976220114' then 3* il.Quantity
when '04008976220121' then 3* il.Quantity
when '04008976220138' then 3* il.Quantity
when '04008976220145' then 3* il.Quantity
when '4008976218760' then 4* il.Quantity
when '4008976219620' then 8* il.Quantity
when '4008976219644' then 4* il.Quantity
when '4008976219651' then 4* il.Quantity
when '4008976219699' then 4* il.Quantity
when '4008976219705' then 4* il.Quantity
when '4008976219712' then 4* il.Quantity
when '4008976219729' then 4* il.Quantity
when '4008976219743' then 8* il.Quantity
when '4008976219750' then 4* il.Quantity
when '4008976220114' then 3* il.Quantity
when '4008976220121' then 3* il.Quantity
when '4008976220138' then 3* il.Quantity
when '4008976220145' then 3* il.Quantity
	else il.Quantity
end	) as Menge_ST
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on it.No_ = il.[Item No_]
Where 
/*Sell in und Sell out*/il.[Entry Type] in ('0','1')
/*Nur Sell in*/--il.[Entry Type] in ('0')
AND il.[Posting Date] >= '2014-12-01' --and '2014-12-31'
AND il.[Source No_] <> '70748'
AND il.[Location Code] = 'BER_FIEGE'
--and it.[Attribute 2] = '201' 
and it.[Vendor No_] in ('71009','71990')
--AND il.[Item No_] = '4008976022305'
Group by year (il.[Posting Date]), Month(il.[Posting Date]), il.[Item No_], case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end
, it.Description, it.[Description 2])

select milupa_raw_data.Jahr,milupa_raw_data.Monat, milupa_raw_data.Stueck_EAN,it.Description, it.[Description 2], milupa_raw_data.Typ, sum (milupa_raw_data.Menge_ST)
from milupa_raw_data
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on it.No_ = milupa_raw_data.Stueck_EAN
--Where milupa_raw_data.Typ = 'Einkauf'
group by milupa_raw_data.Jahr,milupa_raw_data.Monat, milupa_raw_data.Stueck_EAN ,it.Description, it.[Description 2],milupa_raw_data.Typ
order by milupa_raw_data.Jahr,milupa_raw_data.Monat,milupa_raw_data.Stueck_EAN,milupa_raw_data.Typ, sum (milupa_raw_data.Menge_ST)
