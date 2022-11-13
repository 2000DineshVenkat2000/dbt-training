SELECT 
    "ProductID",
    "ProductName",
    "Category",
    "SubCategory",
    SUM(ORDERPROFIT) AS profit
FROM {{ ref('stg_orders') }}
GROUP BY
    "ProductID",
    "ProductName",
    "Category",
    "SubCategory"