/****** Aufträge in Warten nach Datum******/
SELECT
	sh.[Shop Code],COUNT (sh.No_) AS NumberofOrders,CAST (sh.[Order Date] AS DATE) AS OrderDate
FROM
	[urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] AS sh with (NOLOCK)
WHERE
	sh.Status = '0'
GROUP BY
	sh.[Shop Code],CAST (sh.[Order Date] AS DATE)
ORDER BY
	sh.[Shop Code],CAST (sh.[Order Date] AS DATE) DESC 
	
	
	
	SELECT
		FraudInfo , [Shop Payment Method Code]
		,
		COUNT (sh.No_) AS NumberofOrders
	FROM
		[urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] AS sh
	WHERE
		sh.Status = '0'
	GROUP BY
		FraudInfo , [Shop Payment Method Code]
	ORDER BY
		COUNT (sh.No_) DESC

			SELECT
		FraudInfo , [Shop Payment Method Code]
		,sh.No_, Wait
	FROM
		[urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] AS sh
	WHERE
		sh.Status = '0'
	