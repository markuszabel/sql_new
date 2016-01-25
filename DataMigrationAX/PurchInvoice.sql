Select 
distinct pil.[Document No_],pih.[Vendor Invoice No_],cast(pih.[Posting Date] as Date) as ReDatum, pih.[Order No_],
case pih.[Currency Code]
	when '' then 'EUR'
	else pih.[Currency Code]
end as Currency,
pil.[Line No_],pil.Type,pil.No_, cast(pil.Quantity as INT) as Quantity,cast(pil.Amount as Float) as Amount, 
cast(pil.[Unit Cost] as Float) as UnitCost, cast(pil.[Direct Unit Cost] as Float) as DirectUnitCost,
cast(pil.[Line Discount %] as Float) as LineDiscPerc, cast(pil.[Line Discount Amount] as Float) as LineDiscAmount,
ve.[Item Ledger Entry No_], --ve.[Source Code],
ile.[Document No_], cast(ile.[Posting Date] as Date) as ILE_Datum

/** Ausgangsbasis sind die gebuchten Rechnungszeilen seite 01.01.2016 **/
from urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Inv_ Line] as pil with (NOLOCK)
/** Daten aus dem Rechnungskopf (Buchungsdatum, RechNr. des Lieferanten, Währung, Bestellnummer der PO) **/
left Join urban_NAV600.dbo.[Urban-Brand GmbH$Purch_ Inv_ Header] as pih with (NOLOCK)
on pih.No_ = pil.[Document No_]
/** Daten aus der ValueEntry (Zuordnung EKR zu EKL Zeile (1 zu n) Ergebnis ItemLedgerEntryNo) **/
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Value Entry] as ve with (NOLOCK)
on pil.[Document No_] = ve.[Document No_] and pil.No_ = ve.[Item No_]
/** Daten aus dem ItemLedger (EKL-Nummer und Buchungsdatum ItemLedger) **/
Left Join urban_NAV600.dbo.[Urban-Brand GmbH$Item Ledger Entry] as ile with (NOLOCK)
on ve.[Item Ledger Entry No_] = ile.[Entry No_]
/*Left Join urban_NAV600.dbo.[Urban-Brand GmbH$eBayFFPurchaseLine] as epl with (NOLOCK)
on epl.[Document No_] = pih.[Order No_]  and pil.No_ = epl.No_ and epl.[Document Entry No_] = '1'*/

Where 
/** Nur Rechnungen die seit dem 01.01.2016 gebucht wurden **/
pih.[Posting Date] >= '2016-01-01' 
/** Nur Zeilen, die eine Menge größer 0 haben **/ 
and pil.Quantity <> 0
/** Einschränkungen für Test **/
and pil.[Document No_] = 'EKR-1105667'
--and pil.No_ = '4015400566700' 
--and ve.[Source Code] = 'EINKAUF'
Order by pil.[Document No_]