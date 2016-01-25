--SkriptFürEKRundEKLBuchungen
 
select
t.Quartal_EKR,
t.[Source No_],
b.Quartal_EKL,
b.[Source No_],
cast(sum(b.CostAmountExpected) as decimal (20,2)) as CostAmountExprectedEnstehungDurchBuchungEKL,
cast(sum(t.CostAmountExpected) as decimal (20,2)) as CostAmountExpectedAuflösungDurchBuchungEKR,
case when b.Quartal_EKL < > t.Quartal_EKR then 'BuchungWeReKonto' else 'KeineBuchungWereKonto' end as WeReStatus
 
from
(
select

case Month(ve.[Posting Date])
	when 1 then 'Q1'
	when 2 then 'Q1'
	when 3 then 'Q1'
	when 4 then 'Q2'
	when 5 then 'Q2'
	when 6 then 'Q2'
	when 7 then 'Q3'
	when 8 then 'Q3'
	when 9 then 'Q3'
	when 10 then 'Q4'
	when 11 then 'Q4'
	when 12 then 'Q4'
	else ''
end as Quartal_EKR,
ve.[Source No_],
ve.[Item Ledger Entry No_],
sum(ve.[Cost Amount (Expected)]) as CostAmountExpected
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve
where ve.[Source No_] = '70748' and ve.[Location Code] = 'BER_FIEGE' and year(ve.[Posting Date]) = '2014'
and
ve.[Document Type] = 8
Group by ve.[Posting Date], ve.[Source No_],ve.[Item Ledger Entry No_]
) as t
 
left outer join
(
select
case Month(ve.[Posting Date])
	when 1 then 'Q1'
	when 2 then 'Q1'
	when 3 then 'Q1'
	when 4 then 'Q2'
	when 5 then 'Q2'
	when 6 then 'Q2'
	when 7 then 'Q3'
	when 8 then 'Q3'
	when 9 then 'Q3'
	when 10 then 'Q4'
	when 11 then 'Q4'
	when 12 then 'Q4'
	else ''
end as Quartal_EKL,
ve.[Source No_],
ve.[Item Ledger Entry No_],
sum(ve.[Cost Amount (Expected)]) as CostAmountExpected
from urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve
where ve.[Document Type] = 7
Group by ve.[Posting Date],ve.[Source No_],ve.[Item Ledger Entry No_]
) as b
      on t.[Item Ledger Entry No_] = b.[Item Ledger Entry No_]
     
Group By
t.Quartal_EKR,
t.[Source No_],
b.Quartal_EKL,
b.[Source No_]