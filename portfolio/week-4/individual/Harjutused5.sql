WITH kuu_ja_linna_myyk AS (
    SELECT
        c.city AS linn,
        DATE_TRUNC('month', s.sale_date) AS kuu,
        SUM(s.total_price) AS kuu_kaive
    FROM customers c
    JOIN sales s ON c.customer_id = s.customer_id
    -- LISASIME FILTRI: võtame ainult tehingud, mis on toimunud kuni tänaseni
    WHERE s.sale_date >= '2024-01-01' AND s.sale_date <= CURRENT_DATE 
    GROUP BY c.city, DATE_TRUNC('month', s.sale_date)
),
linna_edetabel AS (
    SELECT 
        linn,
        SUM(kuu_kaive) AS kogukaive,
        ROW_NUMBER() OVER (ORDER BY SUM(kuu_kaive) DESC) AS koht
    FROM kuu_ja_linna_myyk
    GROUP BY linn
)
SELECT 
    e.koht,
    t.linn,
    t.kuu,
    t.kuu_kaive,
    ROUND(100.0 * t.kuu_kaive / SUM(t.kuu_kaive) OVER (PARTITION BY t.kuu), 1) AS kuu_osakaal_protsent
FROM kuu_ja_linna_myyk t
JOIN linna_edetabel e ON t.linn = e.linn
WHERE e.koht <= 5
ORDER BY e.koht, t.kuu;