SELECT
	ve.[Location Code],
	ve.[Item No_] AS EAN,
	cast(sum(ve.[Item Ledger Entry Quantity]) as integer) AS Lagerbestand,
	cast(sum(ve.[Cost Posted to G_L]) as decimal (19,2)) AS Lagerwert, 
	cast(sum(ve.[Cost Amount (Expected)]) as decimal (19,2)) AS NochNichtGebuchterLagerwert
FROM
	Urban_NAV600_SL.dbo.[Urban-Brand GmbH$Value Entry] as ve 
WHERE
	cast(ve.[Posting Date] as date) <= '2015-12-31' 
GROUP BY
	ve.[Location Code], 
	ve.[Item No_]
