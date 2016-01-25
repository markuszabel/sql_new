/****** Aufträge in Logistik älter als 2 Tage  ******/
with oi_item as
(
SELECT  sum((cdl.Quantity * cdl.UnitPrice_Gross)) as oi_gross_item,cdh.[Shop Code], cdl.UnitPrice_GrossCurrency
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
  on cdl.[Header Entry No_] = cdh.[Entry No_]
  Where month(cdh.OrderDate) = month(getdate()) and year(cdh.OrderDate) = year(getdate()) and cdh.[Shop Code] = 'WINDELN_IT'
  and cdh.OrderDate >'2015-11-22'
  group by cdh.[Shop Code], cdl.UnitPrice_GrossCurrency
),
oi_ship as
(  
 SELECT  sum(cdh.Shipment_Charges_Final_Gros) as oi_gross_ship, cdh.[Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
  Where month(cdh.OrderDate) = month(getdate()) and year(cdh.OrderDate) = year(getdate()) and cdh.[Shop Code] = 'WINDELN_IT'
  and cdh.OrderDate >'2015-11-22'
  Group by cdh.[Shop Code]
 )
 
 Select oi_item.[Shop Code],oi_item.UnitPrice_GrossCurrency, (oi_item.oi_gross_item + oi_ship.oi_gross_ship) as oi_total
 from oi_item
 left join oi_ship on oi_item.[Shop Code] = oi_ship.[Shop Code]

  