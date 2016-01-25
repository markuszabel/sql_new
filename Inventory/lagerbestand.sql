SELECT [Item No_], sum(Quantity), [Location Code], max([Entry No_])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] with (NOLOCK)
 Where [Location Code] in ('BER_FIEGE', 'WINDELBAR','USTER')
 Group by [Item No_], [Location Code] 