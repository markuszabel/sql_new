DECLARE @deb varchar(8) = 'Customer'; 
DECLARE @journalNum varchar(15) = 'OTC_MZ_2'; 
DECLARE @voucher varchar(4) = 'OTC-'; 
DECLARE @lineNum varchar(7) = 'Cus'; 
DECLARE @journalName varchar(15) = 'General'; 
DECLARE @AmountCurCredit decimal(5,2) = '0'; 
DECLARE @OffsetAccountType varchar(15) = 'Ledger';
DECLARE @OffsetLedgerDimension varchar(10) = '980000';
DECLARE @sep varchar(1) = '-';
DECLARE @pay varchar(3) = '30N';
DECLARE @discCode varchar(1) = '';

with dcu as
(
Select 
[Cust_ Ledger Entry No_] as EntryNo, sum(Amount) as Wert, [Initial Entry Global Dim_ 1] as KostStell, [Initial Entry Global Dim_ 2] as KostTraeg,
case [Currency Code]
when '' then 'EUR'
else [Currency Code]
end as CurrencyCode
from urban_NAV600.dbo.[Urban-Brand GmbH$Detailed Cust_ Ledg_ Entry] with (NOLOCK)
Group by [Cust_ Ledger Entry No_],[Initial Entry Global Dim_ 1], [Initial Entry Global Dim_ 2],[Currency Code]
)


Select 
@journalNum "JournalNum",
cast((@voucher + cast(ROW_NUMBER() OVER (ORDER BY cle.[Entry No_]) as varchar)) as varchar) "Voucher",

ROW_NUMBER() OVER (ORDER BY cle.[Entry No_])  "LineNum"

,@journalName "JournalName", dcu.CurrencyCode "CurrencyCode",@deb "AccountType",
left(cle.[Customer No_],1)+'0'+RIGHT(cle.[Customer No_],7) "LedgerDimension", 
cle.[Global Dimension 2 Code] + @sep + left(cle.[Global Dimension 1 Code],3)+ @sep  "DefaultDimension",
cast(dcu.Wert as decimal(18,2)) "AmountCurDebit",@AmountCurCredit "AmountCurCredit", @OffsetAccountType "OffsetAccountType"
,@OffsetLedgerDimension+@sep+cle.[Global Dimension 2 Code] "OffsetLedgerDimension",
cast(cle.[Posting Date] as Date) "TransDate",
cast(cle.[Document Type] as varchar) + @sep + cast(cle.[Document No_] as varchar)+@sep+ cast(cle.[Entry No_] as varchar)+@sep+cle.[External Document No_]+@sep+cle.[Payment Reference] "Txt", 
--cast(cle.[Remaining Pmt_ Disc_ Possible] as float) "CashDiscAmount",cast(cle.[Pmt_ Discount Date] as Date) "DateCashDisc",
cle.[Document No_] "DocumentNum",cast(cle.[Due Date] as Date) "Due",cle.[Document No_]  "Invoice",
@pay "Payment",cle.[Payment Method Code] "PaymMode",-- @discCode as Disccode,


/*cle.[Customer Posting Group] as CustPostGroup,
cle.[Global Dimension 1 Code] as KostStell, cle.[Global Dimension 2 Code] as KostTraeg, 
cle.[Last Issued Reminder Level] as Mahnstufe, */
cast(cle.[Document Date] as Date) "DocumentDate"
from urban_NAV600.dbo.[Urban-Brand GmbH$Cust_ Ledger Entry] as cle with (NOLOCK)
Left Join dcu
on dcu.EntryNo = cle.[Entry No_]
where cle.[Open] = '1' and cle.[Customer No_] = 'D1000276' --and 'D1010276'
FOR XML PATH ('LedgerJournalEntity'), root('Document');