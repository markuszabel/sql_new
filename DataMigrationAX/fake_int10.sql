Declare @venshipno as varchar(20) = 'TRANS_NAV_AX';
with prh_max as
(Select [Order No_], cast(max([Posting Date]) as Date) as PostMaxDate, cast(min([Posting Date]) as Date) as PostMinDate
from urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Rcpt_ Header] 
group by [Order No_]
)


Select distinct ph.No_, prh_max.PostMinDate,prh_max.PostMaxDate, cast(ph.[Order Date] as Date) as OrderDate,ph.[Buy-from Vendor No_],@venshipno as ShipNo,pl.[Line No_],pl.No_, 
case [Unit of Measure Code]
	when 'ST' then 'PCS'
	else [Unit of Measure Code]
end as Unit_Of_Measure_Code
,pl.[Location Code], cast(pl.Quantity as INT) as Quantity, 
cast(pl.[Quantity Received] as INT) as Quantity_Received, 
cast(pl.[Quantity Invoiced] as INT) as Quantity_Invoiced, 
cast(pl.[Qty_ to Invoice] as INT) as Qty_to_Invoice,
cast((pl.Quantity-pl.[Quantity Invoiced]) as INT) as Quantity_to_be_migrated,
cast(([Quantity Received]-[Quantity Invoiced]) as INT) as Qty_to_be_delivered
from urban_NAV600.dbo.[Urban-Brand GmbH$Purchase Line] as pl with (NOLOCK)
Left join urban_NAV600.dbo.[Urban-Brand GmbH$Purchase Header] as ph with (NOLOCK)
on pl.[Document No_] = ph.No_
Left Join prh_max
on prh_max.[Order No_] = ph.No_
Where pl.[Posting Group] = 'HANDEL' and ([Quantity Received]-[Quantity Invoiced]) <> '0' 
--and pl.No_ = '8430332276088'
and ph.No_ NOT like 'STO%'
--and ph.[Buy-from Vendor No_] = '71001'