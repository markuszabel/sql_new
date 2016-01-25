select
sum(ve.[Cost Amount (Expected)]) as CostAmountExpected, 
ve.[Source No_],
ven.Name
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Vendor] as ven
on ve.[Source No_] = ven.No_ 
where  ve.[Location Code] = 'WDB_MACHTL' and ve.[Posting Date] <= '2015-12-31'
--and
--ve.[Document Type] in (6,5)
Group by
ve.[Source No_], ven.Name
having sum(ve.[Cost Amount (Expected)]) <>0
order by sum(ve.[Cost Amount (Expected)]) asc
