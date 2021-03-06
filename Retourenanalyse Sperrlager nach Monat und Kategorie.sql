/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
 --sum(Amount), 
 MONTH(cl.[Posting Date]), SUM( cl.[Unit Cost]), cl.[Return Reason Code], left(it.[Attribute 2],1)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Line] as cl
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  on cl.No_ = it.No_
  where cl.[Posting Date] between '2013-10-01' and '2013-10-31' and cl.[Return Reason Code] in ('R4'/*, 'P9', 'R9','L', 'S1', 'S2'*/)
	and cl.[Location Code] = 'S_FIEGE_GB' 
  Group by  cl.[Return Reason Code], MONTH(cl.[Posting Date]), left(it.[Attribute 2],1)
  Order by SUM( cl.[Unit Cost]) asc