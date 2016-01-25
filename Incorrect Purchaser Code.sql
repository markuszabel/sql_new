Select st.[Item No_],st.[Location Code], st.[Purchaser Code] as StockPurch,ven.[Purchaser Code] as VenPurch, ven.No_, ven.Name
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]  as st
LEFT Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Vendor] as ven
on ven.No_ = st.[Vendor No_]
Where st.[Purchaser Code] <> ven.[Purchaser Code] and st.[Location Code] in ('BER_FIEGE','USTER')
order by ven.No_

Select st.[Item No_],st.[Location Code], st.[Maximum Inventory],st.Klasse, ven.Name
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]  as st
LEFT Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Vendor] as ven
on ven.No_ = st.[Vendor No_]
Where st.[Maximum Inventory] = 0 and st.Klasse in ('A','B','C') and st.[Location Code] = 'BER_FIEGE'
order by st.[Item No_] asc

Select st.[Item No_],st.[Location Code], st.[Maximum Inventory],st.Klasse, ven.Name, ven.[Purchaser Code]
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]  as st
LEFT Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Vendor] as ven
on ven.No_ = st.[Vendor No_]
Where st.Klasse in ('W') and st.[Location Code] = 'BER_FIEGE'
order by st.[Item No_] asc