SELECT [Document No_] , [Buy-from Vendor No_]
,sum([Quantity]*[Direct Unit Cost]) as Quantity
      ,sum([Outstanding Quantity]*[Direct Unit Cost]) as Outs_Qty
      ,sum([Qty_ to Invoice]*[Direct Unit Cost]) as to_inv
      ,sum([Qty_ to Receive]*[Direct Unit Cost]) as to_rec
      ,sum([Qty_ Rcd_ Not Invoiced]*[Direct Unit Cost]) as Rec_to_inv
      ,sum([Quantity Received]*[Direct Unit Cost]) as rec
      ,sum([Quantity Invoiced]*[Direct Unit Cost]) as inv
   FROM [Urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Purchase Line]
   GROUP BY [Document No_],[Buy-from Vendor No_]