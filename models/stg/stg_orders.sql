SELECT 
O."OrderID",
O."OrderDate",
O."ShipDate",
O."ShipMode",
O."OrderSellingPrice" - O."OrderCostPrice" AS ORDERPROFIT,
C."CustomerName",
C."Segment",
C."Country",
P."Category",
P."ProductName",
P."SubCategory"
FROM {{ ref('raw_orders') }} AS O --FROM RAW.GLOBALMART.ORDERS
LEFT JOIN {{ ref('raw_customers') }} AS C
ON O."CustomerID" = C."CustomerID"
LEFT JOIN {{ ref('raw_products') }} AS P
ON O."ProductID" = P."ProductID"