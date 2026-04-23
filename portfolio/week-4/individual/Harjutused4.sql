WITH kuu_myyk AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS käive
    FROM sales
    WHERE sale_date >= '2024-01-01'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    käive,
    LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu,
    käive - LAG(käive) OVER (ORDER BY kuu) AS kasv,
    ROUND(
        100.0 * (käive - LAG(käive) OVER (ORDER BY kuu))
        / LAG(käive) OVER (ORDER BY kuu), 1
    ) AS kasv_protsent
FROM kuu_myyk
ORDER BY kuu;

WITH toodete_myyk AS (
    SELECT 
        p.category, 
        p.product_name, 
        SUM(s.quantity) AS kogus,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(s.quantity) DESC) AS edetabeli_koht
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.category, p.product_name
)
SELECT 
    category, 
    product_name, 
    kogus, 
    edetabeli_koht
FROM toodete_myyk 
WHERE edetabeli_koht <= 3
ORDER BY category, edetabeli_koht;