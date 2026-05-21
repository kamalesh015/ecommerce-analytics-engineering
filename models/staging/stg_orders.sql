SELECT
    order_id,
    customer_id,
    order_status,
    CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_at,
    CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_at
FROM {{ source('raw_ecommerce', 'raw_orders') }}
WHERE order_status = 'delivered' -- We only want completed sales