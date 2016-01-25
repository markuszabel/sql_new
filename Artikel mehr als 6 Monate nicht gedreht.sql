
Select cast(sum(itl.Quantity) as int),sum(itl.Quantity*it.[Unit Cost]), itl.[Item No_], 
		it.Description, it.[Description 2], it.[Attribute 2]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as itl
  left join  [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  on itl.[Item No_] = it.No_

  Where itl.[Item No_] in 
  
  (Select itl2.[Item No_] FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as itl2
   group by itl2.[Item No_] Having Max(itl2.[Posting Date] )< '2014-04-01')
   
    AND itl.[Location Code] = 'BER_FIEGE'

 Group by itl.[Item No_], it.Description, it.[Description 2], it.[Attribute 2]
  Having sum(itl.Quantity) >0