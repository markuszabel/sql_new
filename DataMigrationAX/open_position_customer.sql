Select *
/*cle.[Customer No_], cast(cle.[Posting Date] as Date) as BuchungsDat, 
cast(cle.[Document Date] as Date) as BelegDat,cle.[Document Type] as DocType, cle.[Document No_], cle.[Customer Posting Group] as CustPostGroup,
cle.[Global Dimension 1 Code] as KostStell, cle.[Global Dimension 2 Code] as KostTraeg, cast(cle.[Due Date] as Date) as DueDate, cle.[Transaction No_], cle.[External Document No_],
cle.[Last Issued Reminder Level] as Mahnstufe, cle.[Payment Method Code], cle.[Payment Reference]*/

from urban_NAV600.dbo.[Urban-Brand GmbH$Cust_ Ledger Entry] as cle with (NOLOCK)
where cle.[Open] = '1' and cle.[Customer No_] = 'D1660477'