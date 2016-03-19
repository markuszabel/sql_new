Select  distinct dd.[Dimension Value Code] as UsedCodesInOrdersOrPurchases
From urban_NAV600.dbo.[Urban-Brand GmbH$Document Dimension] as dd with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Dimension Value] as dv with (NOLOCK)
on dd.[Dimension Value Code] = dv.[Code]
Where dd.[Dimension Code] = 'MARKE' and dv.Code is NULL
order by dd.[Dimension Value Code]

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Document Dimension] set [Dimension Value Code] = 'DçÖGENERATION' Where [Dimension Value Code] = 'D¥GENERATION' and [Dimension Code] = 'MARKE'  

Select  distinct dd.[Dimension Value Code] as UsedCodesForItems
From urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension]  as dd with (NOLOCK)
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Dimension Value] as dv with (NOLOCK)
on dd.[Dimension Value Code] = dv.[Code]
Where dd.[Dimension Code] = 'MARKE' and dv.Code is NULL
order by dd.[Dimension Value Code]

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] set [Dimension Value Code] = 'BUBBLE KID BERLIN' Where [Dimension Value Code] = 'BUBBLE. KID BERLIN' and [Dimension Code] = 'MARKE'  
