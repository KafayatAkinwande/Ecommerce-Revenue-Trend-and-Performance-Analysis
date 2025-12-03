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
