/****** Alipay offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as AlipayReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'ALIPAY' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as AlipayGsOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'ALIPAY' and datediff(day,cl.[Posting Date],GETDATE()) > 10

/****** Paypal offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as PaypalReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'PAYPAL' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as PaypalGsOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'PAYPAL' and datediff(day,cl.[Posting Date],GETDATE()) > 10

/****** H_PAY_CC offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as H_PAY_CC_ReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'H_PAY_CC' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as H_PAY_CC_GsOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'H_PAY_CC' and datediff(day,cl.[Posting Date],GETDATE()) > 10

/****** Pensio offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as Pensio_ReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'PENSIO_CC' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as Pensio_GsOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'PENSIO_CC' and datediff(day,cl.[Posting Date],GETDATE()) > 10

/****** Payolution offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as PAYOLUTION_ReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'PAYOLUTION' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as PAYOLUTION_GsOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'PAYOLUTION' and datediff(day,cl.[Posting Date],GETDATE()) > 10

/****** Lastschrift offene Posten älter 10 Tage ******/
SELECT count (cl.[Entry No_]) as NAV_LAST_Offen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] = 'NAV_LAST' and datediff(day,cl.[Posting Date],GETDATE()) > 10

SELECT count (cl.[Entry No_]) as NAV_BANK_Offen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] = 'NAV_BANK' and datediff(day,cl.[Posting Date],GETDATE()) > 10


/****** Rest offene Posten älter 10 Tage ******/
SELECT cl.[Payment Method Code],count (cl.[Entry No_]) as Rest_ReOffen10
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl   
Where cl.[Open] = '1'  and cl.[Document Type]= 2 and cl.[Payment Method Code] NOT IN ('PAYOLUTION','NAV_LAST','PENSIO_CC','PAYPAL','H_PAY_CC','ALIPAY','R_LAST','INVOICE','INVOICE_2')  and datediff(day,cl.[Posting Date],GETDATE()) > 10 
GROUP BY cl.[Payment Method Code]

SELECT cl.[Payment Method Code],count (cl.[Entry No_]) as Rest_ReOffen10   
FROM [urban_NAV600_SL].[dbo].[Urban-Brand GmbH$Cust_ Ledger Entry] as cl  
Where cl.[Open] = '1'  and cl.[Document Type]= 3 and cl.[Payment Method Code] NOT IN ('PAYOLUTION','NAV_LAST','PENSIO_CC','PAYPAL','H_PAY_CC','ALIPAY','R_LAST','INVOICE','INVOICE_2')  and datediff(day,cl.[Posting Date],GETDATE()) > 10 
GROUP BY cl.[Payment Method Code]


