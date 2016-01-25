with ve_wert as (select 	
		ve.[Item No_],ve.[Location Code]
		, sum(ve.[Item Ledger Entry Quantity]) as Bestand
		, sum(ve.[Cost Amount (Expected)]) as Cost_Amount_Expected
		, sum(ve.[Cost Amount (Actual)]) as Cost_Amount_Actual
		, sum(ve.[Cost Amount (Actual)]) + sum(ve.[Cost Amount (Expected)]) as Total_Cost_Amount
		, (sum(ve.[Cost Amount (Actual)]) + sum(ve.[Cost Amount (Expected)])) / sum(ve.[Item Ledger Entry Quantity]) as Cost_per_Unit
from Urban_Nav600.dbo.[Urban-Brand GmbH$Value Entry] ve
where ve.[Posting Date] <= '2014-03-31'
group by ve.[Item No_],ve.[Location Code]
having sum(ve.[Item Ledger Entry Quantity]) <> 0)

Select il.[Item No_],il.[Location Code],cast(sum(Quantity) as int) as Menge, sum(Quantity * ve_wert.Cost_per_Unit) as Wert
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as il with (NOLOCK)
Left join ve_wert on il.[Item No_] = ve_wert.[Item No_] and il.[Location Code] = ve_wert.[Location Code]
Where il.[Location Code] NOT IN ('BER_FIEGE','WINDELBAR','USTER','USTER_SHOW','LADEN_GRUE','WB_O4MINIS','WB_STAGING')
and il.[Posting Date] <= '2014-03-31'
Group by il.[Item No_],il.[Location Code]
Having sum(Quantity) <> 0