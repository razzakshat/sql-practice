USE SalesDB;
GO


SELECT 
*
FROM
       (SELECT
       ProductID,
       Price,
       AVG(Price) OVER () AVGPRICE
       FROM Sales.Products)t
where price > AvgPrice
