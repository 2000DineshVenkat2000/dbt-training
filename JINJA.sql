{%- set category = ["Furnitue", "Office", "Technology"] -%}

SELECT
"OrderID",
{% for category in category %}
SUM(CASE WHEN "Category" = '{{category}}' then ORDERPROFIT end) AS {{category}}_OrderProfit
{% if not loop.last %}, {% endif %}
{% endfor %}
FROM {{ ref('stg_orders') }}
GROUP BY 1

/*
SELECT
"OrderID",

SUM(CASE WHEN "Category" = 'Furnitue' then ORDERPROFIT end) AS Furnitue_OrderProfit
, 

SUM(CASE WHEN "Category" = 'Office' then ORDERPROFIT end) AS Office_OrderProfit
, 

SUM(CASE WHEN "Category" = 'Technology' then ORDERPROFIT end) AS Technology_OrderProfit


FROM analytics.dbt_dm.stg_orders
GROUP BY 1
*/