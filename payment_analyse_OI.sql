with rev_order as
(Select cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate) as Monat,cua.TypeId,sum(cdl.Quantity* cdl.UnitPrice_Gross) as Summe_Order
from urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
on cdl.[Header Entry No_] = cdh.[Entry No_]
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Create_UpdateAccount] as cua with (NOLOCK)
on cdh.[Account Entry No_] = cua.[Entry No_]
Where cdh.OrderDate >= '2015-01-01' --and cdh.[Shop Code] = 'WINDELN_IT' and cdh.Payment_Method_WebshopMethod = 'prepayhyp'
Group by cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate), cua.TypeId),

rev_ship as 
(Select cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate) as Monat, cua.TypeId, sum(Shipment_Charges_Final_Gros) as Summe_Ship
from urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Create_UpdateAccount] as cua with (NOLOCK)
on cdh.[Account Entry No_] = cua.[Entry No_]
Where OrderDate >= '2015-01-01'
Group by cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate), cua.TypeId),

rev_numbers as
(Select cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate) as Monat, cua.TypeId, count(distinct cdh.ExternalDocumentNo) as Anzahl_Orders
from urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Create_UpdateAccount] as cua with (NOLOCK)
on cdh.[Account Entry No_] = cua.[Entry No_]
Where OrderDate >= '2015-01-01'
Group by cdh.[Shop Code], cdh.Payment_Method_WebshopMethod, Month(cdh.OrderDate), cua.TypeId
)

Select rev_numbers.*, rev_order.Summe_Order, rev_ship.Summe_Ship
From rev_numbers
left join rev_ship 
on rev_numbers.Payment_Method_WebshopMethod = rev_ship.Payment_Method_WebshopMethod 
and rev_numbers.[Shop Code] = rev_ship.[Shop Code]
and rev_numbers.TypeId = rev_ship.TypeId
and rev_numbers.Monat = rev_ship.Monat
left join rev_order
on rev_numbers.Payment_Method_WebshopMethod = rev_order.Payment_Method_WebshopMethod 
and rev_numbers.[Shop Code] = rev_order.[Shop Code]
and rev_numbers.TypeId = rev_order.TypeId
and rev_numbers.Monat = rev_order.Monat