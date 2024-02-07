SELECT date_date 
, COUNT(orders_id) AS nb_transactions
, SUM(revenue) AS revenue
, AVG(revenue) AS average_basket
, SUM(margin) AS margin
, SUM(operational_margin) AS op_margin
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC