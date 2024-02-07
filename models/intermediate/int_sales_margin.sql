SELECT orders_id, date_date, revenue, quantity, 
CAST(purchase_price AS float64) * quantity AS purchase_cost
, revenue - (CAST(purchase_price AS float64) * quantity) AS margin
FROM {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
USING (products_id)
