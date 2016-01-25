Select count(sh.No_), Cast(sh.[DHL Reporting Date] as Date), left(eb.[File No_],2)
From urban_NAV600.dbo.[Urban-Brand GmbH$Sales Header] as sh
Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFSalesHeader] as eb
on sh.No_ = eb.No_
Where sh.[Reason Code] = 'WINDELN_DE' And sh.[Document Type] = 11
Group by Cast(sh.[DHL Reporting Date] as Date),left(eb.[File No_],2)
Order by Cast(sh.[DHL Reporting Date] as Date),left(eb.[File No_],2) desc