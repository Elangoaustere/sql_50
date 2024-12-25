WITH first_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM
        Delivery
    GROUP BY
        customer_id
)
SELECT round(avg(order_date=customer_pref_delivery_date)*100,2)as immediate_percentage
FROM delivery d
join first_orders 
where d.customer_id = first_orders.customer_id 
and d.order_date=first_orders.first_order_date