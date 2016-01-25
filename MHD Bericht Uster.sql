/*Anzahl Artikel pro MHD Cluster*/
with datediffclusterlist as
(
Select
il.[Item No_],
case 
		when cast([Expiration Date] as DATe) = '1753-01-01' then 'nachziehen'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) > -28 then 'ausbuchen'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) between -56 and -29 then 'Aktion'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) between -180 and -57 then 'Beobachten'
		else 'OK' end as DatediffCluster
	
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Join [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
on il.[Item No_] = it.No_
Where [Remaining Quantity] > 0  and it.[Item Tracking Code] = 'MHD' ),

mhdClusterData as
(Select
il.[Item No_] as EAN , [Remaining Quantity] as RemQ, [Expiration Date],
case 
		when cast([Expiration Date] as DATe) = '1753-01-01' then 'nachziehen'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) > -28 then 'ausbuchen'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) between -56 and -29 then 'Aktion'
		when DATEDIFF(day,[Expiration Date] , GETDATE()) between -180 and -57 then 'Beobachten'
		else 'OK' end as DatediffCluster
	
FROM [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item Ledger Entry] as il
Join [Urban_NAV600].[dbo].[Windeln CH Logistikmandant$Item] as it
on il.[Item No_] = it.No_
Where [Remaining Quantity] > 0  and it.[Item Tracking Code] = 'MHD')


/*Menge pro Artikel pro MHD Cluster*/
Select EAN, 
cast(isnull([nachziehen],0) as INT) as [nachziehen], 
cast(isnull([ausbuchen],0) as INT) as [ausbuchen], 
cast(isnull([Aktion],0) as INT) as [Aktion],
cast(isnull([OK],0) as INT) as [OK]
from 
(select EAN, DatediffCluster, RemQ
	from mhdClusterData) as res
PIVOT 
(sum(RemQ) for DatediffCluster in ([nachziehen],[ausbuchen],[Aktion],[Beobachten],[OK]))
as pvt
order by EAN

