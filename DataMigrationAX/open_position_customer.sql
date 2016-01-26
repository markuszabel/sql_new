with dcu as
(
Select 
[Cust_ Ledger Entry No_] as EntryNo, sum(Amount) as Wert, [Initial Entry Global Dim_ 1] as KostStell, [Initial Entry Global Dim_ 2] as KostTraeg,
case [Currency Code]
when '' then 'EUR'
else [Currency Code]
end as CurrencyCode
from urban_NAV600.dbo.[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] with (NOLOCK)
Group by [Cust_ Ledger Entry No_],[Initial Entry Global Dim_ 1], [Initial Entry Global Dim_ 2],[Currency Code]
)


Select 
cle.[Customer No_], cast(cle.[Posting Date] as Date) as BuchungsDat, 
cast(cle.[Document Date] as Date) as BelegDat,cle.[Document Type] as DocType, cle.[Document No_], cle.[Customer Posting Group] as CustPostGroup,
cle.[Global Dimension 1 Code] as KostStell, cle.[Global Dimension 2 Code] as KostTraeg, cast(cle.[Due Date] as Date) as DueDate, cle.[Entry No_], cle.[External Document No_],
cle.[Last Issued Reminder Level] as Mahnstufe, cle.[Payment Method Code], cle.[Payment Reference]
--,dcle.*
,dcu.EntryNo, dcu.Wert, dcu.CurrencyCode
from urban_NAV600.dbo.[Urban-Brand GmbH$Cust_ Ledger Entry] as cle with (NOLOCK)
Left Join dcu
on dcu.EntryNo = cle.[Entry No_]
where cle.[Open] = '1' and cle.[Customer No_] = 'D1660477'