/****** Max Entry No Lagerbestand ******/
Select max([Entry No_])
FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] with (NOLOCK)

/****** Max Entry No Transfertabelle******/
Select max(cdh.[Entry No_])
From [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentResponse] as cdr with (NOLOCK)
on cdh.[Entry No_] = cdr.[Entry No_]
Where cdh.Completed = 1 and cdr.[Entry No_] IS NOT NULL

/****** Lagerbestand pro EAN pro Lagerort ******/
SELECT [Item No_], sum(Quantity), [Location Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item Ledger Entry] with (NOLOCK)
 Where [Location Code] in ('BER_FIEGE', 'WINDELBAR','USTER')
 Group by [Item No_], [Location Code] 
 
/****** Nicht verarbeitete Artikel in der Transfertabelle ******/
   SELECT *
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentLine] as cdl with (NOLOCK)
  Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentHeader] as cdh with (NOLOCK)
  on cdh.[Entry No_] = cdl.[Header Entry No_]
  Left Outer Join [urban_NAV600].[dbo].[Urban-Brand GmbH$CreateDocumentResponse] as cdr with (NOLOCK)
  on cdr.[Entry No_] = cdh.[Entry No_]
  Where cdr.[Entry No_] IS NULL and cdh.Completed = 1
  
/****** Nicht verarbeitete Artikel in eBayNavCSalesHeader ******/
SELECT esl.No_, sum(esl.Quantity), esh.[Shop Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesLine] as esl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$eBayNavCSalesHeader] as esh with (NOLOCK)
  on esl.[Document No_] = esh.No_
  Where esh.Status = 0
  Group by esl.No_,esh.[Shop Code]
  
/****** Offene Artikel in Aufträgen ******/
SELECT sl.No_,sum (sl.Quantity - sl.[Quantity Shipped]), sl.[Location Code]
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Line] as sl with (NOLOCK)
  Left Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] as sh with (NOLOCK)
  on sl.[Document No_] = sh.No_
  Where sl.[Posting Group] = 'HANDEL' and sh.[Document Type] in ('1','11')
  group by sl.No_,sl.[Location Code]
  
/****** Vorgänger - Nachfolger ******/
SELECT No_, Vorgängerartikel
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Item] with (NOLOCK)
  WHERE Vorgängerartikel <> ''