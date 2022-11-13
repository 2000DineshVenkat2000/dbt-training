WITH
orders AS (
    SELECT * FROM {{ ref('raw_customers') }} 
)

SELECT
    "OrderID",
    SUM("OrderSellingPrice") AS TOTAL_SP,
FROM ORDERS
GROUP BY "OrderID"
HAVING TOTAL_SP < 0