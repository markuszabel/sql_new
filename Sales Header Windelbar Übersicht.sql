/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
sh.[Released For Shipment]
,count(sh.No_)

  FROM  [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
 Where [Reason Code] = 'WINDELBAR'
  group by sh.[Released For Shipment]
  
Select
count(distinct [Source No_] )
from urban_NAV600.dbo.[Urban-Brand GmbH$Warehouse Shipment Line]
