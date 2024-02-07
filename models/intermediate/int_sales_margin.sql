SELECT orders_id, date_date
,SUM(revenue) AS revenue
,SUM(quantity) AS quantity
,SUM(CAST(purchase_price AS float64) * quantity) AS purchase_cost
,SUM(revenue - (CAST(purchase_price AS float64) * quantity)) AS margin
FROM {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
USING (products_id)
GROUP BY orders_id, date_date