/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		cast(cl.[Posting Date] as Date) ,
		cl.No_, 
		cl.[Amount Including VAT], 
		cl.Quantity, cl.[Description], 
		cl.[Document No_]
		
  FROM [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Line] as cl with (NOLOCK)
 -- Join [urban_NAV600].[dbo].[Urban-Brand GmbH$Sales Cr_Memo Line] as ch with (NOLOCK)
 -- on ch.No_ = cl.[Document No_]
  Where cl.[Return Reason Code] like '%L%'