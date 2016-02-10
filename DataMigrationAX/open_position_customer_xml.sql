DECLARE @deb varchar(7) = 'Debitor'; 
DECLARE @journalNum varchar(15) = 'LFD0000063'; 
DECLARE @voucher varchar(15) = 'GJ0002965'; 
DECLARE @lineNum varchar(7) = 'Debitor'; 
DECLARE @journalName varchar(15) = 'Allgemein'; 
DECLARE @AmountCurCredit INT = '0'; 
DECLARE @OffsetAccountType varchar(15) = 'Sachkonto';
DECLARE @OffsetLedgerDimension varchar(10) = '90080';
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


Select  @journalNum as 'JournalName',@voucher as 'Voucher',@lineNum as 'LineNum',@journalName as 'JournalName', dcu.CurrencyCode,@deb as 'AccountType',
cle.[Customer No_], cast(dcu.Wert as float) as 'AmountCurDebit',@AmountCurCredit as 'AmountCurCredit', @OffsetAccountType as 'OffsetAccountType',@OffsetLedgerDimension as 'OffsetLedgerDimension',
cast(cle.[Posting Date] as Date) as 'TransDate',
cast(cle.[Document Type] as varchar) + @sep + cast(cle.[Document No_] as varchar)+@sep+ cast(cle.[Entry No_] as varchar)+@sep+cle.[External Document No_]+@sep+cle.[Payment Reference] as Txt, 
cast(cle.[Remaining Pmt_ Disc_ Possible] as float) as DiscAmount,cast(cle.[Pmt_ Discount Date] as Date) as DiscDate,cle.[Document No_] as DocumentNum,cast(cle.[Due Date] as Date) as DueDate,cle.[Document No_] as InvoiceNo,
@pay as Payment,cle.[Payment Method Code], @discCode as Disccode,


/*cle.[Customer Posting Group] as CustPostGroup,
cle.[Global Dimension 1 Code] as KostStell, cle.[Global Dimension 2 Code] as KostTraeg, 
cle.[Last Issued Reminder Level] as Mahnstufe, */
cast(cle.[Document Date] as Date) as BelegDat
from urban_NAV600.dbo.[Urban-Brand GmbH$Cust_ Ledger Entry] as cle with (NOLOCK)
Left Join dcu
on dcu.EntryNo = cle.[Entry No_]
where cle.[Open] = '1' and cle.[Customer No_] = 'D2089239'