/* Vergleich Klasse und min/max zwischen PIM und Navision */
with pim_data as
(Select [EAN] as Ean
      ,[Klasse] as Klasse
      , CASE [shop]
         WHEN 'DE Windelbar' THEN 'WINDELBAR'
         WHEN 'CH Windeln' THEN 'USTER'
         WHEN 'DE Windeln' THEN 'BER_FIEGE'
         ELSE ''
         End as Lager
      ,[MaxMengeLager] as Max_wert
from [BI_Data].[test].[MarkusPimProdukt]
)

Select 
st.[Item No_]
,ven.Name
,st.[Replenishment System] as Rep_Sys
,st.[Location Code] as Loc_Nav
,pim_data.Lager as Loc_Pim
,cast(st.[Maximum Inventory] as INT) as Max_Nav
,pim_data.Max_wert as Max_Pim
,st.Klasse as Klasse_Nav
,pim_data.Klasse as Klasse_Pim

FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]  as st
LEFT Join [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Vendor] as ven
on ven.No_ = st.[Vendor No_]
Left Join pim_data 
on pim_data.Ean = st.[Item No_] collate Latin1_General_100_CS_AS
Where st.[Maximum Inventory] = 0 and st.Klasse in ('A','B','C') and st.[Location Code] in ('BER_FIEGE','USTER') --and pim.[shop] = 'DE Windeln'
AND st.[Location Code] = pim_data.Lager 
and st.[Replenishment System] <> 2
AND st.[Location Code] = 'BER_FIEGE'
order by st.[Item No_] asc
