select sh.No_, sh.[DHL Reporting Date]

from [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh
join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader] as eb
on sh.No_ = eb.No_

Where sh.[Document Type] = 11

