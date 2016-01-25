Select cl.Identifier, it.Description, it.[Description 2],sum(cl.Quantity)

from urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentLine] as cl with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as ch with (NOLOCK) on cl.[Header Entry No_] = ch.[Entry No_]
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Item] as it with (NOLOCK) on it.No_ = cl.Identifier
Where ch.Shipment_Address_Country = 'IT' and ch.OrderDate > '2015-04-01' and cl.Identifier NOT LIKE 'REF%'

group by cl.Identifier, it.Description, it.[Description 2]
Having sum(cl.Quantity) >= 5
Order by sum(cl.Quantity) desc