USE SalesDB
GO

SELECT *,
RANK() OVER (ORDER BY TotalSales DESC) Customerank
FROM
(SELECT 
CustomerID,
SUM(Sales) TotalSales
FROM Sales.Orders GROUP BY CUSTOMERID)t