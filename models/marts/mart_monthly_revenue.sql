WITH order_details AS (
    SELECT
        o.order_id,
        o.order_purchase_at,
        i.price,
        i.shipping_cost
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_order_items') }} i ON o.order_id = i.order_id
)

SELECT
    DATE_TRUNC(DATE(order_purchase_at), MONTH) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2) AS total_product_revenue,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_revenue,
    ROUND(SUM(price + shipping_cost), 2) AS total_revenue
FROM order_details
GROUP BY 1
ORDER BY 1