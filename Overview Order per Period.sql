  /*Aufträge übertragen und offen in der aktuellen Periode*/
 SELECT count(No_) as OpenOrdersCurrentPeriod
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
  Where [DHL Reporting Date] 
  /*Gestern Cutoff Zeit*/
  between cast((Getdate()-1) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-1) as time) 
  /*Heute Cutoff Zeit*/
  AND cast(Getdate() as datetime) + cast('15:00:00' as Time) -  cast(Getdate() as time) 
  AND [Document Type] = 11 
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH')
    
 /*Aufträge übertragen und erledigt in der aktuellen Periode*/   
 SELECT count(No_) as SentOrdersCurrentPeriod
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] with (NOLOCK)
  Where [DHL Reporting Date] 
  /*Gestern Cutoff Zeit*/
  between cast((Getdate()-1) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-1) as time) 
  /*Heute Cutoff Zeit*/
  AND cast(Getdate() as datetime) + cast('15:00:00' as Time) -  cast(Getdate() as time)
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH')
  
  /*Aufträge übertragen und offen in der letzten abgeschlossenen Periode*/ 
 SELECT count(No_) as OpenOrdersLastPeriod
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
  Where [DHL Reporting Date] 
    /*Vorgestern Cutoff Zeit*/
  between cast((Getdate()-2) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-2) as time) 
  /*Gestern Cutoff Zeit*/
  AND cast((Getdate()-1) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-1) as time)
  AND [Document Type] = 11 
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH')
  
   /*Aufträge übertragen und erledigt in der letzten abgeschlossenen Periode*/
   SELECT count(No_) as SentOrdersLastPeriod
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Shipment Header] with (NOLOCK)
  Where [DHL Reporting Date] 
    /*Vorgestern Cutoff Zeit*/
  between cast((Getdate()-2) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-2) as time) 
  /*Gestern Cutoff Zeit*/
  AND cast((Getdate()-1) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-1) as time) 
  AND [Reason Code] in ('WINDELN_DE','WINDELN_CH')
  
   /*Aufträge älter als 2 Tage und offen */
   SELECT count(No_) as OpenOrdersOlder2Days
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Header] with (NOLOCK)
  Where [DHL Reporting Date] < cast((Getdate()-2) as datetime) + cast('15:00:00' as Time) -  cast((Getdate()-2) as time) AND [Reason Code] in ('WINDELN_DE','WINDELN_CH') 
  AND [Document Type] = 11