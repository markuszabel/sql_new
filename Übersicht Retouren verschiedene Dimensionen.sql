SELECT  count([No_] ) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  WHERE [Document Type] in ('5')
  
  
  SELECT  [Reason Code]
      , count([No_] ) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  WHERE [Document Type] in ('5')
  GROUP BY [Reason Code]
  ORDER BY [Reason Code] asc
  

SELECT cast ([Posting Date] as date), [Location Code]
      , count([No_] ) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header]
  WHERE [Document Type] in ('5')
  GROUP BY  cast ([Posting Date] as date), [Location Code]
  ORDER BY cast ([Posting Date] as date) asc