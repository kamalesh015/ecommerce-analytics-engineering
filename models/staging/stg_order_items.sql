SELECT
    order_id,
    order_item_id,
    product_id,
    price,
    freight_value AS shipping_cost
FROM {{ source('raw_ecommerce', 'raw_order_items') }}