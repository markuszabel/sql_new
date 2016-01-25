/* Korrekturbuchungen */

--select * from [urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line]
--where [Return Reason Code]='K03';

--select * from [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line]
--where [Return Reason Code]='K03';

Declare @fromdate date = '2013-07-01'
Declare @todate date = '2013-07-31'

-- Item No_, Quantitz, Amount Including VAT, Return Reason Code from Purchase Line
select	No_,
		Description,
		[Pay-to Vendor No_],
		Quantity,
		[Line Amount], 
		[Return Reason Code], 
		cast( [Order Date] as date) as "Order Date" 

from [urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line]
where	(([Pay-to Vendor No_] in ('70313','70619')) or ([Buy-from Vendor No_] in ('70313','70619')))
		and (cast([Order Date] as date) between @fromdate and @todate)
		and [Return Reason Code] is not null
order by No_ asc
;

