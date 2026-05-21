WITH user_first_purchase AS (
    -- Find the very first month a user made a purchase
    SELECT
        c.customer_unique_id,
        DATE_TRUNC(DATE(MIN(o.order_purchase_at)), MONTH) AS cohort_month
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_customers') }} c ON o.customer_id = c.customer_id
    GROUP BY 1
),

user_all_purchases AS (
    -- Get every month a user made a purchase
    SELECT
        c.customer_unique_id,
        DATE_TRUNC(DATE(o.order_purchase_at), MONTH) AS purchase_month
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_customers') }} c ON o.customer_id = c.customer_id
),

cohort_calc AS (
    -- Join them together to find the difference in months
    SELECT
        f.cohort_month,
        p.purchase_month,
        COUNT(DISTINCT p.customer_unique_id) AS active_customers,
        DATE_DIFF(p.purchase_month, f.cohort_month, MONTH) AS month_number
    FROM user_first_purchase f
    JOIN user_all_purchases p ON f.customer_unique_id = p.customer_unique_id
    GROUP BY 1, 2
)

SELECT
    cohort_month,
    month_number,
    active_customers
FROM cohort_calc
ORDER BY 1, 2