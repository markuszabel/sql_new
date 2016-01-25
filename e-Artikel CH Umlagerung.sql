with stock_uster as 
(SELECT [Item No_], sum(Quantity) as Stock_Uster   
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]   
WHERE [Location Code] = 'USTER'   GROUP BY [Item No_]),

stock_ber as  
(SELECT [Item No_], sum(Quantity) as Stock_Ber   
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry]   
WHERE [Location Code] = 'BER_FIEGE'   GROUP BY [Item No_]), 

in_sales as  
(SELECT No_, sum(Quantity) as In_Sales   
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line]   
WHERE [Location Code] = 'USTER'   GROUP BY [No_]), 

stockkeeping_USTER as 
( SELECT [Item No_], [Replenishment System],Klasse   
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]   
WHERE [Location Code] = 'USTER' ), 

stockkeeping_BER as 
( SELECT [Item No_], [Replenishment System],Klasse   
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Stockkeeping Unit]   
WHERE [Location Code] = 'BER_FIEGE' )   


Select in_sales.No_, in_sales.In_Sales, ISNULL(stock_uster.Stock_Uster,0) as Stock_Uster, ISNULL(stock_ber.Stock_Ber,0) as Stock_Ber, 
stockkeeping_USTER.[Replenishment System] ,stockkeeping_BER.Klasse 

FROM in_sales 

LEFT JOIN stock_uster on in_sales.No_ = stock_uster.[Item No_] 
LEFT JOIN stock_ber on in_sales.No_ = stock_ber.[Item No_] 
LEFT JOIN stockkeeping_USTER on in_sales.No_ = stockkeeping_USTER.[Item No_] 
LEFT JOIN stockkeeping_BER on in_sales.No_ = stockkeeping_BER.[Item No_] 
WHERE stockkeeping_USTER.[Replenishment System] = 2 AND stockkeeping_BER.Klasse in ('E','O') 
	AND (stock_uster.Stock_Uster - in_sales.In_Sales) < 0 AND (stock_ber.Stock_Ber - in_sales.In_Sales) < 0 





