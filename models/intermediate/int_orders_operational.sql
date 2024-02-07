--Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT 
shipping_fee, 
logcost, 
ship_cost, 
(margin + shipping_fee - logcost - CAST(ship_cost as float64)) AS operational_margin
FROM {{ref("stg_raw__ship")}}
JOIN {{ref("int_sales_margin")}}
USING (orders_id)