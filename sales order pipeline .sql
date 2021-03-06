SELECT [Reason Code]
		,[Document Type]
      ,[Status]
      --, Shared
      , count([No_] ) as Anzahl
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
  WHERE [Document Type] in ('1', '11')
	AND [No_] not like '9%'
	--and [Reason Code] in ('WINDELN_CH','WINDELN_DE','MKB','EBAY')
  GROUP BY [Reason Code],[Status] , [Document Type]--, Shared
  ORDER BY       [Document Type]
      ,[Status],[Reason Code]
   -- , Shared 
		asc                                                                                                                                       