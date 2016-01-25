
Select
il.[Item No_] as EAN , it.Description, it.[Description 2],cast([Remaining Quantity] as INT) as Menge, cast([Expiration Date] as DATE) as MHD, DATEDIFF(day,[Expiration Date] , GETDATE()) as Restlaufzeit
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Join [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
on il.[Item No_] = it.No_
Where [Remaining Quantity] > 0  and it.[Item Tracking Code] = 'MHD' and cast([Expiration Date] as DATe) <> '1753-01-01' 
and DATEDIFF(day,[Expiration Date] , GETDATE())  between -180 and -57 