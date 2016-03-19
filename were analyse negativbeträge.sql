--SkriptFürEKRundEKLBuchungen 
select
t.BuchungsdatumEKR,
t.EKR,
b.BuchungsdatumEKL,
b.EKL,
cast(sum(b.CostAmountExpected) as decimal (20,2)) as CostAmountExprectedEnstehungDurchBuchungEKL,
cast(sum(t.CostAmountExpected) as decimal (20,2)) as CostAmountExpectedAuflösungDurchBuchungEKR
 
from
(/*** EKRs ****/
select max(cast(ve.[Posting Date] as date)) as BuchungsdatumEKR,ve.[Item Ledger Entry No_],ve.[Document No_] as EKR,sum(ve.[Cost Amount (Expected)]) as CostAmountExpected
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve
where ve.[Source No_] = '71038' and ve.[Location Code]='BER_FIEGE' and ve.[Posting Date] <= '2016-02-29' and ve.[Document Type] = 6
Group by ve.[Item Ledger Entry No_],ve.[Document No_]
) as t
 
inner join
(/***** EKLs ******/
select
cast(ve.[Posting Date] as date) as BuchungsdatumEKL,ve.[Item Ledger Entry No_],ve.[Document No_] as EKL, sum(ve.[Cost Amount (Expected)]) as CostAmountExpected
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve
where ve.[Document Type] = 5 and ve.[Source No_] = '71038' and ve.[Location Code]='BER_FIEGE' and ve.[Posting Date] > '2016-02-29'
Group by
ve.[Posting Date],
ve.[Item Ledger Entry No_],
ve.[Document No_]
) as b
      on t.[Item Ledger Entry No_] = b.[Item Ledger Entry No_]
     
	Where t.EKR IS NOT NULL AND b.EKL IS NOT NULL

Group By
t.BuchungsdatumEKR,
t.EKR,
b.BuchungsdatumEKL,
b.EKL

