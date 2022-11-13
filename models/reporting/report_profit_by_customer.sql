SELECT 
    "CustomerID",
    "ProductName",
    "Category",
    "SubCategory",
    SUM(ORDERPROFIT) AS profit
FROM {{ ref('stg_orders') }}
GROUP BY
    "CustomerID",
    "ProductName",
    "Category",
    "SubCategory"