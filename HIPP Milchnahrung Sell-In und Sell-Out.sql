with hipp_raw_data as (
Select year (il.[Posting Date]) as Jahr,
Month(il.[Posting Date]) as Monat,
 il.[Item No_], 
 case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end as Typ,
  it.Description, it.[Description 2], 
  sum(il.Quantity) as Menge_IL,
  il.[Item No_] as Stueck_EAN,
  
sum (il.Quantity) as Menge_ST
from [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on it.No_ = il.[Item No_]
Where 
/*Sell in und Sell out*/il.[Entry Type] in ('0','1')
/*Nur Sell in*/--il.[Entry Type] in ('0')
AND il.[Posting Date] >= '2014-01-01' --and '2014-12-31'
AND il.[Source No_] <> '70748'
AND il.[Location Code] = 'BER_FIEGE'
and it.[Attribute 2] = '201' 
and it.[Vendor No_] in ('71002','71995')
--AND il.[Item No_] = '4008976022305'
Group by year (il.[Posting Date]), Month(il.[Posting Date]), il.[Item No_], case when il.[Entry Type] = 0 then 'Einkauf' else 'Verkauf' end
, it.Description, it.[Description 2])

select hipp_raw_data.Jahr,hipp_raw_data.Monat, hipp_raw_data.Stueck_EAN,it.Description, it.[Description 2], hipp_raw_data.Typ, sum (hipp_raw_data.Menge_ST)
from hipp_raw_data
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on it.No_ = hipp_raw_data.Stueck_EAN
--Where milupa_raw_data.Typ = 'Einkauf'
group by hipp_raw_data.Jahr,hipp_raw_data.Monat, hipp_raw_data.Stueck_EAN ,it.Description, it.[Description 2],hipp_raw_data.Typ
order by hipp_raw_data.Jahr,hipp_raw_data.Monat,hipp_raw_data.Stueck_EAN,hipp_raw_data.Typ, sum (hipp_raw_data.Menge_ST)
