/****** Verlgeich gemeldete zu gebuchten Korrekturen FIEGE ******/

SELECT il.[Item No_], il.[Return Reason Code],sum(il.Quantity * it.[Unit Cost])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  on it.No_ = il.[Item No_]
	Where il.[Source No_] in ('70748','70619') and il.[Location Code] = 'BER_FIEGE' and [Posting Date] <= '2014-12-31'
	group by il.[Item No_], il.[Return Reason Code]
	
	
SELECT korr.[Item No_], korr.[Return Reason Code],sum(korr.Quantity * it.[Unit Cost])
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Fulfillment Adjustment] as korr with (NOLOCK)
  Left join [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as it
  on it.No_ = korr.[Item No_]
  Where korr.[Fulfillment Setup Code] = 'BER_FIEGE' and korr.[Date] <= '2014-12-31' and korr.[Return Reason Code] <> 'K01'
  group by korr.[Item No_], korr.[Return Reason Code]