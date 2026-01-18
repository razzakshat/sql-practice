USE SalesDB
GO

WITH customer_sales AS(
      SELECT 
          customer_id,
          SUM(amount) as TOTAL_SALES
      FROM Orders
      GROUP BY customer_id
      ),
last_order AS (
      SELECT
          customer_id,
          MAX(order_date) AS last_order_date
          FROM Orders
          GROUP BY customer_id),

ranked_customers AS (
    SELECT
          cs.customer_id,
          cs.total_sales,
          lo.last_order_date,
          RANK () OVER (ORDER BY cs.total_sales desc) AS sales_ranks
    FROM customer_sales cs
    JOIN last_order lo
          on cs.customer_id= lo.customer_id)

SELECT
    customer_id,
    total_sales,
    last_order_date,
    sales_rank,
    CASE
        WHEN total_sales >= 1000 THEN 'High Value'
        WHEN total_sales >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM ranked_customers;



  
