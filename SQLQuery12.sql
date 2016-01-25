SELECT [Document No_]
      ,[Buy-from Vendor No_]
      ,[No_]
      ,[Location Code]
      ,[Expected Receipt Date]
      ,[Description]
      ,[Description 2]
      ,[Unit of Measure]
      ,[Quantity]
      ,[Outstanding Quantity]
       ,[Direct Unit Cost]
 
  FROM [Urban_NAV600].[dbo].[Urban-Brand GmbH$Purchase Line]
  Where [Location Code] in ('WINDELBAR', 'WUNDERLAND')