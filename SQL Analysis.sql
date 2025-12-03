-- Overall Revenue Summary
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_order_value,
    MIN(o.order_purchase_timestamp::DATE) AS first_order_date,
    MAX(o.order_purchase_timestamp::DATE) AS last_order_date
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
    AND o.order_purchase_timestamp >= '2017-01-01';

-- Monthly Revenue Trends
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
    AND o.order_purchase_timestamp >= '2017-01-01'
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY month;

-- YoY Growth Comparison (Jan-Aug 2017 vs Jan-Aug 2018)
WITH yearly_comparison AS (
    SELECT 
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COUNT(DISTINCT o.customer_id) AS total_customers,
        ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,
        ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
        AND o.order_purchase_timestamp >= '2017-01-01'
        AND o.order_purchase_timestamp <= '2018-08-31'
    GROUP BY EXTRACT(YEAR FROM o.order_purchase_timestamp)
)
SELECT 
    year,
    total_orders,
    total_customers,
    total_revenue,
    avg_order_value,
    LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue,
    ROUND(100.0 * (total_revenue - LAG(total_revenue) OVER (ORDER BY year)) / 
        LAG(total_revenue) OVER (ORDER BY year), 2) AS yoy_growth_pct
FROM yearly_comparison
ORDER BY year;

-- Revenue by Product Category (Top 10)
SELECT 
    COALESCE(pct.product_category_name_english, 'unknown_category') AS category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_price,
    ROUND(100.0 * SUM(oi.price) / SUM(SUM(oi.price)) OVER (), 2) AS revenue_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pct 
    ON p.product_category_name = pct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY COALESCE(pct.product_category_name_english, 'unknown_category')
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by Customer State (Top 10)
SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_order_value,
    ROUND(100.0 * SUM(oi.price) / SUM(SUM(oi.price)) OVER (), 2) AS revenue_pct,
    ROUND(100.0 * COUNT(DISTINCT o.order_id) / SUM(COUNT(DISTINCT o.order_id)) OVER (), 2) AS order_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
    AND o.order_purchase_timestamp >= '2017-01-01'
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;

-- State-Level YoY Growth (Jan-Aug 2017 vs 2018)
WITH state_yearly AS (
    SELECT 
        c.customer_state,
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
        ROUND(SUM(oi.price)::NUMERIC, 2) AS revenue
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
        AND o.order_purchase_timestamp >= '2017-01-01'
        AND o.order_purchase_timestamp <= '2018-08-31'
    GROUP BY c.customer_state, EXTRACT(YEAR FROM o.order_purchase_timestamp)
),
growth_calc AS (
    SELECT 
        customer_state,
        MAX(CASE WHEN year = 2017 THEN revenue END) AS revenue_2017,
        MAX(CASE WHEN year = 2018 THEN revenue END) AS revenue_2018
    FROM state_yearly
    GROUP BY customer_state
)
SELECT 
    customer_state,
    revenue_2017,
    revenue_2018,
    ROUND(100.0 * (revenue_2018 - revenue_2017) / NULLIF(revenue_2017, 0), 2) AS yoy_growth_pct
FROM growth_calc
WHERE revenue_2017 IS NOT NULL AND revenue_2018 IS NOT NULL
ORDER BY yoy_growth_pct DESC
LIMIT 15;
