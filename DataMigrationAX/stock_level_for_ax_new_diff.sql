DECLARE @line int = '1'; 
DECLARE @j_id varchar(20) = 'STOCK_PR_2';
DECLARE @j_name_id varchar(3) = 'IMP';
/** Hier das Lager aus AX eintragen (Site und Warehouse) **/
DECLARE @site varchar(3) = 'ABE';
DECLARE @warehouse varchar(8) = 'WDB_AB';
/** Datum nur für Testzwecke **/
DECLARE @date date = '2016-01-01';
/** Hier das Lager für Navision eintragen, aus dem die Daten geholt werden **/
DECLARE @location_nav varchar(9) = 'WDB_AB';
DECLARE @offset_ledger varchar(6) = '930000';
DECLARE @sep varchar(1) = '-';


SELECT
		ItemNo "ItemId",
		@j_id "JournalId",
		--Select ROW_NUMBER() OVER (ORDER BY [Item No_]) as Ranking
		ROW_NUMBER() OVER (ORDER BY ItemNo) "LineNum",
		--stock_ust.Ranking "LineNum", --Nummernserie

		@j_name_id "JournalNameId",
		PostingDate "TransDate",
		InvQty "Qty",
		
		EP "CostPrice",
		case LocationCode
			When 'BER_FIEGE' then 'FIEGE_GB'
			When 'DIREKT' then 'FIEGE_GB'
			When 'LADEN_GRUE' then 'SHOP_GR'
			When 'MESSE' then 'FAIR_MUC'
			When 'MUSTER' then 'SAMPLE_MUC'
			When 'USTER' then 'USTER'
			When 'USTER_SHOW' then 'SHOP_CH'
			When 'USTER_WE' then 'USTER_IN'
			When 'WDB_AB' then 'WDB_AB'
			When 'WDB_FIEGE' then 'FIEGE_GB'
			When 'MIL_FIEGE' then 'FIEGE_AR'
			When 'TRANS_01' then 'TRANS_01'
			When 'TRANS_02' then 'TRANS_02'
			When 'TRANS_03' then 'TRANS_03'
			When 'TRANS_04' then 'TRANS_04'
			When 'TRANS_05' then 'TRANS_05'
			When 'TRANS_06' then 'TRANS_06'
			When 'TRANS_07' then 'TRANS_07'
			When 'TRANS_08' then 'TRANS_08'
			When 'TRANS_09' then 'TRANS_09'
			When 'TRANS_10' then 'TRANS_10'
			When 'TRANS_11' then 'TRANS_11'
			When 'TRANS_12' then 'TRANS_12'
			When 'FIEGE_RMA' then 'S_FIEGE_GB'
			else 'XXX'
		end "InventLocationId",
		case LocationCode
			When 'BER_FIEGE' then 'BER'
			When 'WDB_FIEGE' then 'BER'
			When 'DIREKT' then 'BER'
			When 'LADEN_GRUE' then 'GRU'
			When 'MESSE' then 'MUC'
			When 'MUSTER' then 'MUC'
			When 'USTER' then 'UST'
			When 'USTER_SHOW' then 'UST'
			When 'USTER_WE' then 'UST'
			When 'WDB_AB' then 'ABE'
			When 'MIL_FIEGE' then 'MIL'
			When 'TRANS_01' then 'BER'
			When 'TRANS_02' then 'BER'
			When 'TRANS_03' then 'BER'
			When 'TRANS_04' then 'UST'
			When 'TRANS_05' then 'ABE'
			When 'TRANS_06' then 'BER'
			When 'TRANS_07' then 'GRU'
			When 'TRANS_08' then 'BER'
			When 'TRANS_09' then 'ABE'
			When 'TRANS_10' then 'BER'
			When 'TRANS_11' then 'MAC'
			When 'TRANS_12' then 'UST'
			When 'FIEGE_RMA' then 'BER'
			else 'XXX'
		end  "InventSiteId",
		--stock_ust.BusinessUnit + @sep + @sep + stock_ust.CostCenter "DefaultDimensionStr",
		ProfitCenter + @sep + @sep + @sep "DefaultDimensionStr",
		@offset_ledger "OffsetLedgerAccount"
FROM     
	  [BI_Data].[dbo].[Inv_Rem_Diff_AgingStructure] AS ass
WHERE
      ass.LocationCode != 'GROUP7'

FOR XML PATH ('InventJournalEntity'), root('Document');
