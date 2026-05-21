SELECT
    product_id,
    product_category_name AS category_name
FROM {{ source('raw_ecommerce', 'raw_products') }}