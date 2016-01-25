Select 
	cl.[Document No_]
	, cl.No_
	, CAST(cl.[Amount Including VAT] as FLOAT) *-1
	, cl.[Return Reason Code]
	, cast(ch.[Posting Date] as DATE)
	, cast(cl.Quantity as INT) * -1
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Line] as cl
join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Cr_ Memo Hdr_] as ch
on cl.[Document No_] = ch.No_
Where ch.[Posting Date] between '2013-08-01' and '2013-09-30' 
and ch.[Buy-from Vendor No_] = '70313'
AND cl.[Return Reason Code] like 'K%'


Select 
	pl.[Document No_]
	, pl.No_
	, CAST(pl.[Amount Including VAT] as FLOAT)
	, pl.[Return Reason Code]
		, cast(ph.[Posting Date] as DATE)
	, cast(pl.Quantity as INT)
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Line] as pl
join [urban_NAV600].[dbo].[Urban-Brand GmbH$Purch_ Inv_ Header] as ph
on pl.[Document No_] = ph.No_
Where ph.[Posting Date] between  '2013-08-01' and '2013-09-30'  
and ph.[Buy-from Vendor No_] = '70313'
AND pl.[Return Reason Code] like 'K%'