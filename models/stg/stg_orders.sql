SELECT 
{{ dbt_utils.surrogate_key(['O."OrderID"','P."ProductID"', 'C."CustomerID"']) }} AS SK_ORDERS,
O."OrderID",
O."OrderDate",
O."ShipDate",
O."ShipMode",
O."OrderSellingPrice" - O."OrderCostPrice" AS ORDERPROFIT,
C."CustomerID",
C."CustomerName",
C."Segment",
C."Country",
P."ProductID",
P."Category",
P."ProductName",
P."SubCategory",
{{ markup('"OrderSellingPrice"', '"OrderCostPrice"') }} AS MARKUP,
D.delivery_team
FROM {{ ref('raw_orders') }} AS O --FROM RAW.GLOBALMART.ORDERS
LEFT JOIN {{ ref('raw_customers') }} AS C
ON O."CustomerID" = C."CustomerID"
LEFT JOIN {{ ref('raw_products') }} AS P
ON O."ProductID" = P."ProductID"
LEFT JOIN {{ ref('delivery_team') }} AS D
ON O."ShipMode" = D.ShipMode


-- {{ limit_data_in_dev('"OrderDate"') }}