Select  distinct dd.[Dimension Value Code] as UsedCodesInOrdersOrPurchases
From urban_NAV600.dbo.[Urban-Brand GmbH$Document Dimension] as dd with (NOLOCK)
Where dd.[Dimension Code] = 'KATEGORIE' and dd.[Dimension Value Code] like '%.%'
order by dd.[Dimension Value Code]

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Document Dimension] set [Dimension Value Code] = '504' Where [Dimension Value Code] = '504.0' and [Dimension Code] = 'KATEGORIE'  

Select  distinct dd.[Dimension Value Code] as UsedCodesForItems
From urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension]  as dd with (NOLOCK)
Where dd.[Dimension Code] = 'KATEGORIE' and dd.[Dimension Value Code] like '%.%'
order by dd.[Dimension Value Code]

--Update urban_NAV600.dbo.[Urban-Brand GmbH$Default Dimension] set [Dimension Value Code] = '501' Where [Dimension Value Code] = '501.0' and [Dimension Code] = 'KATEGORIE'  
