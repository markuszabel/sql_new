Select cast(cl.[Posting Date] as Date) as Datum, 
cl.[Customer No_], 
cl.[External Document No_],
cl.[Last Issued Reminder Level], 
cl.[Document No_], 
sum(dcl.Amount) as Wert, 
cl.[Payment Method Code],
cl.Description,
case cl.[Document Type] 
	when 0 then ''
	when 1 then 'Zahlung'
	when 2 then 'Rechnung'
	when 3 then 'Gutschrift'
	when 4 then 'Zinsrechnung'
	when 5 then 'Mahnung'
	when 6 then 'Erstattung'
	else ''
end,
cl.[Entry No_]

FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as dcl with (NOLOCK)
on cl.[Entry No_] = dcl.[Cust_ Ledger Entry No_]
Where cl.[Open] = 1 and cl.[Posting Date] <= '2015-02-28' and cl.Description like '%ebühren%' and cl.[Document Type] = 0 and cl.[Payment Method Code] <>''--and cl.[Customer No_] = 'D1703923' 
group by cast(cl.[Posting Date] as Date), cl.[Customer No_],cl.[External Document No_], cl.[Last Issued Reminder Level], cl.[Document No_], cl.[Payment Method Code]
,cl.Description,
case cl.[Document Type] 
	when 0 then ''
	when 1 then 'Zahlung'
	when 2 then 'Rechnung'
	when 3 then 'Gutschrift'
	when 4 then 'Zinsrechnung'
	when 5 then 'Mahnung'
	when 6 then 'Erstattung'
	else ''
end,
cl.[Entry No_]
order by cl.[Customer No_]