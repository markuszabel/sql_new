Select 
CURRENT_TIMESTAMP as timestamp,
 cust.No_, 
cust.[E-Mail] as e_mail,
(select sum(cl.Amount) from [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as cl WHERE cl.[Customer No_] = cust.No_) as Debitor_Saldo,
(select sum(cl2.Amount) from [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as cl2 WHERE cl2.[Customer No_] = cust.No_ AND cl2.[Document Type] = '2') as Debitor_Lifetime_sales,
(select sum(cl2.Amount) from [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as cl2 WHERE cl2.[Customer No_] = cust.No_ AND cl2.[Document Type] = '3') as Debitor_Lifetime_returns,
(select MIN(cl3.[Posting Date]) from [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] as cl3 WHERE cl3.[Customer No_] = cust.No_ AND cl3.[Document Type] = '2') as Debitor_first_sale,
CASE WHEN [Blocked] <> 0 THEN 'Blacklist' 
	WHEN (SELECT  count (cl4.[Entry No_])
 		FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl4
			 WHERE ((cl4.[Open] <> 0
		      AND cl4.[Payment Method Code] = 'R_LAST')
		   	  OR cl4.[Payment Method Code] like 'F_%')
			  AND  cl4.[Customer No_] = cust.No_) > 0 THEN 'Blacklist' 
	ELSE 'OK' END as blacklist
from [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Customer] as cust
order by cust.No_