/*
Liste offener Aufträge mit Rückmeldung
*/

select 	ffsh.No_ as No_
		, cast (ffsh.[Order Date] as date) as Order_Date
		, datediff(dd, sh.[DHL Reporting Date], getdate()) as Days_in_Logistics
from Urban_Nav600_SL.dbo.[Urban-Brand GmbH$eBayFFSalesHeader] ffsh with (nolock)
join Urban_Nav600_SL.dbo.[Urban-Brand GmbH$Sales Header] sh with (nolock)
	on sh.No_ = ffsh.No_
where ffsh.[Processing Status] = 0
and ffsh.Type = 1
and ffsh.[Status Fulfillment] <> 2

group by ffsh.No_
		, cast (ffsh.[Order Date] as date)
		, datediff(dd, sh.[DHL Reporting Date], getdate())
