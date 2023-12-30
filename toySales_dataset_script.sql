-- Combine tables together to create a dataset for dashboards 
SELECT 
b.Sale_ID,
a.Product_Name,
a.Product_Category,
c.Store_Name,
c.Store_City,
c.Store_Location,
c.Store_Open_Date,
b.Date,
d.Stock_On_Hand,
SUM(b.Units) AS 'Total_Units',
SUM(b.Units * a.Product_Price) AS 'Revenue'
FROM [toysales].[dbo].[products] a
JOIN [toysales].[dbo].[sales] b
ON a.Product_ID=b.Product_ID
JOIN [toysales].[dbo].[stores] c
ON b.Store_ID=c.Store_ID
JOIN [toysales].[dbo].[inventory] d
ON c.Store_ID=d.Store_ID
GROUP BY 
b.Sale_ID,
a.Product_Name,
a.Product_Category,
c.Store_Name,
c.Store_City,
c.Store_Location,
c.Store_Open_Date,
b.Date,
d.Stock_On_Hand