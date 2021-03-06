/****** Script for SelectTopNRows command from SSMS  ******/
SELECT il.[Item No_]
		,il.[Location Code]
		,it.Description
		,it.[Description 2]
      ,cast(sum(il.[Quantity]) as INT)
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it with (NOLOCK)
  on it.No_ = il.[Item No_]
  WHERE il.[Location Code] 
  --NOT IN ('TRANS_04','WDB_FIEGE','MIL_FIEGE','WDB_AB','RET_USTER2','RET_USTER','WDB_EXT','MESSE','TRANS_01','WINDELBAR','WDB_LADEN','WDB_MACHTL','BER_FIEGE','USTER','WB_RETOURE','WB_O4MINIS','USTER_SHOW','MUSTER','LADEN_GRUE','WB_OUTLET','WB_UMLAGER','WB_REKLAM') 
  in ('FIEGE_RMA','GROUP7_RMA','KAMINO_RMA','S_FIEGE_GB','USTER_RMA','WB_RMA','WDB_AB_RMA')
  --= 'TRANS_01'
  and [Posting Date] <= '2016-03-31'
  group by il.[Item No_],il.[Location Code],it.Description,it.[Description 2]
  Having sum(il.[Quantity]) <> 0
  order by il.[Location Code] asc,sum(il.[Quantity]) desc
