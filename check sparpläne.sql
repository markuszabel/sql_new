Select cdl.Identifier, cdh.ExternalDocumentNo,cdh.Payment_Method_WebshopMethod ,cast(cdh.OrderDate as Date) as OrderDate
from urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
Left join urban_NAV600.dbo.[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
on cdl.[Header Entry No_] = cdh.[Entry No_]
Where cdh.OrderDate >= '2016-01-01' and cdl.Identifier Like 'SPAR%'
order by cdh.OrderDate