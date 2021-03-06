/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct il.[Item No_],il.[Location Code]
      ,sum(il.[Quantity])--, it.[Unit Cost]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
	join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.No_
--Where il.[Return Reason Code] = 'L'
Where il.[Location Code] = 'LADEN_GRUE' and il.[Item No_] in ('4009706265436')
Group By il.[Item No_],il.[Location Code]

SELECT il.[Location Code]
      ,Sum (il.[Quantity])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
	join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
on il.[Item No_] = it.No_
--Where il.[Return Reason Code] = 'L'
Where il.[Posting Date] <= '2014-12-31'
Group By il.[Location Code]
Having Sum (il.[Quantity]) <> 0
order by il.[Location Code]




