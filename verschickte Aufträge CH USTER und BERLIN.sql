SELECT Count([External Document No_]),Shared, Left([File No_],2)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayFFSalesHeader]
  WHERE [Reason Code] = 'WINDELN_CH' and Type = 0 and [Entry No_] = 1 and [Order Date] > '2014-02-01'  and Left([File No_],2) in ('A6','A8')
  Group by Shared, Left([File No_],2)
  order by Left([File No_],2)
