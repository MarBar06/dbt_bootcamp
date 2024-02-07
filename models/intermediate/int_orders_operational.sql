--Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT  
date_date
, orders_id 
, SUM(revenue) AS revenue 
, SUM(margin) AS margin 
, SUM(shipping_fee) AS shipping_fee
, SUM(logcost) AS logcost 
, SUM(CAST(ship_cost as float64)) AS ship_cost
, SUM(margin)+SUM(shipping_fee)-SUM(logcost)-SUM(CAST(ship_cost as float64)) AS operational_margin
FROM {{ref("stg_raw__ship")}}
JOIN {{ref("int_sales_margin")}}
USING (orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC