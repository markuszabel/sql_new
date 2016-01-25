select sh.No_,cast(sh.[DHL Reporting Date] as Date), LEFT(esh.[File No_],2) as "Lager"
 FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
 Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as esh
on sh.No_ = esh.No_
Where sh.[Document Type] = 11 
AND sh.[DHL Reporting Date] < '2013-07-30'
AND sh.[External Document No_] like '1%'
AND LEFT(esh.[File No_],2) like 'A%'