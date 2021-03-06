SELECT item.[EAN]

, (CAST (LEFT ( vendor.[Lead Time Calculation], LEN( vendor.[Lead Time Calculation]) +
	CASE WHEN LEN( vendor.[Lead Time Calculation]) > 0 THEN -1 ELSE 0 END) as integer)) as Beschaffungszeit

, CASE WHEN item.[Anzahl Tage Lager > 0 - letzte 28 Tage] > 0
	THEN 
		CAST(round(item.[Sales - letzte 28 Tage] / item.[Anzahl Tage Lager > 0 - letzte 28 Tage] * (-7),3) as decimal (10,2)) 
	ELSE 0
	END as weekly_Bedarf
	
, item.[Anzahl Tage Lager > 0 - letzte 28 Tage]
, vendor.No_
, item.[Klasse]
, ISNULL(qut.Lagerbest_vend, 0) as Lager_vend
, ISNULL(best_qut.Best_fiege, 0) as Best_Fiege
,'Mindest_Menge_Lager' = 
CASE WHEN
	item.[Anzahl Tage Lager > 0 - letzte 28 Tage] > 1
	THEN
		CASE WHEN
		(ROUND (
			((CAST (LEFT ( vendor.[Lead Time Calculation], LEN( vendor.[Lead Time Calculation]) +
				CASE WHEN LEN( vendor.[Lead Time Calculation]) > 0 THEN -1 ELSE 0 END) as integer) / 7) 
			+ 
			CASE WHEN vendor.No_ in ( '71001','71002') AND item.[Klasse] = 'A' THEN 3
				ELSE 4 END
			) * 
			(item.[Sales - letzte 28 Tage] / (item.[Anzahl Tage Lager > 0 - letzte 28 Tage] - 1) * (-7))
			,0)
			)
		> 1
		THEN 
		(ROUND (
			((CAST (LEFT ( vendor.[Lead Time Calculation], LEN( vendor.[Lead Time Calculation]) +
				CASE WHEN LEN( vendor.[Lead Time Calculation]) > 0 THEN -1 ELSE 0 END) as integer) / 7) 
			+ 
			CASE WHEN vendor.No_ in ( '71001','71002') AND item.[Klasse] = 'A' THEN 3
				ELSE 4 END
			) * 
			(item.[Sales - letzte 28 Tage] / (item.[Anzahl Tage Lager > 0 - letzte 28 Tage] - 1) * (-7))
			,0)
			)
		ELSE '1'
		END
ELSE item.[Reorder Point]
END
-
ISNULL(qut.Lagerbest_vend, 0)
-
ISNULL(best_qut.Best_fiege, 0)
	

		
	

,'Maximal_Menge_Lager' = 
CASE WHEN
	item.[Anzahl Tage Lager > 0 - letzte 28 Tage] > 1
	THEN
		CASE WHEN
		(ROUND (
			((CAST (LEFT ( vendor.[Lead Time Calculation], LEN( vendor.[Lead Time Calculation]) +
				CASE WHEN LEN( vendor.[Lead Time Calculation]) > 0 THEN -1 ELSE 0 END) as integer) / 7) 
			+ 
			CASE WHEN vendor.No_ in ( '71001','71002') AND item.[Klasse] = 'A' THEN 3
				ELSE 4 END
			) * 
			(item.[Sales - letzte 28 Tage] / (item.[Anzahl Tage Lager > 0 - letzte 28 Tage] - 1) * (-7))
			,0)
			)
		> 1
		THEN 
		(ROUND (
			((CAST (LEFT ( vendor.[Lead Time Calculation], LEN( vendor.[Lead Time Calculation]) +
				CASE WHEN LEN( vendor.[Lead Time Calculation]) > 0 THEN -1 ELSE 0 END) as integer) / 7) 
			+ 
			CASE WHEN vendor.No_ in ( '71001','71002') AND item.[Klasse] = 'A' THEN 3
				ELSE 4 END
			) * 
			(item.[Sales - letzte 28 Tage] / (item.[Anzahl Tage Lager > 0 - letzte 28 Tage] - 1) * (-7))
			,0)
			)
		ELSE '1'
		END
ELSE item.[Reorder Point]
END

FROM [dbo].Item as item
	LEFT JOIN [TERM18].[urban_NAV600].[dbo].[Urban-Brand GmbH$Vendor] as vendor
		ON vendor.No_ = item.[Vendor No_]
		
	LEFT JOIN (
		SELECT sum (ile.[Quantity]) as Lagerbest_vend,
			art.No_ as Artikel
		FROM [TERM18].[urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] as ile
			inner join [TERM18].[urban_NAV600].[dbo].[Urban-Brand GmbH$Item] as art
			on art.No_ = ile.[Item No_]
		WHERE 
			ile.[Location Code] = 'GROUP7'
		group by art.No_
		) as qut ON qut.[Artikel] = item.[EAN]
		
	LEFT JOIN (
		SELECT sum (best.[Outstanding Quantity]) as Best_fiege,
			best.No_ as Artikel2
		FROM [TERM18].[urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line] as best
		group by best.No_
		) as best_qut ON best_qut.[Artikel2] = item.[EAN]	
		
 
WHERE  (item.[Klasse] = 'A' OR item.[Klasse] = 'B' OR item.[Klasse] = 'C')                                                                                                                                                                                                                                                                                                                                                                                                                   