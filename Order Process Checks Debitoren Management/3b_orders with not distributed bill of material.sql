/****** Aufträge mit XX-Artikeln ******/
SELECT count ( distinct sh.No_)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  on sl.[Document No_] = sh.No_
  Where sl.No_ like '%X%'
  
  SELECT  distinct sh.No_, sh.[Order Date], sh.[External Document No_]
   FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  on sl.[Document No_] = sh.No_
  Where sl.No_ like '%X%'